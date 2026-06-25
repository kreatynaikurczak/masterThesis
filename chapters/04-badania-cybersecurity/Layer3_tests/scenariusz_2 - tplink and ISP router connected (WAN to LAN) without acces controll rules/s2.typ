=== Scenariusz 2: Połączenie routerów (WAN-LAN) bez reguł kontroli dostępu

W drugim scenariuszu badawczym router TP-Link został fizycznie połączony portem WAN z portem LAN routera dostawcy (ISP). Konfiguracja ta odzwierciedla powszechnie stosowany schemat kaskadowego łączenia routerów (tzw. podwójny NAT), gdzie sieć IoT (`192.168.8.0/24`) znajduje się za routerem TP-Link, a główna sieć domowa/ISP (`192.168.1.0/24`) stanowi sieć nadrzędną. W tym scenariuszu na routerze TP-Link nie skonfigurowano żadnych dodatkowych reguł zapory sieciowej ani kontroli dostępu (Access Control). Stan funkcji kontroli dostępu na routerze przedstawiono na @fig-s2-acl-config.

#figure(
  image("images/scenariusz_1_tplink_access_controll_rule_managment.png", width: 90%),
  caption: [Interfejs zarządzania routera TP-Link z wyłączoną funkcją kontroli dostępu],
) <fig-s2-acl-config>

Topologię logiczną tego układu w programie Cisco Packet Tracer przedstawiono na @fig-s2-packet-tracer.

#figure(
  image("images/cisco_packet_tracer.png", width: 90%),
  caption: [Schemat symulacji w programie Cisco Packet Tracer dla Scenariusza 2],
) <fig-s2-packet-tracer>


Celem testu było sprawdzenie, czy domyślne mechanizmy routingu i NAT na routerze TP-Link zapewniają izolację sieci domowej przed dostępem z sieci IoT. Wyniki prób pingowania z laptopa testowego (`192.168.8.101`) do wybranych celów przedstawiono na @fig-s2-ping-img.


#figure(
  image("images/ping_results.png", width: 90%),
  caption: [Wyniki testów ping dla Scenariusza 2],
) <fig-s2-ping-img>

==== Analiza wyników i wnioski

1. *Komunikacja lokalna (Wi-Fi)*:
  Ping do adresu `192.168.8.100` przebiegł pomyślnie. Zmiana fizycznej konfiguracji routera (podłączenie portu WAN) nie wpłynęła na komunikację wewnątrz lokalnego przełącznika i punktu dostępowego Wi-Fi routera TP-Link.

2. *Komunikacja z siecią nadrzędną (Ethernet)*:
  Próba pingowania interfejsu przewodowego serwera (`192.168.1.17`) zakończyła się *sukcesem* (0% strat pakietów). Czas odpowiedzi (RTT ok. 3,8 ms) był bardzo niski ze względu na bezpośrednie połączenie kablowe routerów. Wartość pola TTL w pakietach zwrotnych wyniosła 63. Ponieważ domyślna wartość TTL dla systemów operacyjnych Linux wynosi 64, zmniejszenie jej o 1 oznacza, że pakiet przeszedł przez dokładnie jedno urządzenie pośredniczące (router TP-Link).

3. *Komunikacja z siecią Internet*:
  Ping do adresu `8.8.8.8` również zakończył się sukcesem. Urządzenie z sieci IoT bez przeszkód komunikowało się z zewnętrznym internetem przez kaskadę routerów (TP-Link oraz router ISP).

==== Wykazanie luki bezpieczeństwa

Wyniki tego testu dowodzą obecności poważnej luki w zabezpieczeniach domyślnej konfiguracji sieci kaskadowej. Powszechne przekonanie, że umieszczenie urządzeń IoT za osobnym routerem chroni domową sieć LAN, jest błędne.

- *Jednokierunkowa ochrona (Ingress)*: Mechanizm NAT (Network Address Translation) realizowany przez router TP-Link chroni sieć IoT przed bezpośrednim dostępem inicjowanym z sieci nadrzędnej (`192.168.1.0/24`). Urządzenia z sieci domowej nie mogą bezpośrednio nawiązać połączenia z mikrokontrolerami ESP (chyba że zostaną skonfigurowane reguły przekierowania portów).
- *Brak izolacji ruchu wychodzącego (Egress)*: Router TP-Link traktuje podsieć `192.168.1.0/24` (sieć domową/ISP) jako część interfejsu WAN, czyli jako sieć zewnętrzną. W związku z tym domyślnie zezwala na trasowanie i translację (NAT) każdego ruchu wychodzącego z sieci IoT do sieci domowej.

Konfiguracja ta stwarza wysokie ryzyko dla bezpieczeństwa. Jeśli napastnik przejmie kontrolę nad podatnym mikrokontrolerem ESP (np. poprzez lukę w oprogramowaniu lub atak na protokół komunikacyjny), może on potraktować to urządzenie jako punkt wyjścia do dalszej eksploracji i ataków na urządzenia w sieci domowej (`192.168.1.0/24`), takie jak komputery osobiste, serwery NAS czy systemy monitoringu wizyjnego.
