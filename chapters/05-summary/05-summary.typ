= Podsumowanie
<podsumowanie>

Niniejsza praca dyplomowa poświęcona była zaprojektowaniu, implementacji i weryfikacji bezpieczeństwa serwerowego systemu automatyki domowej opartego na mikrokontrolerach ESP oraz protokole MQTT, zintegrowanego z platformą Home Assistant. Wszystkie sformułowane na wstępie cele zostały zrealizowane.

== Osiągnięte rezultaty

W ramach pracy wykonano następujące zadania:

*Przegląd technologii i dobór komponentów.* Przeprowadzono analizę dostępnych platform automatyki domowej, protokołów komunikacyjnych i rozwiązań sprzętowych. Jako podstawę systemu wybrano Home Assistant ze względu na jego otwartość, filozofię lokalnego sterowania i bogaty ekosystem integracji. Protokół MQTT, obsługiwany przez broker Eclipse Mosquitto, okazał się optymalnym wyborem dla środowisk IoT dzięki minimalnemu narzutowi sieciowemu i mechanizmom takim jak QoS, Retained Messages oraz Last Will and Testament.

*Implementacja infrastruktury serwerowej.* Zbudowano środowisko serwerowe oparte na systemie Debian, w którym za pomocą platformy Docker wdrożono broker MQTT Mosquitto oraz platformę Home Assistant. Konteneryzacja usług zapewniła izolację komponentów, uproszczoną procedurę aktualizacji i odtwarzalność środowiska.

*Implementacja oprogramowania węzłów IoT.* Opracowano firmware dla dwóch klas urządzeń opartych na mikrokontrolerach ESP32:
- *Node-1* -- węzeł sensorowy, który cyklicznie generuje i publikuje dane telemetryczne (temperatura, wilgotność, ciśnienie) w formacie JSON na broker MQTT, gdzie są natychmiast wizualizowane w panelu Home Assistant.
- *Node-2* -- węzeł wykonawczy oparty na mikrokontrolerze ESP32-C3 (architektura RISC-V), implementujący mechanizm MQTT Self-Discovery, pełną separację tematów poleceń i stanu (command/state) oraz potwierdzanie wykonania operacji, co eliminuje błędy typu _ghost switching_.

*Weryfikacja integracji.* Potwierdzono poprawny przepływ danych we wszystkich warstwach systemu: od czujnika przez brokera MQTT aż do encji i automatyzacji w Home Assistant. Mechanizm Self-Discovery zaimplementowany w Node-2 pozwolił na dodanie urządzenia do systemu bez żadnej ręcznej edycji plików konfiguracyjnych.

== Wnioski z badań bezpieczeństwa

Przeprowadzone testy bezpieczeństwa na dedykowanym stanowisku badawczym dostarczyły szeregu praktycznych wniosków:

- *Izolacja sieciowa (Layer 3)* jest podstawową linią obrony dla urządzeń IoT. Testy wykazały, że samo podłączenie routera IoT do sieci domowej bez reguł kontroli dostępu tworzy wektor ataku umożliwiający przejście z podsieci IoT do sieci domowej. Dopiero zastosowanie reguł ACL na routerze TP-Link skutecznie odseparowało obie sieci, pozostawiając jednocześnie działający dostęp do Internetu z obu segmentów.

- *Uwierzytelnianie MQTT (Layer 4)* stanowi krytyczny element konfiguracji brokera. Bez wymagania poświadczeń (`allow_anonymous true`) każdy klient z dostępem sieciowym może subskrybować i publikować dowolne wiadomości, uzyskując pełną kontrolę nad szyną komunikacyjną systemu. Wyłączenie dostępu anonimowego i wymuszenie uwierzytelniania hasłem skutecznie eliminuje tę podatność.

- *Zdalny dostęp przez VPN Tailscale* okazał się bezpieczną i wygodną alternatywą dla tradycyjnego przekierowania portów. Interfejs Home Assistant jest dostępny wyłącznie dla uwierzytelnionych urządzeń w sieci mesh WireGuard, bez eksponowania żadnych portów w publicznej sieci Internet, co radykalnie zmniejsza powierzchnię ataku.

Łącznie wyniki badań potwierdzają, że wielowarstwowe podejście do bezpieczeństwa -- separacja sieci, uwierzytelnianie protokołów i tunelowanie VPN -- znacząco podnosi odporność systemu IoT na nieautoryzowany dostęp.

== Kierunki dalszego rozwoju

Zrealizowany system stanowi solidną podstawę, którą można rozbudować w kilku kierunkach:

- *Szyfrowanie TLS dla MQTT* -- wdrożenie certyfikatów SSL/TLS na brokerze Mosquitto w celu ochrony przesyłanych danych telemetrycznych przed podsłuchem wewnątrz sieci lokalnej.
- *Integracja fizycznych czujników* -- zastąpienie generatora sygnałów w Node-1 rzeczywistymi czujnikami (np. BME280 dla temperatury i wilgotności, PIR dla detekcji ruchu) w celu uzyskania realnych danych środowiskowych.
- *Protokół Zigbee lub Matter* -- rozszerzenie systemu o węzły oparte na energooszczędnych protokołach mesh, co umożliwi integrację urządzeń bateryjnych bez konieczności stosowania Wi-Fi.
- *Zaawansowana analiza anomalii sieciowych* -- implementacja systemu wykrywania intruzów (IDS) monitorującego ruch MQTT pod kątem nieautoryzowanych publikacji lub nieprawidłowych wzorców komunikacji.
- *Wysoka dostępność (HA)* -- konfiguracja klastra serwerowego z replikacją brokera MQTT i bazy danych Home Assistant w celu eliminacji pojedynczego punktu awarii.

Zrealizowany projekt potwierdza, że zbudowanie funkcjonalnego, bezpiecznego i skalowalnego systemu automatyki domowej w oparciu o ogólnodostępne technologie open-source jest w pełni wykonalne i stanowi atrakcyjną alternatywę dla komercyjnych rozwiązań chmurowych.
