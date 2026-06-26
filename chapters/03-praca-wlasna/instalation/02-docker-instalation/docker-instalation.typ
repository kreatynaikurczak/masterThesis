=== Konteneryzacja środowiska przy użyciu platformy Docker
<sec:docker-installation>

Po skonfigurowaniu systemu operacyjnego Debian, kolejnym krokiem było wdrożenie platformy Docker. Konteneryzacja pozwala na izolację poszczególnych usług (takich jak broker MQTT czy Home Assistant), co znacząco ułatwia zarządzanie zależnościami oraz migrację systemu między różnymi platformami sprzętowymi.

==== Instalacja silnika Docker Engine

Proces instalacji przeprowadzono zgodnie z oficjalną dokumentacją, wykorzystując repozytoria producenta w celu zapewnienia dostępu do najnowszych wersji oprogramowania.

1. *Aktualizacja indeksu pakietów i instalacja zależności*:
  W pierwszej kolejności zainstalowano pakiety umożliwiające bezpieczną komunikację z repozytoriami przez protokół HTTPS:
  ```bash
  sudo apt update
  sudo apt install ca-certificates curl gnupg
  ```

2. *Dodanie oficjalnego klucza GPG Docker*:
  Klucz służy do weryfikacji autentyczności pobieranych pakietów:
  ```bash
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  ```

3. *Instalacja pakietów Docker*:
  Po zaktualizowaniu listy repozytoriów, zainstalowano silnik Docker oraz wtyczkę Docker Compose:
  ```bash
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```

==== Konfiguracja poinstalacyjna

Domyślnie demon Docker wymaga uprawnień administratora. Aby umożliwić zarządzanie kontenerami bez każdorazowego użycia polecenia `sudo`, dodano bieżącego użytkownika do grupy `docker`:

```bash
sudo usermod -aG docker $USER
```

Zmiana ta wymagała ponownego zalogowania się do systemu, aby nowa przynależność do grupy została uwzględniona w bieżącej sesji.

==== Weryfikacja poprawności instalacji

Poprawność wdrożenia zweryfikowano poprzez uruchomienie testowego kontenera `hello-world`:

```bash
docker run hello-world
```

Pomyślne wykonanie tego polecenia potwierdziło, że silnik Docker jest poprawnie zainstalowany, a użytkownik posiada niezbędne uprawnienia do zarządzania kontenerami.

==== Wykorzystanie Docker Compose

W dalszych etapach pracy, zamiast pojedynczych poleceń `docker run`, zdecydowano się na wykorzystanie narzędzia Docker Compose. Pozwala ono na definiowanie całej infrastruktury w formie deklaratywnych plików `docker-compose.yml`, co zapewnia powtarzalność konfiguracji i ułatwia dokumentowanie wdrożonych usług.
