=== Implementacja oprogramowania węzła sensorowego (Node-1)
<implementacja-oprogramowania-wezla-sensorowego-node-1>

Węzeł nazwany roboczo *Node-1* stanowi kluczowy element wykonawczy warstwy fizycznej systemu. Jest to autonomiczna jednostka, której zadaniem jest generowanie i transmisja danych telemetrycznych do centralnego brokera MQTT. W ramach opisanej fazy projektu, w celu weryfikacji poprawności przepływu danych oraz logiki wizualizacji w systemie Home Assistant, zdecydowano się na zastosowanie programowej symulacji wartości pomiarowych.

==== Architektura i wybór komponentów

Sercem urządzenia jest układ *ESP32 DevKit V1*, który został wybrany ze względu na zintegrowany moduł Wi-Fi oraz niskie zużycie energii. Choć docelowo system przewiduje wykorzystanie czujników fizycznych (takich jak BME280), na obecnym etapie zaimplementowano generator sygnałów oparty na funkcjach matematycznych. Takie podejście pozwoliło na:

#figure(
  image("images/esp32.png", width: 60%),
  caption: [Układ ESP32 DevKit V1],
) <fig-esp32>

- niezależną weryfikację stabilności połączenia sieciowego i sesji MQTT,
- testowanie reakcji systemu Home Assistant na dynamiczne zmiany wartości w pełnym zakresie,
- eliminację błędów wynikających z potencjalnych problemów sprzętowych na etapie tworzenia szkieletu oprogramowania.

==== Architektura i logika oprogramowania

Oprogramowanie węzła zostało opracowane w środowisku *PlatformIO* z wykorzystaniem frameworka *Arduino*. Główna logika firmware opiera się na maszynie stanów, która zarządza procesami inicjalizacji, nawiązywania połączenia oraz transmisji danych.

Do najważniejszych komponentów programowych należą:
- *WiFiManager:* Moduł odpowiedzialny za utrzymywanie stabilnego połączenia z lokalną siecią bezprzewodową.
- *PubSubClient:* Biblioteka obsługująca protokół MQTT w wersji 3.1.1.
- *ArduinoJson:* Wykorzystywana do serializacji danych pomiarowych do formatu JSON.

==== Proces przetwarzania i symulacji danych

Algorytm działania węzła w standardowym cyklu pracy obejmuje generowanie wartości przy użyciu funkcji sinus. Pozwala to na uzyskanie płynnych, przewidywalnych zmian parametrów, co jest szczególnie przydatne przy kalibracji wykresów w panelu użytkownika.

Wartość temperatury obliczana jest według wzoru:
$T(t) = T_"offset" + A dot sin(omega t)$
Gdzie $T_"offset"$ to temperatura bazowa, $A$ to amplituda zmian, a $omega$ określa częstotliwość cyklu.

Algorytm w każdym kroku wykonuje następujące czynności:
1. *Łączność:* Sprawdzenie stanu połączenia Wi-Fi i brokera MQTT.
2. *Generowanie danych:* Wyznaczenie kolejnej wartości funkcji sinus dla temperatury oraz analogicznych wartości dla wilgotności i ciśnienia.
3. *Publikacja:* Dane są pakowane do obiektu JSON i wysyłane na temat: `esp32/temperature`. Przykład wysyłanej ramki danych:
```json
{
  "temperature": 22.5,
  "humidity": 45.2,
  "pressure": 1013.2,
  "uptime": 3600
}
```
4. *Oczekiwanie:* Węzeł odczekuje zdefiniowany interwał (np. 30 sekund) przed kolejną iteracją.

==== Integracja z Home Assistant

Pomimo zastosowania danych symulowanych, od strony systemu Home Assistant węzeł jest widziany jako rzeczywiste urządzenie pomiarowe. W pliku `configuration.yaml` zdefiniowano encje typu `sensor`, które interpretują przychodzące ramki JSON.

```yaml
mqtt:
  sensor:
    - name: "Tenperature Sensor"
      state_topic: "esp32/temperature"
      icon: "mdi:microcontroller"
      unit_of_measurement: "°C"
      value_template: "{{ value_json.temperature }}"
      device_class: "temperature"
      unique_id: "esp32_simulated_temp"

    - name: "Status Grzejnika"
      state_topic: "esp32/actuator/heater"
      payload_on: "ON"
      payload_off: "OFF"
```

Dzięki takiemu podejściu, dane są natychmiast dostępne dla silnika automatyzacji, umożliwiając np. wizualizację pracy "grzejnika" na tym samym wykresie co temperatura.
