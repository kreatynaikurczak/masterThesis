= Badania bezpieczeństwa systemu

== Wstęp i opis stanowiska badawczego

Celem tego rozdziału jest przeprowadzenie testów bezpieczeństwa zaprojektowanego i wdrożonego systemu automatyki domowej, opartego na mikrokontrolerach ESP oraz protokole MQTT. Ze względu na podatność urządzeń Internetu Rzeczy (IoT), które często posiadają ograniczone zasoby obliczeniowe i mogą być podatne na różnego rodzaju ataki sieciowe, kluczowym elementem ochrony systemu jest zapewnienie odpowiedniej izolacji sieciowej na poziomie warstwy 3 (sieciowej) oraz kontrola dostępu w wyższych warstwach modelu OSI/ISO.

W celu zasymulowania rzeczywistych warunków pracy systemu oraz potencjalnych zagrożeń, przygotowano dedykowane stanowisko badawcze. Głównym założeniem projektowym było odseparowanie urządzeń IoT od głównej sieci domowej użytkownika, w której mogą znajdować się wrażliwe urządzenia (np. komputery osobiste, serwery NAS). Do realizacji tego zadania wykorzystano dwuinterfejsowy (dual-homed) serwer oparty na systemie Debian oraz router TP-Link, który tworzy osobną podsieć dla urządzeń automatyki domowej.

Stanowisko badawcze składa się z następujących komponentów:
1. *Dwuinterfejsowy serwer Debian*:
  - Pełni rolę centralnej jednostki zarządzającej automatyką domową (broker MQTT, serwer aplikacji).
  - Wyposażony jest w dwie karty sieciowe:
    - Interfejs bezprzewodowy (Wi-Fi) o adresie IP `192.168.8.100`, podłączony do sieci IoT.
    - Interfejs przewodowy (Ethernet) o adresie IP `192.168.1.17`, podłączony do sieci domowej/ISP.
2. *Router IoT (TP-Link)*:
  - Tworzy odseparowaną sieć bezprzewodową dla urządzeń automatyki domowej.
  - Adres IP interfejsu LAN routera to `192.168.8.1` (podsieć `192.168.8.0/24`).
  - Port WAN routera jest podłączony do portu LAN routera dostawcy usług internetowych (ISP). Adres IP interfejsu WAN jest przydzielany dynamicznie (DHCP) z puli sieci nadrzędnej `192.168.1.0/24` (w warunkach testowych router otrzymał adres `192.168.1.32`).
3. *Laptop testowy (system Linux)*:
  - Działa w podsieci IoT pod adresem IP `192.168.8.101`.
  - W badaniach symuluje zainfekowane lub nieautoryzowane urządzenie IoT próbujące uzyskać dostęp do innych segmentów sieci.
4. *Router ISP i Internet*:
  - Reprezentują sieć domową nadrzędną (`192.168.1.0/24`) oraz sieć globalną.
  - Adres bramy domyślnej w sieci ISP to `192.168.1.1`. Jako cel testów dostępności usług zewnętrznych wykorzystano publiczny serwer DNS Google o adresie IP `8.8.8.8`.


W dalszej części rozdziału przedstawiono szczegółową analizę przeprowadzonych testów bezpieczeństwa podzielonych na testy w warstwie sieciowej (Layer 3) oraz testy w warstwie aplikacji (Layer 4).
