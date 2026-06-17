=== Węzeł wykonawczy i silnik autowykrywania (Node-2)
<wezel-wykonawczy-i-silnik-autowykrywania-node-2>

Drugi zaimplementowany węzeł, nazwany *Node-2*, reprezentuje bardziej zaawansowaną klasę urządzeń krawędziowych (*edge nodes*). W przeciwieństwie do Node-1, który skupiał się na telemetrii, Node-2 pełni rolę inteligentnego sterownika wykonawczego, integrującego mechanizmy dwukierunkowej komunikacji oraz autonomicznej rejestracji w systemie nadrzędnym.

=== Architektura sprzętowa

Jako platformę sprzętową dla tego węzła wybrano mikrokontroler **ESP32-C3 DevKit**, oparty na otwartej architekturze RISC-V. Wybór ten podyktowany był chęcią przetestowania nowoczesnego standardu układów ESP, które oferują zoptymalizowany pobór mocy oraz wsparcie dla najnowszych mechanizmów bezpieczeństwa przy zachowaniu pełnej kompatybilności z ekosystemem Wi-Fi i MQTT.

#figure(
  image("images/ESP32_C3_MINI-8.jpg", width: 60%),
  caption: [Mikrokontroler ESP32-C3 wykorzystany w module Node-2],
) <fig-node2-esp32>

=== Separacja tematów: Polecenia a stan (Command vs State)

Kluczowym elementem logiki komunikacyjnej Node-2 jest pełna separacja tematów sterujących od tematów raportujących stan. Zastosowano architekturę dwukierunkową, aby zapobiec pętlom logicznym oraz zagwarantować bezwzględną synchronizację między stanem faktycznym sprzętu a interfejsem użytkownika.

W systemie zdefiniowano dwa główne kanały dla każdej encji wykonawczej (np. przekaźnika):
- **Temat poleceń (`cmnd/node-2/relay1/set`):** Służy wyłącznie do przesyłania żądań zmiany stanu z Home Assistant do węzła.
- **Temat stanu (`stat/node-2/relay1/state`):** Służy do raportowania przez węzeł aktualnego potwierdzonego stanu urządzenia.

Dzięki takiemu podejściu, interfejs użytkownika aktualizuje status urządzenia dopiero po otrzymaniu potwierdzenia z mikrokontrolera. Eliminuje to błędy typu "ghost switching", gdzie ikona w aplikacji zmienia stan mimo braku fizycznej reakcji urządzenia (np. z powodu chwilowej utraty zasięgu Wi-Fi).

=== Mechanizm MQTT Self-Discovery

Węzeł Node-2 implementuje standard **Home Assistant MQTT Discovery**, co pozwala na całkowitą eliminację konieczności ręcznej edycji plików konfiguracyjnych w systemie nadrzędnym. Natychmiast po uruchomieniu i nawiązaniu połączenia z siecią, mikrokontroler wysyła ramkę konfiguracyjną w formacie JSON na specjalny temat odkrywania (`homeassistant/switch/node-2/config`).

Poniżej przedstawiono przykładowy ładunek danych (payload) generowany przez węzeł podczas procesu autowykrywania:

```json
{
  "name": "Wentylator Biuro",
  "unique_id": "node-2_relay_1",
  "command_topic": "cmnd/node-2/relay1/set",
  "state_topic": "stat/node-2/relay1/state",
  "payload_on": "ON",
  "payload_off": "OFF",
  "device": {
    "identifiers": ["esp32c3_8291AB"],
    "name": "Node-2 Actuator Engine",
    "model": "ESP32-C3 DevKit",
    "manufacturer": "Espressif"
  }
}
```

Dzięki przesłaniu metadanych takich jak model urządzenia czy producent, Home Assistant automatycznie tworzy nie tylko samą encję sterującą, ale również grupuje ją w ramach logicznego urządzenia. Ułatwia to zarządzanie systemem w miarę dodawania kolejnych modułów wykonawczych.

=== Logika operacyjna i synchronizacja

Proces obsługi polecenia przez Node-2 przebiega w następujących krokach:
1. **Odbiór:** Węzeł subskrybuje temat `cmnd/#`. Po otrzymaniu wiadomości `"ON"`, następuje wysterowanie odpowiedniego pinu GPIO.
2. **Weryfikacja:** System sprawdza stan logiczny wyjścia.
3. **Potwierdzenie:** Węzeł publikuje aktualny stan na temat `stat/...`.

Zastosowanie flagi **Retain** dla komunikatów stanu pozwala na natychmiastowe odzyskanie poprawnego statusu urządzenia przez Home Assistant nawet po restarcie serwera, co zwiększa ogólną niezawodność całego ekosystemu IoT.
