= Wstęp
<wstep>

== Wprowadzenie
<wprowadzenie>
W ciągu ostatnich lat dynamicznie wzrasta liczba urządzeń Internetu Rzeczy co powoduje, że inteligentne systemy zarządzania budynkiem -- znane również jako Smart Home -- stają się coraz bardziej powszechnym elementem współczesnego życia. Urządzenia zdolne do komunikacji sieciowej, które potrafią zbierać dane i reagować na polecenia użytkownika są dostępne w różnych cenach, a ich liczba bardzo szybko rośnie. Wiąże się to jednak z dużym wyzwaniem, jakim jest rozdrobnienie rynku producentów urządzeń IoT oraz rosnące zagrożenia w obszarze cyberbezpieczeństwa.

Rozwiązaniem tego problemu jest platforma Home Assistant czyli otwarte oprogramowanie, które jest sercem całego systemu inteligentnego domu, integrując urządzenia od różnych producentów w jednym, spójnym interfejsie i przechowując dane lokalnie, bez uzależnienia od zewnętrznych dostawców usług chmurowych. Kluczową rolę w komunikacji między urządzeniami odgrywa protokół MQTT, zaprojektowany z myślą o środowiskach o ograniczonych zasobach i niskiej przepustowości czyli cechach charakterystycznych dla mikrokontrolerów ESP32 stosowanych w węzłach pomiarowych i wykonawczych.

== Cel i zakres pracy
<cel-pracy>
Głównym celem tej pracy dyplomowej jest zaprojektowanie i implementacja a także weryfikacja bezpieczeństwa serwerowego systemu automatyki domowej opartego na mikrokontrolerach z rodziny ESP oraz protokole MQTT, zintegrowanego z platformą Home Assistant.

Główny cel projektu jest realizowany poprzez poniższe punkty:

+ *Przegląd i dobór technologii* -- analiza dostępnych platform automatyki domowej i rozwiązań sprzętowych pod kątem ich przydatności do realizacji systemu działającego lokalnie, bez zależności od zewnętrznej infrastruktury chmurowej.

+ *Implementacja infrastruktury serwerowej* -- instalacja i konfiguracja środowiska serwerowego opartego na systemie Debian z platformą Docker oraz wdrożenie brokera MQTT Mosquitto i platformy Home Assistant.

+ *Opracowanie oprogramowania węzłów IoT* -- zaprojektowanie i zaimplementowanie oprogramowania dla dwóch klas urządzeń opartych na mikrokontrolerach ESP: węzła sensorowego publikującego dane telemetryczne oraz węzła wykonawczego.

+ *Weryfikacja integracji systemu* -- potwierdzenie poprawności przepływu danych między warstwą fizyczną (ESP32), warstwą komunikacyjną (Mosquitto) a warstwą aplikacyjną (Home Assistant) oraz potwierdzenie poprawności działania automatyzacji i wizualizacji danych.

+ *Badania bezpieczeństwa sieciowego* -- przeprowadzenie testów bezpieczeństwa na dedykowanym stanowisku badawczym obejmujących: izolację sieci IoT na poziomie warstwy sieciowej (Layer 3), uwierzytelnianie dostępu do brokera MQTT (Layer 4) oraz bezpieczny zdalny dostęp do systemu za pośrednictwem sieci VPN.

Zakres pracy obejmuje całościowy cykl: od doboru komponentów i środowiska, przez implementację, aż po analizę bezpieczeństwa wdrożonego rozwiązania.

== Przegląd zawartości pracy
<przeglad-zawartosci-pracy>
Praca składa się z pięciu rozdziałów merytorycznych, których zawartość przedstawia się następująco:

*Rozdział 1 -- Wstęp* stanowi wprowadzenie do tematyki pracy. Przedstawiono w nim kontekst i motywację podjętego tematu, sformułowano cel oraz zakres pracy, a także opisano strukturę dokumentu.

*Rozdział 2 -- Podstawy teoretyczne* zawiera przegląd kluczowych technologii i narzędzi wykorzystanych w projekcie. Omówiono architekturę i filozofię platformy Home Assistant, zasadę działania protokołu MQTT wraz z jego mechanizmami jakości usług (QoS), retained messages i LWT, dostępne rozwiązania sprzętowe dla ekosystemu Smart Home oraz platformę Docker jako środowisko konteneryzacji.

*Rozdział 3 -- Implementacja projektu i realizacja systemu* opisuje praktyczną część pracy. Przedstawiono ogólną architekturę trójwarstwowego systemu, a następnie krok po kroku opisano proces przygotowania środowiska serwerowego (instalacja Debian, Docker), wdrożenie brokera MQTT i platformy Home Assistant, a także implementację oprogramowania obu węzłów IoT -- sensorowego (Node-1) i wykonawczego (Node-2).

*Rozdział 4 -- Badania bezpieczeństwa systemu* poświęcony jest analizie bezpieczeństwa wdrożonego rozwiązania. Opisano stanowisko badawcze z wydzieloną podsiecią IoT, a następnie zaprezentowano wyniki testów przeprowadzonych w warstwie sieciowej (Layer 3) -- weryfikacja izolacji sieci w trzech scenariuszach konfiguracyjnych -- oraz w warstwie aplikacji (Layer 4+) -- testy uwierzytelniania MQTT i zdalnego dostępu przez VPN Tailscale.

*Rozdział 5 -- Podsumowanie* zawiera zestawienie osiągniętych wyników, ocenę stopnia realizacji celów pracy oraz wnioski dotyczące możliwości dalszego rozwoju systemu.

