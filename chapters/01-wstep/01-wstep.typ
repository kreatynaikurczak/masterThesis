= Wstęp
<wstep>

== Wprowadzenie
<wprowadzenie>
W ciągu ostatnich lat dynamicznie wzrasta liczba urządzeń Internetu Rzeczy co powoduje, że inteligentne systemy zarządzania budynkiem -- znane również jako Smart Home -- stają się coraz bardziej powszechnym elementem współczesnego życia. Urządzenia zdolne do komunikacji sieciowej, które potrafią zbierać dane i reagować na polecenia użytkownika są dostępne w różnych cenach, a ich liczba bardzo szybko rośnie. Wiąże się to jednak z dużym wyzwaniem, jakim jest rozdrobnienie rynku producentów urządzeń IoT oraz rosnące zagrożenia w obszarze cyberbezpieczeństwa.

Rozwiązaniem tego problemu jest platforma Home Assistant czyli otwarte oprogramowanie, które jest sercem całego systemu inteligentnego domu, integrując urządzenia od różnych producentów w jednym, spójnym interfejsie i przechowując dane lokalnie, bez uzależnienia od zewnętrznych dostawców usług chmurowych. Kluczową rolę w komunikacji między urządzeniami odgrywa protokół MQTT, zaprojektowany z myślą o środowiskach o ograniczonych zasobach i niskiej przepustowości czyli cechach charakterystycznych dla mikrokontrolerów ESP32 stosowanych w węzłach pomiarowych i wykonawczych.

== Cel i zakres pracy
<cel-pracy>
Głównym celem tej pracy dyplomowej jest zaprojektowanie i implementacja lokalnego systemu automatyki domowej zintegrowanego z platformą Home Assistant oraz opartego na mikrokontrolerach ESP32 oraz protokole MQTT, a nastepnie weryfikacja jego bezpieczeństwa.

Zakres pracy obejmuje cały cykl od doboru komponentów i środowiska, przez implementację, aż po analizę bezpieczeństwa wdrożonego rozwiązania.

== Przegląd zawartości pracy
<przeglad-zawartosci-pracy>
Praca składa się z pięciu rozdziałów:

*Rozdział 1 -- Wstęp* stanowi wprowadzenie do tematyki pracy. Przedstawiono w nim kontekst i motywację podjętego tematu, sformułowano cel oraz zakres pracy, a także opisano strukturę dokumentu.

*Rozdział 2 -- Podstawy teoretyczne* zawiera przegląd kluczowych technologii i narzędzi wykorzystanych w projekcie. Omówiono architekturę i filozofię platformy Home Assistant, zasadę działania protokołu MQTT wraz z jego wewnętrznymi mechanizmami, dostępne rozwiązania sprzętowe dla systemu Smart Home oraz platformę Docker jako środowisko konteneryzacji.

*Rozdział 3 -- Implementacja projektu i realizacja systemu* opisuje praktyczną część pracy magisterskiej. Przedstawiono w nim ogólną architekturę trójwarstwowego systemu, a następnie opisano proces przygotowania środowiska serwerowego, wdrożenia brokera MQTT i platformy Home Assistant, a także implementacji oprogramowania obu węzłów IoT -- sensorowego i wykonawczego.

*Rozdział 4 -- Badania bezpieczeństwa systemu* skupia się na analizie bezpieczeństwa wdrożonego rozwiązania. Opisano w nim stanowisko badawcze z wydzieloną podsiecią IoT, a następnie zaprezentowano wyniki testów przeprowadzonych w warstwie sieciowej (weryfikacja izolacji sieci w trzech scenariuszach konfiguracyjnych) oraz w warstwie aplikacji (testy uwierzytelniania MQTT i zdalnego dostępu przez VPN Tailscale).

*Rozdział 5 -- Podsumowanie* zawiera zestawienie osiągniętych wyników, ocenę stopnia realizacji celów pracy oraz wnioski dotyczące możliwości dalszego rozwoju tego systemu.

