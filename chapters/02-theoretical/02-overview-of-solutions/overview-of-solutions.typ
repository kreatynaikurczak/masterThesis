Wybór odpowiedniej platformy sprzętowej jest fundamentalną decyzją przy wdrażaniu systemu automatyki domowej opartego na Home Assistant. Jako platforma open-source, Home Assistant został zaprojektowany tak, aby był niezależny od sprzętu, wspierając szeroką gamę architektur — od energooszczędnych komputerów jednopłytkowych opartych na architekturze ARM po wysokowydajne serwery x86-64. Wybór zależy od kilku czynników: złożoności logiki automatyzacji, liczby zintegrowanych urządzeń, potrzeby lokalnego przetwarzania danych (takich jak rozpoznawanie obrazu) oraz pożądanego poziomu niezawodności i redundancji systemu.

=== Kontekst historyczny: Fundamenty informatyki
Aby zrozumieć obecny krajobraz sprzętu do automatyki domowej, warto spojrzeć wstecz na początki komputerów osobistych. Procesor Intel 8086, wprowadzony w 1978 roku, ustanowił architekturę x86, która do dziś pozostaje dominującą siłą w informatyce. Choć sam 8086 jest zbyt prymitywny dla nowoczesnej automatyki domowej, jego dziedzictwo żyje w potężnych serwerach x86-64, których wielu entuzjastów używa do uruchamiania złożonych instancji Home Assistant.

#figure(
  image("images/Procesor Intel 8086 z 1978.png", width: 60%),
  caption: [Procesor Intel 8086, który zapoczątkował architekturę wciąż używaną w nowoczesnych, wysokiej klasy serwerach domowych.],
)

=== Komputery jednopłytkowe (SBC)
Komputery jednopłytkowe stały się najpopularniejszym wyborem dla użytkowników Home Assistant ze względu na niski pobór mocy, kompaktowe rozmiary i cichą pracę.

==== Raspberry Pi
Seria Raspberry Pi jest najszerzej wspieraną platformą dla Home Assistant. Jej popularność wynika z przystępnej ceny i ogromnego wsparcia społeczności. System "Home Assistant OS" (HAOS) jest specjalnie zoptymalizowany dla Raspberry Pi, oferując użytkownikom doświadczenie typu "po prostu działa".

#figure(
  image("images/raspberrypi.png", width: 70%),
  caption: [Raspberry Pi pozostaje standardem wejściowym dla entuzjastów automatyki domowej.],
)

==== ODROID-C4
Dla użytkowników wymagających większej stabilności i lepszej wydajności pamięci masowej niż w przypadku konstrukcji Raspberry Pi opartej na kartach microSD, ODROID-C4 stanowi przekonującą alternatywę. Dzięki obsłudze modułów eMMC, ODROID-C4 zapewnia znacznie wyższą niezawodność operacji wejścia/wyjścia dysku, co jest kluczowe dla baz danych SQLite lub MariaDB, których Home Assistant używa do przechowywania historycznych danych o stanie urządzeń.

#figure(
  image("images/ODROID-C4.png", width: 70%),
  caption: [ODROID-C4 stanowi solidną alternatywę z lepszymi opcjami pamięci masowej, takimi jak eMMC.],
)

=== Dedykowany sprzęt: Home Assistant Green
Dostrzegając potrzebę prostego punktu wejścia, Nabu Casa (firma stojąca za Home Assistant) wprowadziła Home Assistant Green. Urządzenie to zostało zaprojektowane jako najłatwiejszy sposób na rozpoczęcie przygody z Home Assistant, dostarczane z preinstalowanym oprogramowaniem i zoptymalizowane pod kątem wydajności od razu po wyjęciu z pudełka, bez konieczności montażu technicznego.

#figure(
  image("images/3D architectural view of the internal hardware components of the Home Assistant Green.png", width: 80%),
  caption: [Widok architektoniczny 3D wewnętrznych komponentów sprzętowych Home Assistant Green, prezentujący jego zoptymalizowaną konstrukcję.],
)

=== Rozwiązania wysokowydajne i klasy enterprise
W miarę jak systemy automatyki domowej rozrastają się i obejmują dziesiątki kamer, złożone modele uczenia maszynowego do wykrywania obiektów oraz liczne usługi zwirtualizowane, ograniczenia komputerów SBC stają się widoczne. W takich przypadkach użytkownicy zwracają się ku mocniejszemu sprzętowi.

==== Komputery osobiste x86-64
Wykorzystanie standardowego komputera PC x86-64 lub dedykowanego serwera pozwala na praktycznie nieograniczoną rozbudowę. Systemy te obsługują szybkie pamięci masowe NVMe, duże ilości pamięci RAM i potężne procesory zdolne do obsługi intensywnych zadań, takich jak transkodowanie wideo w czasie rzeczywistym i automatyzacja oparta na sztucznej inteligencji.

#figure(
  image("images/Generic x86-64 PC.png", width: 70%),
  caption: [Standardowy komputer PC x86-64 oferuje maksymalną elastyczność i wydajność dla instalacji na dużą skalę.],
)

==== Nowoczesne komputery Mini PC: Apple Mac Mini
Najnowsza generacja komputerów Mini PC, której przykładem jest Apple Mac Mini z czipem M4, reprezentuje szczyt wydajności w stosunku do zużytej energii. Urządzenia te oferują wydajność klasy stacji roboczej w obudowie niewiele większej od niektórych komputerów SBC. Dla użytkowników, którzy chcą uruchamiać Home Assistant obok innych ciężkich obciążeń (takich jak serwer mediów czy prywatna chmura), te nowoczesne jednostki zapewniają doskonałą równowagę między mocą a wydajnością.

#figure(
  image("images/Komputer APPLE Mac Mini 2024 M4.png", width: 70%),
  caption: [Apple Mac Mini M4 służy jako wysokiej klasy, energooszczędna platforma dla wymagających centrów automatyki domowej.],
)


Krajobraz sprzętowy dla Home Assistant jest zróżnicowany, od przystępnych cenowo Raspberry Pi i Home Assistant Green po wysokowydajne serwery x86-64 i nowoczesne komputery Mini PC. Idealny wybór jest określany przez specyficzne wymagania ekosystemu inteligentnego domu, balansując między kosztem, łatwością obsługi a zapotrzebowaniem na moc obliczeniową.
