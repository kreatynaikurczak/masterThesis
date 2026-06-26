=== Konteneryzacja środowiska przy użyciu platformy Docker
<sec:docker-installation>

Po skonfigurowaniu systemu operacyjnego Debian, kolejnym krokiem było wdrożenie platformy Docker. Konteneryzacja pozwala na izolację poszczególnych usług (takich jak broker MQTT czy Home Assistant), co znacząco ułatwia zarządzanie zależnościami oraz migrację systemu między różnymi platformami sprzętowymi.

Instalacja silnika Docker Engine oraz wtyczki Docker Compose została przeprowadzona przy użyciu oficjalnego repozytorium producenta, co gwarantuje dostęp do najnowszych i stabilnych wersji oprogramowania. W celu ułatwienia zarządzania systemem, dodano użytkownika do grupy systemowej `docker`, co pozwoliło na kontrolowanie środowiska bez konieczności każdorazowego korzystania z polecenia `sudo`. Poprawność wdrożenia zweryfikowano uruchomieniem kontenera testowego `hello-world`.

W dalszych etapach pracy, zamiast pojedynczych poleceń `docker run`, zdecydowano się na wykorzystanie narzędzia Docker Compose. Pozwala ono na definiowanie całej infrastruktury w formie deklaratywnych plików `docker-compose.yml`, co zapewnia powtarzalność konfiguracji i ułatwia dokumentowanie wdrożonych usług.
