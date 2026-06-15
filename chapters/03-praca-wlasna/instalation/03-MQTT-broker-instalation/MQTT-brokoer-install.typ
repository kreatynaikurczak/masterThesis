=== Uruchomienie brokera MQTT Mosquitto w kontenerze Docker

Kolejnym kluczowym elementem infrastruktury jest broker MQTT (Message Queuing Telemetry Transport), który pełni rolę centralnego węzła komunikacyjnego w systemie automatyki budynkowej. Wybrano oprogramowanie Eclipse Mosquitto ze względu na jego lekkość, wysoką wydajność oraz pełną zgodność ze standardem MQTT.

==== Przygotowanie struktury katalogów

Zgodnie z dobrą praktyką zarządzania kontenerami, dla usługi brokera utworzono dedykowany katalog roboczy `~/mqtt`, w którym przechowywane są pliki konfiguracyjne oraz dane trwałe (persistence). Pozwala to na separację danych aplikacji od samego obrazu kontenera.

```bash
mkdir -p ~/mqtt/config ~/mqtt/data ~/mqtt/log
cd ~/mqtt
```

==== Konfiguracja brokera Mosquitto

Podstawowa konfiguracja brokera została zdefiniowana w pliku `~/mqtt/config/mosquitto.conf`. W celu zapewnienia poprawnej komunikacji wewnątrz sieci kontenerowej oraz dostępu z zewnątrz, przyjęto następujące ustawienia:

```yaml
# mosquitto.conf
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

listener 1883
allow_anonymous true
```

Powyższa konfiguracja włącza trwałość danych (zachowywanie stanu subskrypcji i wiadomości po restarcie), definiuje ścieżki do logów oraz uruchamia nasłuchiwanie na standardowym porcie 1883. Na etapie testowym zezwolono na połączenia anonimowe (`allow_anonymous true`), co upraszcza wstępną weryfikację poprawności działania systemu bez konieczności definiowania list kontroli dostępu (ACL).

==== Definicja usługi Docker Compose

Do uruchomienia brokera wykorzystano narzędzie Docker Compose, co pozwala na deklaratywne zdefiniowanie parametrów kontenera. Plik `docker-compose.yml` został skonfigurowany w następujący sposób:

```yaml
version: '3.8'

services:
  mosquitto:
    image: eclipse-mosquitto:latest
    container_name: mqtt-broker
    restart: always
    ports:
      - "1883:1883"
      - "9001:9001"
    volumes:
      - ./config:/mosquitto/config
      - ./data:/mosquitto/data
      - ./log:/mosquitto/log
```

Mapowanie wolumenów (`volumes`) zapewnia, że pliki konfiguracyjne oraz zebrane dane są mapowane bezpośrednio z systemu gospodarza do wnętrza kontenera. Port 1883 służy do standardowej komunikacji MQTT, natomiast port 9001 jest zarezerwowany dla komunikacji poprzez WebSockety.

==== Uruchomienie i weryfikacja

Uruchomienie brokera odbywa się za pomocą jednego polecenia wykonanego w katalogu roboczym:

```bash
docker-compose up -d
```

W celu weryfikacji poprawności działania usługi sprawdzono status kontenera oraz przeanalizowano logi systemowe. Do testów funkcjonalnych wykorzystano narzędzia klienckie `mosquitto_sub` i `mosquitto_pub`. W jednym oknie terminala uruchomiono subskrypcję tematu testowego:

```bash
mosquitto_sub -h localhost -t "test/topic"
```

W drugim terminalu przesłano wiadomość testową:

```bash
mosquitto_pub -h localhost -t "test/topic" -m "Wiadomość testowa"
```

Prawidłowe odebranie wiadomości przez subskrybenta potwierdziło, że broker poprawnie zarządza ruchem i jest gotowy do integracji z pozostałymi komponentami systemu, takimi jak Home Assistant czy czujniki IoT.
