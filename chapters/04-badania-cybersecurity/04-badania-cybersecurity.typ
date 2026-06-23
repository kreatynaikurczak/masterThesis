= Badania i analiza bezpieczeństwa
<badania-i-analiza-bezpieczenstwa>

W niniejszym rozdziale przeprowadzono szczegółowe badania oraz analizę bezpieczeństwa zaimplementowanego systemu automatyki domowej. Skupiono się na identyfikacji potencjalnych podatności w komunikacji bezprzewodowej, konfiguracji brokera MQTT oraz platformy Home Assistant, a także zaproponowano i zweryfikowano metody mitygacji tych zagrożeń.

== Analiza podatności i wektory ataków
<analiza-podatnosci-i-wektory-atakow>

W rozproszonych systemach IoT opartych na mikrokontrolerach ESP32 wyróżnić można kilka kluczowych wektorów ataku:
1. *Podsłuch transmisji sieciowej (Sniffing):* Przechwytywanie niezaszyfrowanych ramek MQTT zawierających dane telemetryczne oraz polecenia sterujące.
2. *Wstrzykiwanie wiadomości (Spoofing/Injection):* Wysyłanie fałszywych poleceń na tematy sterujące (np. `esp32/actuator/set`) w celu nieautoryzowanego przejęcia kontroli nad urządzeniami wykonawczymi.
3. *Ataki typu Denial of Service (DoS):* Przeciążenie brokera MQTT lub mikrokontrolerów dużą liczbą żądań połączenia lub publikacji.

== Testy penetracyjne protokołu MQTT
<testy-penetracyjne-protokolu-mqtt>

W ramach testów zweryfikowano zachowanie systemu w dwóch scenariuszach konfiguracji brokera:
1. *Dostęp anonimowy:* Potwierdzono możliwość podsłuchu i wstrzykiwania dowolnych ramek przez nieautoryzowanego klienta w sieci lokalnej przy użyciu narzędzia `mosquitto_sub`/`mosquitto_pub`.
2. *Dostęp uwierzytelniony z autoryzacją ACL:* Wdrożono uwierzytelnianie loginem i hasłem oraz reguły ACL ograniczające węzłom uprawnienia wyłącznie do ich dedykowanych tematów.

== Bezpieczeństwo platformy Home Assistant
<bezpieczenstwo-platformy-home-assistant>

Analiza bezpieczeństwa centralnego serwera wykazała konieczność zabezpieczenia interfejsu webowego (Lovelace) przy użyciu silnych haseł oraz uwierzytelniania dwuskładnikowego (2FA). Dodatkowo, wdrożenie certyfikatu SSL/TLS dla ruchu zewnętrznego (np. poprzez usługę Let's Encrypt lub tunel Cloudflare) jest niezbędne w przypadku wystawienia systemu do sieci Internet.

== Podsumowanie i rekomendacje bezpieczeństwa
<podsumowanie-i-rekomendacje-bezpieczenstwa>

Na podstawie przeprowadzonych badań sformułowano następujące rekomendacje dla produkcyjnych wdrożeń systemów Smart Home:
- Bezwzględne wyłączenie anonimowego dostępu do brokera MQTT.
- Wdrożenie szyfrowania TLS dla całej komunikacji MQTT oraz HTTP.
- Izolacja urządzeń IoT w dedykowanej sieci wirtualnej (VLAN).
