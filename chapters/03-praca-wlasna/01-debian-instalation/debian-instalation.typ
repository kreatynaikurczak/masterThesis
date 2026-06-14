== Instalacja systemu operacyjnego Debian na laptopie Lenovo T470

Pierwszym etapem prac praktycznych było przygotowanie środowiska systemowego. Zdecydowano się na wybór dystrybucji Debian GNU/Linux w wersji 12 (Bookworm), która charakteryzuje się wysoką stabilnością oraz szerokim wsparciem społeczności, co jest kluczowe w projektach o charakterze badawczym i inżynierskim.

=== Charakterystyka sprzętowa

Proces instalacji przeprowadzono na laptopie Lenovo ThinkPad T470. Model ten jest powszechnie ceniony za wysoką kompatybilność z systemami z rodziny Linux. Kluczowe parametry techniczne wykorzystanego urządzenia zestawiono poniżej:
- Procesor: Intel Core i5-7300U,
- Pamięć RAM: 16 GB DDR4,
- Dysk: 256 GB SSD NVMe,
- Karta sieciowa: Intel Dual Band Wireless-AC 8265.

#figure(
  image("images/t470.png", width: 80%),
  caption: [Widok ogólny laptopa Lenovo ThinkPad T470 wykorzystanego w badaniach.],
) <fig:t470-hardware>

=== Przygotowanie nośnika instalacyjnego

Proces rozpoczęto od pobrania oficjalnego obrazu ISO typu „netinst” z serwerów projektu Debian. Wykorzystanie obrazu sieciowego umożliwiło instalację najnowszych wersji pakietów już na etapie wdrażania systemu. Obraz został przeniesiony na nośnik USB o pojemności 16 GB przy użyciu systemowego narzędzia `dd` w środowisku Linux. Operację wykonano przy użyciu następującego polecenia:

```bash
sudo dd if=debian-12-netinst-amd64.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

=== Konfiguracja BIOS/UEFI

Przed przystąpieniem do właściwej instalacji konieczne było dostosowanie ustawień oprogramowania układowego (UEFI) urządzenia. Kluczowe modyfikacje objęły:
1. Wyłączenie funkcji *Secure Boot*, co zapewnia bezproblemowe ładowanie modułów jądra.
2. Ustawienie trybu pracy kontrolera pamięci masowej na *AHCI*.
3. Zmianę priorytetu urządzeń rozruchowych, ustawiając nośnik USB jako nadrzędny.

=== Przebieg instalacji

Po uruchomieniu komputera z przygotowanego nośnika wybrano tryb *Graphical Install*. Proces przebiegał zgodnie z następującymi etapami:

1. **Konfiguracja regionalna**: Wybrano język polski oraz układ klawiatury programisty.
2. **Konfiguracja sieci**: Dzięki zintegrowaniu w jądrze systemu Debian 12 sterowników z sekcji *non-free-firmware*, karta sieciowa Intel została poprawnie zidentyfikowana, co umożliwiło nawiązanie połączenia bezprzewodowego w trakcie instalacji.
3. **Partycjonowanie dysku**: Zastosowano automatyczne partycjonowanie całej przestrzeni dyskowej z wykorzystaniem mechanizmu LVM (Logical Volume Manager). Wybór ten podyktowany był elastycznością w przyszłym zarządzaniu wolumenami logicznymi.
4. **Wybór oprogramowania**: Zdecydowano o pominięciu instalacji środowiska graficznego. Wybrano jedynie podstawowe narzędzia systemowe (*Standard system utilities*) oraz serwer SSH (*SSH server*). Takie podejście pozwoliło na minimalizację narzutu systemowego i zwiększenie poziomu bezpieczeństwa stacji roboczej.

=== Konfiguracja poinstalacyjna

Po pomyślnym zakończeniu procesu i ponownym uruchomieniu urządzenia, przeprowadzono kroki konfiguracyjne:
- Dodanie konta użytkownika do grupy `sudo`, umożliwiając zarządzanie systemem z uprawnieniami administratora.
- Weryfikacja pliku `/etc/apt/sources.list` pod kątem obecności repozytoriów `main`, `contrib` oraz `non-free-firmware`.
- Wykonanie pełnej aktualizacji pakietów systemowych poleceniem `sudo apt update && sudo apt upgrade`.

System Debian 12 na platformie Lenovo T470 wykazał pełną kompatybilność sprzętową bezpośrednio po instalacji, co stanowi stabilny fundament dla dalszych prac badawczych.
