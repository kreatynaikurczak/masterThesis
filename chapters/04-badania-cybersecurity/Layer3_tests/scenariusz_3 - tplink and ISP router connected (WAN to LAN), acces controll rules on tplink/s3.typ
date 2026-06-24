=== Scenariusz 3: Połączenie routerów (WAN-LAN) z włączonymi regułami kontroli dostępu

Trzeci scenariusz badawczy stanowi rozwinięcie scenariusza drugiego. Układ fizyczny połączeń pozostał bez zmian (port WAN routera TP-Link połączony z portem LAN routera ISP). Wprowadzono jednak kluczową modyfikację w konfiguracji logicznej routera TP-Link – aktywowano funkcję kontroli dostępu (Access Control). Stan wdrożenia reguły zaprezentowano na @fig-s3-acl-config.

#figure(
  image("images/scenariusz_1_tplink_access_controll_rule_managment_enable.png", width: 90%),
  caption: [Interfejs zarządzania routera TP-Link z aktywną regułą blokowania ruchu do sieci domowej],
) <fig-s3-acl-config>

Topologię logiczną tego układu w programie Cisco Packet Tracer przedstawiono na @fig-s3-packet-tracer.

#figure(
  image("images/cisco_packet_tracer.png", width: 90%),
  caption: [Schemat symulacji w programie Cisco Packet Tracer dla Scenariusza 3],
) <fig-s3-packet-tracer>


Reguła ta została zaimplementowana w następujący sposób:
- *Źródło (Source)*: Wszystkie hosty z sieci bezprzewodowej IoT (`192.168.8.0/24`).
- *Cel (Destination)*: Zakres adresów IP odpowiadający sieci nadrzędnej/domowej (`192.168.1.0/24`).
- *Działanie (Action)*: Zablokowanie (Deny/Block) każdego rodzaju ruchu.
- *Ruch pozostały*: Zezwolenie na ruch kierowany do pozostałych adresów IP (np. sieci Internet).

Wyniki testów komunikacyjnych przeprowadzonych z laptopa testowego (`192.168.8.101`) przedstawiono na zrzucie ekranu (@fig-s3-ping-img).

#figure(
  image("images/ping_results.png", width: 90%),
  caption: [Wyniki testów ping dla Scenariusza 3],
) <fig-s3-ping-img>

==== Analiza wyników i wnioski

1. *Komunikacja lokalna (Wi-Fi)*:
   Ping do adresu `192.168.8.100` zakończył się sukcesem. Wynika to z faktu, że reguła kontroli dostępu na TP-Link dotyczy wyłącznie interfejsu WAN. Komunikacja wewnątrz sieci LAN/WLAN nie jest filtrowana przez reguły zapory sieciowej routera. Umożliwia to mikrokontrolerom ESP bezproblemową i bezpośrednią komunikację z serwerem Debian (brokerem MQTT) na interfejsie bezprzewodowym.
   
2. *Komunikacja z siecią nadrzędną (Ethernet)*:
   Próba pingowania adresu `192.168.1.17` (interfejs przewodowy serwera) zakończyła się całkowitym niepowodzeniem (100% strat pakietów). Router TP-Link, po odebraniu pakietu zaadresowanego do sieci `192.168.1.0/24`, dopasował go do zdefiniowanej reguły blokującej i odrzucił go przed wysłaniem na interfejs WAN. Cel izolacji został osiągnięty.
   
3. *Komunikacja z siecią Internet*:
   Ping do adresu `8.8.8.8` przebiegł pomyślnie. Ponieważ cel ten nie pasował do zdefiniowanej reguły blokującej (sieć `192.168.1.0/24`), ruch został przetłumaczony (NAT) i przesłany dalej do bramy ISP, a stamtąd do internetu.

==== Wnioski dotyczące bezpieczeństwa

Konfiguracja przetestowana w Scenariuszu 3 stanowi rekomendowaną metodę wdrażania bezpiecznych systemów automatyki domowej w środowisku domowym. Zapewnia ona optymalną równowagę między bezpieczeństwem a funkcjonalnością:

- *Skuteczna izolacja*: Ewentualne przejęcie kontroli przez napastnika nad dowolnym urządzeniem IoT (np. mikrokontrolerem ESP) nie daje mu możliwości skanowania, komunikacji ani atakowania urządzeń znajdujących się w głównej domowej sieci LAN.
- *Funkcjonalność lokalna i zdalna*: Urządzenia IoT mogą komunikować się z lokalnym brokerem MQTT na adresie `192.168.8.100`, a jednocześnie zachowują dostęp do internetu, co umożliwia im np. synchronizację czasu (NTP), pobieranie aktualizacji oprogramowania (OTA) czy komunikację z chmurami zewnętrznymi (np. Home Assistant Cloud, Blynk).

Warto zauważyć, że w tej konfiguracji serwer Debian pełni rolę tzw. "bastionu" (dual-homed bastion host). Z racji podłączenia do obu podsieci stanowi on krytyczny punkt architektury bezpieczeństwa. Jeśli serwer Debian zostanie skompromitowany, napastnik uzyska dostęp do obu sieci. W związku z tym zabezpieczenie samego serwera (np. poprzez reguły firewall `ufw` na serwerze, wyłączenie niepotrzebnych usług, silne uwierzytelnianie) musi być traktowane priorytetowo.
