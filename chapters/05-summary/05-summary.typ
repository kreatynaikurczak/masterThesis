= Podsumowanie
<podsumowanie>

Praca dyplomowa była poświęcona zaprojektowaniu, implementacji i weryfikacji bezpieczeństwa serwerowego systemu automatyki domowej opartego na mikrokontrolerach ESP oraz protokole MQTT, zintegrowanego z platformą Home Assistant. Potwierdzono poprawny przepływ danych we wszystkich warstwach systemu, od mikrokontrolera poprzez broker MQTT aż do encji i automatyzacji w Home Assistant.

== Wnioski z badań bezpieczeństwa

Przeprowadzone testy bezpieczeństwa na dedykowanym stanowisku badawczym dostarczyły szeregu praktycznych wniosków:

- *Izolacja sieciowa (Layer 3)* jest podstawową linią obrony dla urządzeń IoT. Testy wykazały, że samo podłączenie routera IoT do sieci domowej bez reguł kontroli dostępu tworzy wektor ataku umożliwiający przejście z podsieci IoT do sieci domowej. Dopiero zastosowanie reguł ACL na routerze TP-Link skutecznie odseparowało obie sieci, pozostawiając jednocześnie działający dostęp do Internetu.

- *Uwierzytelnianie MQTT (Layer 4)* stanowi krytyczny element konfiguracji brokera. Bez wymagania poświadczeń (`allow_anonymous true`) każdy klient z dostępem sieciowym może subskrybować i publikować dowolne wiadomości, uzyskując pełną kontrolę nad szyną komunikacyjną systemu. Wyłączenie dostępu anonimowego i wymuszenie uwierzytelniania hasłem skutecznie eliminuje tę podatność.

- *Zdalny dostęp przez VPN Tailscale* okazał się bezpieczną i wygodną alternatywą dla tradycyjnego przekierowania portów. Interfejs Home Assistant jest dostępny wyłącznie dla uwierzytelnionych urządzeń w sieci mesh WireGuard, bez wystawiania żadnych portów do internetu, co radykalnie zmniejsza powierzchnię ataku.

Łącznie wyniki badań potwierdzają, że wielowarstwowe podejście do bezpieczeństwa czyli separacja sieci, uwierzytelnianie protokołów i tunelowanie VPN znacząco podnosi odporność systemu IoT na nieautoryzowany dostęp.

== Kierunki dalszego rozwoju

Zrealizowany system stanowi solidną podstawę, którą można rozbudować w kilku kierunkach:

- *Szyfrowanie TLS dla MQTT* -- wdrożenie certyfikatów SSL/TLS na brokerze Mosquitto w celu ochrony przesyłanych danych telemetrycznych przed podsłuchem wewnątrz sieci lokalnej.
- *Integracja fizycznych czujników* -- zastąpienie generatora sygnałów w Node-1 rzeczywistymi czujnikami (np. BME280 dla temperatury i wilgotności, PIR dla detekcji ruchu) w celu uzyskania realnych danych środowiskowych.
- *Protokół Zigbee lub Matter* -- rozszerzenie systemu o węzły oparte na energooszczędnych protokołach mesh, co umożliwi integrację urządzeń bateryjnych bez konieczności stosowania Wi-Fi.
- *Zaawansowana analiza anomalii sieciowych* -- implementacja systemu wykrywania intruzów (IDS) monitorującego ruch MQTT pod kątem nieautoryzowanych publikacji lub nieprawidłowych wzorców komunikacji.
- *Wysoka dostępność (HA)* -- konfiguracja klastra serwerowego z replikacją brokera MQTT i bazy danych Home Assistant w celu eliminacji pojedynczego punktu awarii.

Zrealizowany projekt potwierdza, że zbudowanie funkcjonalnego, bezpiecznego i skalowalnego systemu automatyki domowej w oparciu o ogólnodostępne technologie open-source jest w pełni wykonalne i stanowi atrakcyjną alternatywę dla komercyjnych rozwiązań chmurowych.
