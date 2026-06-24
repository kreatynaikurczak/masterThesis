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

Topologię logiczną przygotowanego stanowiska badawczego przedstawiono na @fig-network-topology.

#figure(
  block(
    width: 100%,
    stroke: 1pt + luma(180),
    inset: 15pt,
    radius: 8pt,
    fill: luma(250),
    [
      #grid(
        columns: (1fr, 25pt, 1.2fr, 25pt, 1fr),
        align: horizon + center,
        stack(
          spacing: 12pt,
          text(weight: "bold", fill: rgb("0066cc"))[Sieć IoT (LAN)\ `192.168.8.0/24`],
          rect(width: 100%, stroke: 1pt + rgb("0066cc"), fill: rgb("f0f8ff"), radius: 4pt, inset: 8pt)[
            *Laptop testowy* \ (Atakujący/IoT) \ `192.168.8.101`
          ],
          rect(width: 100%, stroke: 1pt + rgb("0066cc"), fill: rgb("f0f8ff"), radius: 4pt, inset: 8pt)[
            *Urządzenia ESP* \ (Automatyka IoT) \ `192.168.8.X`
          ],
        ),
        text(size: 16pt, fill: rgb("0066cc"))[#sym.arrow.l.r],
        stack(
          spacing: 15pt,
          rect(width: 100%, stroke: 1.5pt + rgb("00cc66"), fill: rgb("f0fff0"), radius: 4pt, inset: 10pt)[
            *Router IoT (TP-Link)* \
            LAN: `192.168.8.1` \
            WAN: `192.168.1.32`
          ],
          rect(width: 100%, stroke: 2pt + rgb("cc0000"), fill: rgb("fff0f0"), radius: 6pt, inset: 10pt)[
            *Serwer Debian* \
            (Broker MQTT / Serwer) \
            Wi-Fi: `192.168.8.100` \
            Eth: `192.168.1.17`
          ],
        ),
        text(size: 16pt, fill: rgb("cc0000"))[#sym.arrow.l.r],
        stack(
          spacing: 12pt,
          text(weight: "bold", fill: rgb("666666"))[Sieć domowa / ISP\ `192.168.1.0/24`],
          rect(width: 100%, stroke: 1pt + rgb("666666"), fill: rgb("f9f9f9"), radius: 4pt, inset: 8pt)[
            *Router ISP* \
            IP: `192.168.1.1`
          ],
          rect(width: 100%, stroke: 1pt + rgb("333333"), fill: rgb("eeeeee"), radius: 4pt, inset: 8pt)[
            *Internet (DNS)* \
            IP: `8.8.8.8`
          ],
        ),
      )
    ],
  ),
  caption: [Topologia sieciowa stanowiska badawczego],
) <fig-network-topology>

W dalszej części rozdziału przedstawiono szczegółową analizę przeprowadzonych testów bezpieczeństwa podzielonych na testy w warstwie sieciowej (Layer 3) oraz testy w warstwie aplikacji (Layer 4).
