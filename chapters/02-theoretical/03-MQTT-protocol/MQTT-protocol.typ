Protokół MQTT (ang. *Message Queuing Telemetry Transport*) jest jednym z najpopularniejszych standardów komunikacyjnych wykorzystywanych w świecie Internetu Rzeczy (IoT). Został opracowany w 1999 roku przez Andy’ego Stanforda-Clarka (IBM) oraz Arlena Nippera (Arcom) z myślą o monitorowaniu rurociągów naftowych za pośrednictwem łącz satelitarnych. Głównym założeniem projektowym była minimalizacja narzutu danych przy jednoczesnym zapewnieniu niezawodności w sieciach o niskiej przepustowości i dużej latencji.

Obecnie MQTT jest standardem otwartym, zarządzanym przez organizację OASIS. Najpowszechniej stosowaną wersją jest 3.1.1, jednak coraz większą popularność zyskuje wersja 5.0, wprowadzająca m.in. ulepszone raportowanie błędów oraz metadane wiadomości (ang. *User Properties*). Lekkość i wydajność protokołu sprawiły, że stał się on de facto standardem w systemach automatyki domowej, w tym w szczególności w ekosystemie Home Assistant.

=== Architektura i zasada działania

W przeciwieństwie do tradycyjnego modelu klient-serwer (opartego na żądaniach HTTP), MQTT wykorzystuje model *publikacja-subskrypcja* (ang. *publish-subscribe*). W architekturze tej urządzenia końcowe nie komunikują się bezpośrednio ze sobą, lecz za pośrednictwem centralnego węzła zwanego *brokerem*.

Kluczowe komponenty architektury MQTT to:

- *Broker:* Centralny serwer odpowiedzialny za odbieranie wszystkich wiadomości, ich filtrowanie oraz dystrybucję do odpowiednich odbiorców. W kontekście Home Assistant najczęściej wykorzystywanym brokerem jest *Eclipse Mosquitto*.
- *Klient:* Dowolne urządzenie (np. czujnik temperatury, inteligentne gniazdko, smartfon) lub aplikacja, która nawiązuje połączenie z brokerem. Klient może pełnić rolę publikującego, subskrybującego lub obie te role jednocześnie.
- *Temat (Topic):* Ciąg znaków o strukturze hierarchicznej (oddzielanej ukośnikami, np. `dom/salon/temperatura`), który służy jako adres logiczny wiadomości. Broker wykorzystuje tematy do decydowania, do których klientów ma trafić dana informacja.

Zasada działania polega na tym, że klient subskrybujący informuje brokera o chęci otrzymywania wiadomości z określonych tematów. Gdy inny klient (publikujący) wyśle wiadomość do danego tematu, broker natychmiast przekazuje ją do wszystkich klientów, którzy go subskrybują.

=== Mechanizmy zapewnienia jakości usług (QoS)

Jedną z najistotniejszych cech MQTT jest możliwość definiowania poziomu jakości usług (ang. *Quality of Service* – QoS), co pozwala na dostosowanie niezawodności dostarczania wiadomości do wymagań konkretnego zastosowania:

- *QoS 0 (At most once):* Wiadomość jest wysyłana tylko raz, bez potwierdzenia odbioru. Jest to najszybszy tryb, ale nie gwarantuje dostarczenia danych (np. dla cyklicznych odczytów temperatury, gdzie utrata jednego pomiaru nie jest krytyczna).
- *QoS 1 (At least once):* Gwarantuje, że wiadomość dotrze do odbiorcy przynajmniej raz. Wymaga potwierdzenia odbioru, a w przypadku jego braku następuje retransmisja.
- *QoS 2 (Exactly once):* Najbardziej zaawansowany i kosztowny pod względem narzutu sieciowego tryb, gwarantujący, że wiadomość dotrze do odbiorcy dokładnie jeden raz, bez duplikacji.

=== Kluczowe funkcje protokołu

Protokół MQTT oferuje szereg mechanizmów optymalizujących komunikację w systemach inteligentnego domu:

- *Retained Messages (Wiadomości utrwalone):* Broker przechowuje ostatnią poprawną wiadomość wysłaną na dany temat. Dzięki temu nowy klient, tuż po subskrypcji tematu, natychmiast otrzymuje aktualny stan urządzenia, nie czekając na kolejną publikację.
- *Last Will and Testament (LWT):* Pozwala klientowi zdefiniować wiadomość, która zostanie automatycznie opublikowana przez brokera w przypadku nieoczekiwanego rozłączenia klienta (np. utraty zasilania lub zasięgu Wi-Fi). W Home Assistant mechanizm ten jest kluczowy dla oznaczania urządzeń jako niedostępne (*unavailable*).
- *Keep Alive:* Mechanizm cyklicznego sprawdzania połączenia (ping), który pozwala brokerowi i klientowi na szybkie wykrycie zerwania sesji.

=== MQTT w systemie Home Assistant

W systemie Home Assistant protokół MQTT pełni rolę uniwersalnej magistrali komunikacyjnej, umożliwiającej integrację urządzeń od różnych producentów oraz własnych rozwiązań opartych na mikrokontrolerach (np. ESP8266, ESP32).

Szczególne znaczenie ma mechanizm *MQTT Discovery*. Pozwala on urządzeniom na automatyczne przedstawienie się systemowi Home Assistant poprzez wysłanie specjalnie sformatowanej wiadomości konfiguracyjnej w formacie JSON na określony temat (domyślnie `homeassistant/`). Dzięki temu użytkownik nie musi ręcznie edytować plików konfiguracyjnych – nowe urządzenie pojawia się w interfejsie automatycznie jako gotowa do użycia encja.

Najpopularniejszym sposobem implementacji MQTT w Home Assistant jest instalacja dodatku *Mosquitto broker*, który jest w pełni zintegrowany z systemem.

=== Bezpieczeństwo w MQTT

Ze względu na to, że MQTT często przesyła dane w sieciach lokalnych i rozległych, kluczowe jest zapewnienie odpowiedniego poziomu bezpieczeństwa. Protokół wspiera:
- *Uwierzytelnianie:* Wymaganie nazwy użytkownika i hasła przy nawiązywaniu połączenia z brokerem.
- *Autoryzację (ACL):* Definiowanie uprawnień dla poszczególnych użytkowników (np. dany klient może tylko subskrybować konkretny temat, ale nie może na nim publikować).
- *Szyfrowanie TLS/SSL:* Zabezpieczenie całej komunikacji przed podsłuchem i atakami typu *Man-in-the-Middle*.

Wykorzystanie MQTT w połączeniu z oprogramowaniem takim jak *Tasmota*, *Zigbee2MQTT* czy *ESPHome* stanowi fundament zaawansowanych i stabilnych instalacji inteligentnego domu.
