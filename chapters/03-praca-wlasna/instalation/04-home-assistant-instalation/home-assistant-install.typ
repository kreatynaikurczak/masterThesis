=== Instalacja i konfiguracja platformy Home Assistant
<sec:home-assistant-installation>

Ostatnim etapem budowy fundamentów infrastruktury serwerowej było wdrożenie platformy Home Assistant. Jest to otwartoźródłowe oprogramowanie służące do centralnego zarządzania automatyką domową, które integruje tysiące urządzeń od różnych producentów w ramach jednego, spójnego interfejsu.

==== Wybór metody instalacji

Zdecydowano się na wersję *Home Assistant Container*. Wybór ten, w przeciwieństwie do wersji *Home Assistant OS* lub *Supervised*, zapewnia pełną kontrolę nad systemem operacyjnym gospodarza oraz pozwala na współdzielenie zasobów z innymi usługami działającymi w kontenerach (takimi jak broker MQTT).

==== Konfiguracja usługi w Docker Compose

Usługa Home Assistant została dodana do infrastruktury kontenerowej. W katalogu głównym projektu utworzono folder `~/homeassistant`, a definicję kontenera umieszczono w pliku `docker-compose.yml`:

```yaml
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - ~/homeassistant/config:/config
      - /etc/localtime:/etc/localtime:ro
    restart: always
    privileged: true
    network_mode: host
```

Zastosowanie `network_mode: host` jest kluczowe dla poprawnego działania wielu integracji, szczególnie tych opartych na rozgłaszaniu mDNS (np. wykrywanie urządzeń w sieci lokalnej). Flaga `privileged: true` umożliwia kontenerowi dostęp do portów szeregowych i sprzętu, co może być przydatne przy ewentualnej rozbudowie o adaptery Zigbee lub Z-Wave.

==== Pierwsze uruchomienie i konfiguracja wstępna

Po uruchomieniu kontenera za pomocą `docker-compose up -d`, interfejs webowy stał się dostępny pod adresem IP serwera na porcie 8123. Proces wstępnej konfiguracji (Onboarding) objął:
1. Utworzenie konta administratora.
2. Określenie lokalizacji geograficznej (niezbędne do automatyzacji opartych na wschodzie i zachodzie słońca).
3. Podstawowe skanowanie sieci w celu wykrycia dostępnych urządzeń.

==== Integracja z brokerem MQTT

Kluczowym krokiem z punktu widzenia realizowanego projektu była integracja Home Assistant z wcześniej uruchomionym brokerem Mosquitto. W tym celu:
1. Przejdzono do sekcji *Ustawienia* -> *Urządzenia oraz usługi*.
2. Dodano nową integrację *MQTT*.
3. Jako adres brokera podano `localhost` (ze względu na działanie w trybie sieciowym hosta) oraz standardowy port `1883`.

Pomyślna konfiguracja integracji pozwoliła na automatyczne wykrywanie urządzeń wspierających standard *MQTT Discovery* oraz umożliwiła ręczne definiowanie encji (czujników i przełączników) w pliku konfiguracyjnym `configuration.yaml`. Stanowi to gotową bazę do podłączenia węzłów opartych na układach ESP32.
