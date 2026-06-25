=== Węzeł wykonawczy i silnik autowykrywania (Node-2)
<wezel-wykonawczy-i-silnik-autowykrywania-node-2>

Drugi zaimplementowany węzeł, nazwany *Node-2*, reprezentuje bardziej zaawansowaną klasę urządzeń. W przeciwieństwie do Node-1, który skupiał się na telemetrii, Node-2 pełni rolę inteligentnego sterownika wykonawczego, integrującego mechanizmy dwukierunkowej komunikacji.

==== Architektura sprzętowa

Jako platformę sprzętową dla tego węzła wybrano mikrokontroler *ESP32-C3 DevKit*, oparty na otwartej architekturze RISC-V. Wybór ten podyktowany był chęcią przetestowania nowoczesnego standardu układów ESP, które oferują zoptymalizowany pobór mocy przy zachowaniu kompatybilności z Wi-Fi i MQTT.

#figure(
  image("images/ESP32_C3_MINI-8.jpg", width: 60%),
  caption: [Mikrokontroler ESP32-C3 wykorzystany w module Node-2],
) <fig-node2-esp32>

==== Separacja tematów MQTT: Polecenia a stan

Kluczowym elementem logiki komunikacyjnej Node-2 jest pełna separacja tematów sterujących od tematów raportujących stan. Zastosowano architekturę dwukierunkową, żeby zapobiec pętlom logicznym oraz zagwarantować bezwzględną synchronizację między stanem faktycznym sprzętu a interfejsem użytkownika.

W systemie zdefiniowano dwa główne kanały dla każdej encji wykonawczej (np. przekaźnika):
- *Temat poleceń (`esp32/actuator/set`):* Służy wyłącznie do przesyłania żądań zmiany stanu z Home Assistant do węzła.
- *Temat stanu (`esp32/actuator/state`):* Służy do raportowania przez węzeł aktualnego potwierdzonego stanu urządzenia.

Dzięki takiemu podejściu, interfejs użytkownika aktualizuje status urządzenia dopiero po otrzymaniu potwierdzenia z mikrokontrolera. Eliminuje to błędy, gdzie ikona w aplikacji zmienia stan mimo braku fizycznej reakcji urządzenia (np. z powodu chwilowej utraty zasięgu Wi-Fi).


==== Logika operacyjna i synchronizacja

Proces obsługi polecenia przez Node-2 przebiega w następujących sposób:
1. *Odbiór:* Węzeł subskrybuje temat `esp32/actuator/#`. Po otrzymaniu wiadomości `"ON"`, następuje wysterowanie odpowiedniego pinu GPIO.
2. *Weryfikacja:* System sprawdza stan logiczny wyjścia.
3. *Potwierdzenie:* Węzeł publikuje aktualny stan na temat `esp32/actuator/state`.


==== Automatyzacja i zcentralizowane zarządzanie stanem

W zaimplementowanej architekturze modularnej kluczowym aspektem jest zcentralizowane sterowanie logiką systemu. Zamiast bezpośredniej komunikacji między węzłem czujnika a węzłem wykonawczym, oba moduły komunikują się wyłącznie za pośrednictwem systemu Home Assistant poprzez protokół MQTT. Home Assistant pełni tutaj rolę jedynego źródła prawdy , co pozwala na zachowanie spójności stanu całego systemu.

Przepływ danych i logiki sterowania odbywa się w następujący sposób:
1. *Publikacja danych:* Węzeł czujnika (*Sensor Node*) publikuje odczyty temperatury na temat MQTT `esp32/sensor/temperature`.
2. *Przetwarzanie logiki:* Home Assistant subskrybuje ten temat, analizuje otrzymaną wartość i porównuje ją ze zdefiniowanym progiem. Na tej podstawie system decyduje o zmianie stanu encji `switch.heater_actuator`.
3. *Sterowanie urządzeniem:* Zmiana stanu encji w Home Assistant powoduje wysłanie odpowiedniego polecenia do węzła wykonawczego (*Node-2*). Węzeł ten nasłuchuje komunikatów sterujących i reaguje wyłącznie na instrukcje pochodzące z systemu nadrzędnego.
4. *Interakcja użytkownika:* Dzięki centralizacji zmiana stanu urządzenia może nastąpić również ręcznie poprzez przełącznik w interfejsie graficznym. W takim przypadku Home Assistant aktualizuje stan encji `switch.heater_actuator`, co automatycznie wysyłane jest do fizycznego urządzenia.

Takie podejście gwarantuje, że logika sterowania jest oddzielona od warstwy sprzętowej, co ułatwia modyfikację algorytmów automatyzacji bez konieczności przeprogramowywania poszczególnych mikrokontrolerów.
