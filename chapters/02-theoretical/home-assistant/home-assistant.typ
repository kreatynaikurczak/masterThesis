//#heading(level: 2)[Home Assistant]

Home Assistant to zaawansowana platforma typu open-source, służąca do scentralizowanego zarządzania automatyką domową. System ten pełni rolę lokalnego kontrolera (tzw. bramki lub huba), integrującego różnorodne urządzenia i usługi w jedną, spójną strukturę. Kluczową zaletą Home Assistant jest jego niezależność od dostawców chmurowych oraz nacisk na prywatność użytkownika i lokalne przetwarzanie danych.

Projekt został zapoczątkowany przez Paulusa Schoutsena we wrześniu 2013 roku jako aplikacja napisana w języku Python. Od tamtej pory, dzięki aktywnemu wsparciu społeczności zgromadzonej wokół serwisu GitHub, Home Assistant stał się jednym z najbardziej rozbudowanych i najczęściej aktualizowanych systemów automatyki domowej na świecie.

=== Filozofia i Architektura

Fundamentem Home Assistant jest idea polegająca na sterowaniu lokalnym oraz prywatności. W przeciwieństwie do wielu komercyjnych rozwiązań Home Assistant dąży do tego, aby cała logika sterowania oraz przechowywanie danych odbywało się bezpośrednio w sieci lokalnej użytkownika. Takie podejście nie tylko zwiększa bezpieczeństwo, ale również zapewnia ciągłość działania systemu w przypadku awarii połączenia internetowego.

Architektura systemu opiera się na zdarzeniach. Wszystkie interakcje, zmiany stanów urządzeń czy wyzwalacze automatyzacji są przetwarzane przez centralną magistralę zdarzeń.

=== Kluczowe Pojęcia i Model Danych

W celu zachowania możliwości operacyjnych między dużą liczbą różnych urządzeń, Home Assistant wykorzystuje specyficzny model danych, którego podstawą są poniższe komponenty:

- *Integracje* to moduły oprogramowania umożliwiające komunikację z zewnętrznymi platformami, urządzeniami lub usługami API.
- *Urządzenia* są reprezentowane przez fizyczne lub logiczne obiekty w systemie. Jedno urządzenie (np. wielofunkcyjny czujnik) może składać się z wielu encji (np. czujnika temperatury, czujnika wilgotności i czujnika ruchu).
- *Encje* to najmniejsze jednostki danych. Każda encja reprezentuje konkretną funkcję lub właściwość (np. stan włącznika, odczyt temperatury). Encje posiadają również stany oraz atrybuty, które są przechowywane w bazie danych systemu.
- *Obszary* pozwalają na logiczne grupowanie urządzeń i encji według ich fizycznej lokalizacji w domu (np. garaż). Umożliwia to łatwiejsze zarządzanie grupami urządzeń, np. poprzez wyłączenie wszystkich świateł w danym pomieszczeniu jedną komendą.

=== Silnik Automatyzacji

Home Assistant posiada mechanizm automatyzacji, który pozwala na tworzenie scenariuszy interakcji między urządzeniami. Każda automatyzacja składa się z trzech podstawowych elementów. Pierwszym z nich są wyzwalacze, które inicjują sprawdzenie automatyzacji. Drugim elementem są warunki, które określają, czy działanie powinno zostać wykonane. Ostatnim elementem są działania, czyli operacje wykonywane po spełnieniu warunków.

=== Ekosystem i Rozszerzalność

System Home Assistant wyróżnia się ogromnym ekosystemem, który znacznie wykracza poza standardowe integracje:

- *Dodatki (Add-ons):* To kontenery Dockerowe uruchamiane równolegle z Home Assistant, dostarczające dodatkowe usługi, takie jak serwer MQTT (Mosquitto), bazy danych (InfluxDB) czy narzędzia do wizualizacji (Grafana).
- *HACS (Home Assistant Community Store):* Nieoficjalne repozytorium społecznościowe, pozwalające na instalację niestandardowych integracji oraz elementów interfejsu graficznego, które nie zostały jeszcze włączone do oficjalnej dystrybucji.
- *Blueprints:* Gotowe szablony automatyzacji, które użytkownicy mogą łatwo importować i konfigurować bez konieczności samodzielnego tworzenia logiki od podstaw.

=== Interfejs Użytkownika i Komunikacja

Głównym sposobem interakcji z systemem jest pulpit nawigacyjny (Dashboard), oparty na silniku Lovelace. Jest on w pełni konfigurowalny i responsywny, co pozwala na tworzenie przejrzystych interfejsów sterowania dostępnych zarówno przez przeglądarkę WWW, jak i dedykowane aplikacje mobilne na systemy Android i iOS. Przykładowy wygląd pulpitu nawigacyjnego przedstawiono na rysunku @fig:ha-dashboard.

#figure(
  image("images/HA-dashboard.png", width: 100%),
  caption: [Przykładowy pulpit nawigacyjny systemu Home Assistant],
) <fig:ha-dashboard>

Home Assistant wspiera szeroki wachlarz protokołów komunikacyjnych, co czyni go prawdziwym centrum inteligentnego domu. Do najpopularniejszych należą:
- *Wi-Fi:* Wykorzystywany przez wiele urządzeń IoT, często poprzez protokół MQTT.
- *Zigbee i Z-Wave:* Energooszczędne protokoły typu mesh, idealne dla czujników bateryjnych.
- *Matter:* Najnowszy standard, wspierany przez największe firmy na rynku.

Dzięki swojej elastyczności i otwartości, Home Assistant jest obecnie uznawany za jedną z najbardziej wszechstronnych platform do budowy zaawansowanych systemów Smart Home, stanowiąc doskonałą bazę do badań naukowych i realizacji projektów inżynierskich.
