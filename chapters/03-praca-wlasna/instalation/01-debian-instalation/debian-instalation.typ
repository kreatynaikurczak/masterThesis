=== Instalacja systemu operacyjnego Debian na laptopie Lenovo T470

Pierwszym etapem prac praktycznych było przygotowanie środowiska systemowego. Zdecydowano się na wybór dystrybucji Debian GNU/Linux, która charakteryzuje się wysoką stabilnością oraz szerokim wsparciem społeczności, co jest kluczowe w projektach o charakterze badawczym i inżynierskim.

==== Charakterystyka sprzętowa

Proces instalacji przeprowadzono na laptopie Lenovo ThinkPad T470. Kluczowe parametry techniczne tego urządzenia zestawiono poniżej:
- Procesor: Intel Core i5-7300U,
- Pamięć RAM: 16 GB DDR4,
- Dysk: 256 GB SSD NVMe,
- Karta sieciowa: Intel Dual Band Wireless-AC 8265.

#figure(
  image("images/t470.png", width: 80%),
  caption: [Widok ogólny laptopa Lenovo ThinkPad T470 wykorzystanego w projekcie jako serwer.],
) <fig:t470-hardware>

==== Przygotowanie nośnika instalacyjnego

Proces rozpoczęto od pobrania oficjalnego obrazu ISO z serwerów projektu Debian. Wykorzystanie obrazu sieciowego umożliwiło instalację najnowszych wersji pakietów już na etapie wdrażania systemu. Obraz został przeniesiony na nośnik USB o pojemności 16 GB przy użyciu systemowego narzędzia `dd` w środowisku Linux.

==== Konfiguracja BIOS/UEFI

Przed przystąpieniem do właściwej instalacji trzeba było dostosować ustawienia UEFI urządzenia. Głównie chodziło o zmianę priorytetu urządzeń rozruchowych w taki sposób, aby nośnik USB był nadrzędny.

==== Przebieg instalacji

Po uruchomieniu komputera z przygotowanego nośnika proces przebiegał zgodnie ze standardową procedurą instalacji. Następnie po pomyślnym zakończeniu procesu i ponownym uruchomieniu urządzenia dodano konto użytkownika do grupy `sudo`, umożliwiając zarządzanie systemem z uprawnieniami administratora oraz wykonano pełną aktualizację pakietów systemowych poleceniem `sudo apt update && sudo apt upgrade`. W ten sposób uzyskano stabilny fundament do dalszych prac badawczych i eksperymentów z systemem Home Assistant.
