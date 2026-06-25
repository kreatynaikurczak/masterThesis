== Testy w warstwie aplikacji (Layer 4+) -- Kontrola dostępu i zdalny dostęp

Teraz przejdzemy do mechanizmów bezpieczeństwa działających na poziomie warstwy aplikacji, uzupełniających izolację sieciową opisaną w poprzedniej sekcji. Przeanalizowano dwa niezależne mechanizmy kontroli dostępu: uwierzytelnianie brokera MQTT za pomocą hasła oraz bezpieczny zdalny dostęp do systemu Home Assistant za pośrednictwem sieci VPN Tailscale.

=== Uwierzytelnianie MQTT za pomocą hasła

==== Opis mechanizmu

Broker MQTT (Mosquitto) uruchomiony na serwerze Debian został skonfigurowany z wymaganym uwierzytelnianiem użytkownika. Każde urządzenie IoT (mikrokontroler ESP) oraz klient subskrybujący dane (np. Home Assistant) musi podczas nawiązywania połączenia z brokerem podać prawidłową nazwę użytkownika i hasło. Konfiguracja ta realizowana jest poprzez dyrektywę `password_file` w pliku konfiguracyjnym `/etc/mosquitto/mosquitto.conf` oraz wyłączenie dostępu anonimowego (`allow_anonymous false`).

Mechanizm ten stanowi zabezpieczenie na poziomie warstwy aplikacji -- nawet jeśli potencjalny atakujący uzyska dostęp do podsieci IoT (`192.168.8.0/24`) i będzie w stanie nawiązać połączenie TCP z brokerem na porcie 1883, bez znajomości prawidłowych poświadczeń nie będzie mógł publikować ani subskrybować żadnych wiadomości MQTT.

==== Wyniki testu

W celu weryfikacji skuteczności uwierzytelniania przeprowadzono próbę połączenia z brokerem MQTT z poziomu laptopa testowego (`192.168.8.101`), symulującego nieautoryzowanego klienta.

*Test 1 -- połączenie bez poświadczeń (próba ataku):*

```bash
mosquitto_sub -h 192.168.8.100 -t "#"
```

Broker odmówił połączenia, zwracając kod błędu `Connection Refused: not authorised`. Żadna wiadomość nie została odebrana.

*Test 2 -- połączenie z prawidłowymi poświadczeniami (klient autoryzowany):*

```bash
mosquitto_sub -h 192.168.8.100 -t "#" -u "<michal>" -P "<michal>"
```

Połączenie zostało nawiązane pomyślnie. Klient zaczął odbierać wiadomości publikowane przez urządzenia ESP w systemie.

*Wnioski:* Mechanizm uwierzytelniania skutecznie blokuje nieautoryzowany dostęp do szyny komunikacyjnej systemu. Wyłączenie dostępu anonimowego jest kluczowym krokiem konfiguracyjnym w środowiskach produkcyjnych, eliminującym jedną z najczęściej eksploatowanych podatności w instalacjach MQTT.

=== Zdalny dostęp przez sieć VPN Tailscale

==== Opis mechanizmu

Tailscale to sieć VPN oparta na protokole WireGuard, działająca w modelu _mesh_ (każdy węzeł komunikuje się bezpośrednio z każdym innym). W odróżnieniu od klasycznych rozwiązań VPN, Tailscale nie wymaga centralnego serwera-pośrednika -- każde urządzenie zarejestrowane w sieci Tailscale otrzymuje unikatowy adres IP z prywatnej przestrzeni `100.64.0.0/10` (zgodnej ze standardem Carrier-Grade NAT, RFC 6598) i może komunikować się z pozostałymi węzłami niezależnie od ich fizycznej lokalizacji.

Serwer Debian, pełniący rolę centralnej jednostki systemu automatyki domowej, został zarejestrowany jako węzeł sieci Tailscale. Dzięki temu interfejs webowy Home Assistant (domyślnie dostępny na porcie 8123) jest osiągalny zdalnie wyłącznie przez szyfrowany tunel VPN, bez konieczności otwierania portów na routerze ISP ani eksponowania usługi bezpośrednio w Internecie.

Schemat przepływu ruchu przy zdalnym dostępie:

#align(center)[
  #box(stroke: 1pt + luma(180), inset: 10pt, radius: 6pt, fill: luma(252))[
    *Urządzenie zdalne* (smartfon `galaxy-s20-fe-5g`, `100.115.49.51`) \
    #sym.arrow.b \
    Szyfrowany tunel WireGuard (Tailscale) \
    #sym.arrow.b \
    *Serwer Debian* -- adres Tailscale `100.80.238.31` \
    #sym.arrow.b \
    *Home Assistant* -- `localhost:8123`
  ]
]

#figure(
  image("images/tailscale_network.jpg", width: 45%),
  caption: [Widok aplikacji mobilnej Tailscale -- sieć mesh z widocznymi węzłami: smartfonem (`galaxy-s20-fe-5g`), laptopem (`angelo-thinkpad-t470-w10dg`) oraz serwerem Debian (`debian-server`, `100.80.238.31`)],
) <fig-tailscale-network>

==== Wyniki testu

Przeprowadzono test dostępności interfejsu Home Assistant zarówno przez sieć Tailscale (uprawniony dostęp zdalny), jak i bezpośrednio z Internetu (próba nieautoryzowanego dostępu).

*Test 1 -- dostęp przez tunel Tailscale (uprawniony użytkownik):*

Z poziomu smartfona (`galaxy-s20-fe-5g`, `100.115.49.51`) połączonego z siecią Tailscale otwarto przeglądarkę i wpisano adres `http://100.80.238.31:8123`. Interfejs Home Assistant załadował się poprawnie i wymagał zalogowania się na konto użytkownika systemu. Połączenie jest w całości szyfrowane przez protokół WireGuard. Ekran aplikacji Tailscale podczas testu przedstawiono na @fig-tailscale-network.

#figure(
  image("images/Interfejs Home Assistant z smartphona.jpg", width: 45%),
  caption: [Interfejs Home Assistant otwarty w przeglądarce smartfona (`galaxy-s20-fe-5g`) po połączeniu przez sieć Tailscale. Adres IP serwera Debian w sieci Tailscale: `100.80.238.31`],
) <interface-home-assistant-tailscale>


*Test 2 -- próba bezpośredniego dostępu z Internetu (brak otwartych portów):*

Na routerze ISP nie skonfigurowano przekierowania portów (port forwarding) dla portu 8123. Próba połączenia z zewnętrznego adresu IP serwera na porcie 8123 zakończyła się przekroczeniem limitu czasu oczekiwania (`Connection timed out`) -- usługa nie jest widoczna dla zewnętrznych klientów.

*Wnioski:* Zastosowanie Tailscale jako warstwy dostępu zdalnego eliminuje konieczność wystawiania usług domowych do internetu. Całość ruchu jest szyfrowana end-to-end przez WireGuard, a dostęp możliwy jest wyłącznie dla urządzeń uwierzytelnionych w ramach konta Tailscale. Rozwiązanie to stanowi znaczące wzmocnienie bezpieczeństwa w porównaniu z tradycyjnym przekierowaniem portów.
