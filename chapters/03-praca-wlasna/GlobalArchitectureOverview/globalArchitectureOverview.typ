W niniejszym rozdziale przedstawiono szczegółowy opis implementacji systemu automatyki domowej, opartego na rozproszonej architekturze z wykorzystaniem protokołu MQTT oraz platformy Home Assistant. Przed przystąpieniem do opisu poszczególnych etapów konfiguracji, konieczne jest zrozumienie ogólnej struktury systemu oraz sposobu przepływu danych między jego komponentami.

=== Model architektury systemu

Projektowany system opiera się na trójwarstwowym modelu architektury rozproszonej, który zapewnia skalowalność oraz łatwość w rozbudowie o kolejne węzły sensorowe i wykonawcze. Na rysunku X przedstawiono schemat ideowy połączeń między kluczowymi elementami systemu.

// #figure(
//   image("images/system_architecture.png", width: 80%),
//   caption: [Ogólny schemat architektury systemu.],
// ) <architektura-ogolna>

Wyróżnić można następujące warstwy:
1. *Warstwa fizyczna (sprzętowa):* Składa się z mikrokontrolerów rodziny ESP32, które pełnią rolę węzłów pomiarowych (zbieranie danych z czujników temperatury, wilgotności itp.) oraz węzłów wykonawczych (sterowanie przekaźnikami, oświetleniem).
2. *Warstwa sieciowa (komunikacyjna):* Wykorzystuje lokalną sieć Wi-Fi oraz centralny broker MQTT (Mosquitto), który pośredniczy w wymianie komunikatów między urządzeniami a systemem nadrzędnym.
3. *Warstwa aplikacyjna (zarządzająca):* Stanowi ją platforma Home Assistant zainstalowana na serwerze lokalnym, która odpowiada za logikę systemu, wizualizację danych oraz interfejs użytkownika.

=== Analiza przepływu danych

Komunikacja w systemie odbywa się w sposób asynchroniczny, co pozwala na minimalizację zużycia energii przez węzły końcowe oraz zwiększenie niezawodności. Przepływ danych można podzielić na dwa główne kierunki:

- *Dane telemetryczne (Upstream):* Węzły sensorowe cyklicznie przesyłają odczyty z czujników do brokera MQTT pod odpowiednie tematy (np. `home/livingroom/temperature`). System Home Assistant, subskrybując te tematy, odbiera dane, przetwarza je i zapisuje w bazie danych.
- *Polecenia sterujące (Downstream):* Użytkownik poprzez interfejs Home Assistant lub automatyzację generuje polecenie (np. włączenie światła). Home Assistant publikuje odpowiedni komunikat na brokerze MQTT (np. `home/livingroom/light/set`), który jest natychmiast odbierany przez właściwy węzeł wykonawczy.

=== Uzasadnienie wyboru architektury

Wybór architektury opartej na brokerze MQTT, zamiast bezpośredniej komunikacji HTTP (Peer-to-Peer), był podyktowany kilkoma kluczowymi czynnikami:

- *Luźne powiązanie komponentów (Decoupling):* Urządzenia końcowe nie muszą znać adresu IP serwera Home Assistant ani jego stanu. Komunikują się jedynie z brokerem, co ułatwia wymianę lub dodawanie nowych elementów systemu bez konieczności rekonfiguracji pozostałych.
- *Odporność na błędy:* W przypadku chwilowej niedostępności systemu nadrzędnego, broker może przechowywać ostatnie komunikaty (funkcja Retain) lub zarządzać sesjami urządzeń.
- *Niskie narzuty komunikacyjne:* Protokół MQTT jest znacznie lżejszy od HTTP, co jest kluczowe przy wykorzystaniu mikrokontrolerów o ograniczonych zasobach oraz w celu zapewnienia niskich opóźnień w działaniu automatyzacji.
