=== Instalacja i konfiguracja platformy Home Assistant
<sec:home-assistant-installation>

Ostatnim etapem budowy fundamentów infrastruktury serwerowej było wdrożenie platformy Home Assistant. Jest to oprogramowanie służące do centralnego zarządzania automatyką domową, które potrafi integrować tysiące urządzeń od różnych producentów w ramach jednego, spójnego interfejsu.

==== Wybór metody instalacji

Zdecydowano się na wersję Home Assistant Container. Wybór ten, w przeciwieństwie do Home Assistant OS lub Supervised, zapewnia pełną kontrolę nad systemem operacyjnym gospodarza oraz pozwala na współdzielenie zasobów z innymi usługami działającymi w kontenerach (takimi jak broker MQTT).

==== Konfiguracja usługi w Docker Compose

Usługa Home Assistant została dodana do infrastruktury kontenerowej. W katalogu głównym projektu utworzono folder `~/homeassistant`, a definicję kontenera umieszczono w pliku `docker-compose.yml`:

```yaml
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - ~/homeassistant/config:/config
      - /etc/localtime:/etc/localtime:ro
    restart: always
    privileged: true
    network_mode: host
```

Zastosowanie `network_mode: host` jest kluczowe dla tego projektu, ponieważ umożliwia Home Assistant bezpośrednią komunikację z brokerem MQTT działającym na tym samym hoście, bez konieczności konfigurowania dodatkowych reguł sieciowych.
==== Pierwsze uruchomienie i konfiguracja wstępna

Po uruchomieniu kontenera za pomocą `docker-compose up -d`, interfejs webowy stał się dostępny pod adresem IP serwera na porcie 8123. Proces wstępnej konfiguracji polegał na:
1. Utworzeniu konta administratora.
2. Określeniu lokalizacji geograficznej.
3. Skanowaniu sieci w celu wykrycia dostępnych urządzeń.

==== Integracja z brokerem MQTT

Kluczowym krokiem z punktu widzenia realizowanego projektu była integracja Home Assistant z wcześniej uruchomionym brokerem Mosquitto. Żeby to osiągnąć, trzeba było przejść do sekcji Urządzenia oraz usługi, a następnie dodać nową integrację MQTT. Jako adres brokera wpisano `localhost` (ze względu na działanie w trybie sieciowym hosta) oraz standardowy port `1883`.

Pomyślna konfiguracja umożliwiła ręczne definiowanie encji (czujników i przełączników) w pliku konfiguracyjnym `configuration.yaml`. Stanowi to gotową bazę do podłączenia węzłów opartych na układach ESP32.
