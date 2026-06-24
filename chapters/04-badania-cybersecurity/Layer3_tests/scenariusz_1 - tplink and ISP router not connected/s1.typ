=== Scenariusz 1: Brak połączenia fizycznego routera TP-Link z siecią domową (ISP)

W pierwszym scenariuszu badawczym przetestowano zachowanie sieci w sytuacji pełnej izolacji fizycznej. Router TP-Link (obsługujący sieć IoT) nie został połączony swoim portem WAN z siecią domową/ISP. Oznacza to, że podsieć bezprzewodowa `192.168.8.0/24` funkcjonowała jako sieć całkowicie lokalna i zamknięta (offline). Topologię logiczną tego układu w programie Cisco Packet Tracer przedstawiono na @fig-s1-packet-tracer.

#figure(
  image("images/cisco_packet_tracer.png", width: 90%),
  caption: [Schemat symulacji w programie Cisco Packet Tracer dla Scenariusza 1],
) <fig-s1-packet-tracer>


Celem testu było sprawdzenie możliwości komunikacji laptopa testowego (`192.168.8.101`) z interfejsem bezprzewodowym serwera (`192.168.8.100`), jego interfejsem przewodowym (`192.168.1.17`) należącym do sieci nadrzędnej, oraz z hostem w sieci Internet (`8.8.8.8`). Wyniki testu przedstawiono na zrzucie ekranu (@fig-s1-ping-img).


#figure(
  image("images/ping_results.png", width: 90%),
  caption: [Wyniki testów ping dla Scenariusza 1],
) <fig-s1-ping-img>

==== Analiza wyników i wnioski

1. *Komunikacja lokalna (Wi-Fi)*:
  Próba połączenia z adresem `192.168.8.100` zakończyła się pełnym sukcesem (0% utraconych pakietów, średni czas RTT wyniósł ok. 75,9 ms). Wynika to z faktu, że oba urządzenia znajdują się w tej samej sieci fizycznej i logicznej (warstwa 2 i 3). Ruch sieciowy odbywa się wewnątrz punktu dostępowego routera TP-Link i nie wymaga zaangażowania mechanizmów routingu.

2. *Komunikacja z siecią nadrzędną (Ethernet)*:
  Próba wysłania pakietów ICMP Echo Request do adresu `192.168.1.17` (karta przewodowa serwera) zakończyła się niepowodzeniem (100% strat pakietów). Laptop testowy wysyła pakiety do swojej bramy domyślnej (`192.168.8.1`), jednak ze względu na brak połączenia fizycznego portu WAN routera TP-Link z siecią nadrzędną oraz brak wpisu w tablicy routingu dla sieci `192.168.1.0/24`, pakiety te nie mogą zostać dostarczone.

3. *Komunikacja z siecią Internet*:
  Próba pingowania adresu `8.8.8.8` również zakończyła się niepowodzeniem. Router TP-Link (`192.168.8.1`) odesłał komunikaty ICMP `Destination Net Unreachable` (Host docelowy jest nieosiągalny). Wynika to z braku aktywnego połączenia WAN (brak adresu IP WAN oraz bramy domyślnej po stronie WAN routera TP-Link), co uniemożliwia wyznaczenie trasy do sieci zewnętrznych.

Podsumowując, Scenariusz 1 wykazuje pełną, szczelną izolację sieci IoT od sieci domowej oraz od internetu. Choć taka konfiguracja charakteryzuje się najwyższym poziomem bezpieczeństwa (uniemożliwia ataki z zewnątrz oraz wyciek danych), to może być niepraktyczna w wielu zastosowaniach automatyki domowej. Uniemożliwia ona bowiem korzystanie z internetu z poziomu sieci IoT.
