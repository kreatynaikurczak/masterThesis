//#heading(level: 2)[Home Assistant]

Home Assistant to zaawansowana platforma typu open-source, służąca do scentralizowanego zarządzania automatyką domową. System ten pełni rolę lokalnego kontrolera (tzw. bramki lub huba), integrującego różnorodne urządzenia i usługi w jedną, spójną strukturę. Kluczowym wyróżnikiem Home Assistant jest jego niezależność od dostawców chmurowych oraz nacisk na prywatność użytkownika i lokalne przetwarzanie danych.

Projekt został zapoczątkowany przez Paulusa Schoutsena we wrześniu 2013 roku jako aplikacja napisana w języku Python. Od tamtej pory, dzięki aktywnemu wsparciu społeczności zgromadzonej wokół serwisu GitHub, Home Assistant stał się jednym z najbardziej rozbudowanych i najczęściej aktualizowanych systemów automatyki domowej na świecie.

=== Filozofia i Architektura

Fundamentem Home Assistant jest idea "Local Control" (sterowanie lokalne) oraz "Privacy First" (prywatność przede wszystkim). W przeciwieństwie do wielu komercyjnych rozwiązań (np. Google Home, Amazon Alexa), Home Assistant dąży do tego, aby cała logika sterowania oraz przechowywanie danych odbywało się bezpośrednio w sieci lokalnej użytkownika. Takie podejście nie tylko zwiększa bezpieczeństwo, ale również zapewnia ciągłość działania systemu w przypadku awarii połączenia internetowego.

Architektura systemu opiera się na zdarzeniach (event-driven architecture). Wszystkie interakcje, zmiany stanów urządzeń czy wyzwalacze automatyzacji są procesowane przez centralną magistralę zdarzeń (Event Bus).

=== Kluczowe Pojęcia i Model Danych

W celu zachowania interoperacyjności między tysiącami różnych urządzeń, Home Assistant wykorzystuje sformalizowany model danych, którego podstawą są następujące komponenty:

- *Integracje (Integrations):* Są to moduły oprogramowania umożliwiające komunikację Home Assistant z zewnętrznymi platformami, urządzeniami lub usługami API.
- *Urządzenia (Devices):* Reprezentują fizyczne lub logiczne obiekty w systemie. Jedno urządzenie (np. wielofunkcyjny czujnik) może składać się z wielu encji (np. czujnika temperatury, czujnika wilgotności i czujnika ruchu).
- *Encje (Entities):* To najmniejsze jednostki danych. Każda encja reprezentuje konkretną funkcję lub właściwość (np. stan włącznika, odczyt temperatury). Encje posiadają stany (States) oraz atrybuty, które są przechowywane w bazie danych systemu.
- *Obszary (Areas):* Pozwalają na logiczne grupowanie urządzeń i encji według ich fizycznej lokalizacji w domu (np. salon, kuchnia, sypialnia). Umożliwia to łatwiejsze zarządzanie grupami urządzeń, np. wyłączenie wszystkich świateł w danym pomieszczeniu jedną komendą.

=== Silnik Automatyzacji

Home Assistant oferuje potężny mechanizm automatyzacji, który pozwala na tworzenie złożonych scenariuszy interakcji między urządzeniami. Każda automatyzacja składa się z trzech podstawowych elementów:

1. *Wyzwalacze (Triggers):* Zdarzenia, które inicjują sprawdzenie automatyzacji (np. wykrycie ruchu, konkretna godzina, zachód słońca).
2. *Warunki (Conditions):* Opcjonalne kryteria, które muszą zostać spełnione, aby działanie zostało wykonane (np. "tylko jeśli jest po godzinie 22:00" lub "tylko jeśli nikogo nie ma w domu").
3. *Działania (Actions):* Operacje wykonywane po spełnieniu warunków (np. włączenie światła, wysłanie powiadomienia na telefon).

Uzupełnieniem automatyzacji są *Skrypty*, będące sekwencjami działań wywoływanymi na żądanie, oraz *Sceny*, które pozwalają na natychmiastowe przywrócenie określonego stanu wielu urządzeń jednocześnie (np. scena "Kino" przyciemniająca światła i zasłaniająca rolety).

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
