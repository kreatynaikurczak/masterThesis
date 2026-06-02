#set page(numbering: "1")

#grid(
  columns: (80pt, 1fr, 80pt),
  // Lewa kolumna na logo, środek na tekst, prawa na drugie logo
  align: (left + horizon, center + horizon, right + horizon),
  // Wyrównanie w pionie i poziomie
  stroke: none,
  // Brak obramowania, czysty układ

  // 1. Lewe logo (skonwertowane do PNG)
  image("media/logo_pk.png", width: 100%),

  // 2. Środkowy tekst
  [
    #strong[POLITECHNIKA KRAKOWSKA \ im. T. Kościuszki] \
    #v(3pt)
    Wydział Inżynierii Elektrycznej i Komputerowej \
    #v(3pt)
    #strong[Katedra ..................................]
  ],

  // 3. Prawe logo (istniejący PNG)
  image("media/logo_wieik.png", width: 100%),
)

#align(center)[
  Kierunek studiów: \..........................

  #quote(block: true)[
    Specjalność: ……………………………..
  ]
  #v(2.5cm)
  STUDIA STACJONARNE
  #v(0.5cm)
  #strong[PRACA DYPLOMOWA]
  #v(0.5cm)
  INŻYNIERSKA / MAGISTERSKA
  #v(0.5cm)
  #strong[Imię NAZWISKO]
  #v(0.5cm)
  TEMAT PRACY (w języku polskim)
  #v(0.5cm)
  TEMAT PRACY (w języku angielskim)
  #align(right)[
    #v(2.5cm)
    Opiekun pracy:

    #emph[Imię i nazwisko opiekuna pracy]
  ]
  #v(.5cm)
  Kraków, 20……..
]
#pagebreak()
SPIS TREŚCI

Streszczenie pracy dyplomowej w języku polskim i angielskim…………………………

Wykaz słów kluczowych w języku polskim i angielskim………………………………...

Wykaz ważniejszych oznaczeń i skrótów (opcjonalnie)

#link(<streszczenie-w-języku-polskim-i-angielskim>)[1. WSTĘP #link(<streszczenie-w-języku-polskim-i-angielskim>)[3]]

#link(<wprowadzenie>)[1.1. Wprowadzenie #link(<wprowadzenie>)[4]]

#link(<cel-i-zakres-pracy>)[1.2. Cel i zakres pracy #link(<cel-i-zakres-pracy>)[4]]

#link(<przegląd-zawartości-pracy>)[1.3. Przegląd zawartości pracy #link(<przegląd-zawartości-pracy>)[4]]

#link(<podstawy-teoretyczne-związane-z-tematem-pracy>)[
  2. PODSTAWY TEORETYCZNE ZWIĄZANE Z~TEMATEM PRACY #link(<podstawy-teoretyczne-związane-z-tematem-pracy>)[5]
]

#link(
  <przykład-umieszczenia-tabeli-i-rysunków-w-tekście-pracy>,
)[2.1. Przykład umieszczenia tabeli i rysunków w tekście pracy #link(<przykład-umieszczenia-tabeli-i-rysunków-w-tekście-pracy>)[5]]

// #link(
//   <przykład-umieszczenia-wzorów-w-tekście-pracy>,
// )[2.2. Przykład umieszczenia wzorów w tekście pracy #link(<przykład-umieszczenia-wzorów-w-tekście-pracy>)[6]]

#link(<opis-realizacji-tematu-pracy>)[3. OPIS REALIZACJI TEMATU PRACY #link(<opis-realizacji-tematu-pracy>)[7]]

#link(<_Toc436668047>)[4. ANALIZA WYNIKÓW #link(<_Toc436668047>)[7]]

#link(<podsumowanie>)[5. PODSUMOWANIE #link(<podsumowanie>)[7]]

// #link(<_Toc436668049>)[BIBLIOGRAFIA #link(<_Toc436668049>)[7]]

DODATKI
#pagebreak()
= \ Streszczenie w języku polskim i angielskim \
<streszczenie-w-języku-polskim-i-angielskim>
= \ Wykaz słów kluczowych w języku polskim i angielskim
<wykaz-słów-kluczowych-w-języku-polskim-i-angielskim>
= WSTĘP
<wstęp>
Niniejszy dokument zawiera wskazówki merytoryczne oraz uwagi i
formatowania zalecane podczas przygotowywania prac dyplomowych.
Zawartość pracy inżynierskiej powinna przedstawiać inżynierskie
umiejętności odtwórcze dyplomanta. #strong[Praca magisterska powinna
  ponadto zawierać elementy twórcze i badawcze potwierdzające zdolność
  dyplomanta do samodzielnej pracy koncepcyjnej, prowadzenia badań oraz
  formułowania wniosków.]

Zgodnie z odnośnym Zarządzeniem Rektora PK należy opracować
#strong[streszczenie] oraz #strong[słowa kluczowe] pracy dyplomowej w
języku polskim i angielskim. \ Tekst pracy należy napisać czcionką Time
New Roman 12, odstęp 1,25 wiersza, wcięcie pierwszego wiersza: 0,63
(Styl Standardowy). Do całości pracy należy zastosować wyjustowanie
akapitów, lewy margines ma wynosić 3,5~cm, natomiast pozostałe marginesy
oraz nagłówek i stopka 2,5~cm. Podczas przygotowywania pracy należy
uwzględnić konieczność wydruku dwustronnego (marginesy lustrzane).
Oprawa pracy powinna być zrobiona przy użyciu plastikowego grzbietu
i~miękkich okładek. Rozdziały główne pracy należy umieszczać się od
nowej strony.

Pisanie pracy dyplomowej wymaga używania poprawnego języka oraz
znajomości określeń i sformułowań technicznych. Język i terminologia
powinny być zrozumiałe. Praca powinna być pisana w sposób jednolity,
najlepiej przy użyciu formy bezosobowej pisowni (np. „wykazano" itd.).

W pracy dyplomowej należy podawać definicję terminu, przy pierwszym jego
użyciu, pamiętając o tym, że dane sformułowanie musi być zrozumiałe dla
każdego potencjalnego czytelnika. Nie należy stosować skrótów nazw metod
albo firm itp., bez wcześniejszego rozwinięcia ich znaczenia oraz
przetłumaczenia na język polski. Dopuszcza się stosowanie pojęć
anglojęzycznych (bez ich przetłumaczenia), w~przypadku braku polskich
odpowiedników. Pojęcia takie zapisuje się używając pochyłej czcionki
(kursywy).

Przy redagowaniu pracy należy pamiętać o zasadach prawidłowego
stosowania znaków interpunkcyjnych, w tym nie poprzedzać ich spacjami
(za wyjątkiem nawiasów, dywizów i myślników).

Nie ma formalnych wymagań określających objętość pracy dyplomowej.
Typowa praca dyplomowa inżynierska (projekt inżynierski) powinna
zawierać ok. 30--40 stron tekstu oraz dodatki. #strong[Natomiast typowa
  praca dyplomowa magisterska powinna zawierać około 50--60 stron tekstu i
  obliczeń oraz dodatki.] Praca „zbyt cienka" zwraca uwagę jako
prawdopodobnie powierzchowna, niedostatecznie rozwinięta
i~udokumentowana, a~zatem niestaranna. Nie są też zalecane prace
nadmiernie „grube", gdyż z dużym prawdopodobieństwem znajdują się w nich
informacje niezwiązane bezpośrednio z~podjętym tematem lub często teksty
zaczerpnięte bezpośrednio z~literatury.

== Wprowadzenie
<wprowadzenie>
Praca dyplomowa inżynierska lub projekt dyplomowy inżynierski
realizowane są na studiach I~stopnia, na kierunkach inżynierskich i mają
charakter pracy przeglądowej, projektu, dzieła, modelu, prostej
aparatury lub innego rozwiązania inżynierskiego, np. rozwiązania
technicznego, wykonania układu elektrycznego itp. Praca polega na
zastosowaniu metod inżynierskich do osiągnięcia celu pracy, zawiera
przegląd literatury technicznej i naukowej.

#strong[Praca dyplomowa magisterska realizowana jest na studiach II
  stopnia i ma charakter pracy teoretycznej, projektowej, obliczeniowej,
  doświadczalnej, analitycznej na pograniczu z pracą badawczą, czy
  rozwiązania skomplikowanego problemu inżynierskiego, np. projektu o
  złożonej problematyce, opracowanego w~zakresie właściwym dla projektu
  koncepcyjnego, albo nowatorskiego układu elektrycznego. Autor
  wykorzystuje wiedzę z programu studiów, jednak zwykle wykracza poza
  program studiów. Praca polega na zastosowaniu metod naukowych do
  osiągnięcia celu pracy, zawiera przegląd literatury naukowej
  i~zawodowej].

== Cel i zakres pracy
<cel-i-zakres-pracy>
Treść pracy dyplomowej musi być zgodna z tytułem pracy, celem pracy i
jej zakresem, z~których muszą bezpośrednio wynikać tytuły rozdziałów i
podrozdziałów oraz ich zawartość. Praca powinna wyczerpująco rozwinąć
problem naukowy, techniczny, inżynierski, zawodowy zawarty w~tytule
pracy. W każdym rozdziale w sposób uporządkowany i logiczny autor
(autorzy) powinni przedstawić istotę poruszanego zagadnienia. Praca
dyplomowa nie może nosić znamion plagiatu. Zgodnie z procedurą, autor
pracy, po uzyskaniu akceptacji opiekuna, przekazuje wersję elektroniczną
pracy, do weryfikacji przez system antyplagiatowy. Ze względu na
możliwość pojawienia się problemu z wprowadzeniem pracy dyplomowej do
ASAP w rozmiarze większym niż 20 MB nie należy przekraczać tej wartości

== Przegląd zawartości pracy
<przegląd-zawartości-pracy>
Praca powinna rozpoczynać się od podania #strong[spisu treści]. W
przypadku dużej liczby wzorów w pracy należy zamieścić „Wykaz oznaczeń".
We wstępie autor (autorzy) nakreśla problematykę opisaną lub
rozwiązywaną w pracy dyplomowej wraz z~uzasadnieniem jej realizacji.
Podaje cel i~ewentualnie tezę (hipotezę). Syntetycznie opisuje
dotychczasowe dokonania w danej tematyce, założenia techniczne oraz może
zwięźle przedstawić zawartość poszczególnych rozdziałów. Każda praca
dyplomowa, powinna zawierać część zasadniczą, składającą się z kilku
rozdziałów (podrozdziałów, punktów), wnioski, a także
„#strong[Bibliografię]". Treści drugorzędne, wyprowadzenia, schematy,
dodatkowe zestawienia można zamieścić w postaci dodatku.

= \ PODSTAWY TEORETYCZNE ZWIĄZANE Z~TEMATEM PRACY
<podstawy-teoretyczne-związane-z-tematem-pracy>
W przypadku, gdy temat łączy w sobie kilka dziedzin można podstawy
teoretyczne zawrzeć w kilku rozdziałach.

== Przykład umieszczenia tabeli i rysunków w tekście pracy
<przykład-umieszczenia-tabeli-i-rysunków-w-tekście-pracy>
Rysunki (tylko dobrej jakości, min. 300 dpi) oraz tabele występujące w
tekście należy wyśrodkowywać i definiować jako ruchomy z tekstem. Każdy
rysunek oraz tabela musi zawierać numer oraz podpis. Podpis umieszcza
się pod rysunkiem ( raczej jako kolejny akapit, rzadziej jako element
rysunku) oraz nad tabelą, tak jak to przedstawiają poniższe przykłady.
Odstęp pomiędzy tekstem a rysunkiem wynosi jedną linię. Nie należy
wstawiać do pracy rysunków oraz tabel bez ich opisu lub komentarza w
tekście.

#figure(image("./media/image3.png", height: 2.88542in, width: 4.375in), caption: [
  Rys. 2.1. Przebieg czasowy \[4\]
])

#figure(
  align(center)[#table(
    columns: (33.91%, 33.32%, 32.77%),
    align: (auto, auto, auto),
    table.header(
      table.cell(align: center)[#strong[Uszkodzenia]],
      table.cell(align: center)[#strong[Przyczyny]],
      table.cell(align: center)[#strong[Kroki
        zapobiegawcze]],
    ),
    table.hline(),
    [Złuszczenia

      Powierzchnia bieżni wykazuje ślady zużycia. W dalszej eksploatacji
      występują wyraźnie widoczne wykruszenia

    ],
    [Za duże obciążenie lub złe obchodzenie się z łożyskiem.

      Nieprawidłowy montaż.

      Niewystarczająca dokładność osadzeń wału i oprawy.

    ],
    [Sprawdzić obciążenie łożyska.

      Wybrać inny rodzaj łożyska.

      Sprawdzić luz łożyska

      Sprawdzić dokładność wykonania wału i oprawy.

    ],
  )],
  caption: [Tabela 2.1. Nagłówek tabeli \[7\]

  ],
  kind: table,
)

Numeracje rysunków, tabel oraz wzorów przeprowadza się w obrębie
głównych rozdziałów.

// == Przykład umieszczenia wzorów w tekście pracy
// <przykład-umieszczenia-wzorów-w-tekście-pracy>
// Jeżeli występują w tekście wzory należy je numerować oraz podać opis
// wielkości w~nich występujących. Wzory matematyczne należy zapisywać
// czcionką 12-punktową (tak jak tekst zasadniczy) za pomocą edytora
// wzorów. Wzory należy wyśrodkowywać tabulatorem, a~numerowanie wzorów
// wyrównywać do prawej krawędzi tak jak przedstawia to poniższy przykład.

// #figure(
//   align(center)[#table(
//     columns: (91.68%, 8.32%),
//     align: (auto, auto),
//     table.header(table.cell(align: center)[#box(image("./media/image4.wmf"))], table.cell(align: center)[\(2.1)]),
//     table.hline(),
//   )],
//   kind: table,
// )

// gdzie:

// #box(image("./media/image5.wmf")) -- maksimum intensywności obciążenia,

// #box(image("./media/image6.wmf")) -- przepływ.

// Pismem pochyłym (kursywą) oznacza się:

// - litery oznaczające liczby, wielkości zmienne i stałe oraz punkty
//   geometryczne,

// - oznaczenia funkcji, zmienne np. #emph[f]\(#emph[x]),

// - oznaczenia literowe i skróty literowe występujące w indeksach dolnych
//   i~górnych (z wyjątkiem skrótów dwu- lub trzyliterowych, np.
//   #emph[i]#sub[kr~], #emph[X]#sub[we~], #emph[X]#sub[wy~], utworzonych z
//   pierwszych liter jakiegoś jednego słowa).

//   Pismem prostym (antykwą) oznacza się:

// - liczby arabskie i rzymskie, także w indeksach, np. #emph[x]#sub[1],

// - oznaczenia i skróty jednostek miar, np. m, g,

// - skróty złożone z dwu lub większej liczby liter, np. Re (liczba
//   Reynoldsa),

// - stałe symbole funkcyjne, takie jak np.: ln, log, max, min, mod, Re,
//   sin, tg,

// - znak różniczki d, znak różniczki niezupełnej ∂,

// - liczby specjalne: π i e (podstawa logarytmu naturalnego).

// Pismem prostym półgrubym wyróżnia się macierze (np. #strong[A, I, E])
// oraz wektory.

= \ OPIS REALIZACJI TEMATU PRACY
<opis-realizacji-tematu-pracy>
Ten rozdział lub kolejne rozdziały czy też podrozdziały powinny opisywać
i~ilustrować zagadnienia rozważane w pracy. Tu należy wyraźnie
przedstawić zakres własnej pracy wykonanej podczas realizacji tematu
pracy. <_Toc436668047>

= ANALIZA WYNIKÓW
<analiza-wyników>
W tym rozdziale należy przedstawić analizę wyników obliczeń, pomiarów
czy działania zaprojektowanego układu. W pracy magisterskiej wymagane
jest zaprezentowanie w tym miejscu własnego unikalnego osiągnięcia,
rezultatu obliczeń lub nowego projektu odmiennego od stosowanych i
opisanych w literaturze.

= PODSUMOWANIE
<podsumowanie>
W podsumowaniu autor opisuje uzyskane efekty i osiągnięcia pracy i/lub
wyniki badań w sposób zwięzły i uporządkowany, odnosząc się do celu i
założeń pracy oraz osiągnięć opisanych w poszczególnych rozdziałach.
Interpretuje i ocenia rezultaty przeprowadzonych działań. Wskazuje
możliwości kontynuacji lub rozszerzenia tematu pracy lub co należy
zweryfikować, jeżeli rezultaty nie są niezadowalające. #strong[W pracy
  magisterskiej podsumowanie powinno zawierać również wypunktowane
  samodzielnie sformułowane wnioski zwięźle prezentujące najistotniejsze
  osiągnięcia własne dyplomanta.]

= BIBLIOGRAFIA
<bibliografia>
W wykazie literatury autor zamieszcza tylko te pozycje literaturowe, z
których korzystał w~trakcie pisania pracy dyplomowej. Spis literatury
należy sporządzić wg. poniższego wzoru. W spisie zamieszcza się również
wykaz materiałów pochodzących z~Internetu z podaniem adresu i daty
występowania. Jeśli w tekście pracy przytaczamy jakiś fragment z
wybranej pozycji literatury, to konieczne jest powołanie na tą pozycję
poprzez podanie numeru w nawiasach kwadratowych (\[numer w spisie
literatury\] np. \[2\]). Cytowanie dosłowne może być stosowane w
odniesieniu do definicji, istotnych stwierdzeń, formuł, tez, wniosków,
itp. Dłuższe fragmenty tekstu źródłowego nie mogą być w ten sposób
wykorzystywane w pracy. Wykaz literatury jest zwykle sortowany
chronologicznie wg daty opublikowania.

#strong[Sposób formatowania pozycji literatury:]

\1. Kim G., Lee J.H., Son J.H., #emph[Classification and Analyses of
  Business Process Anomalies], Communication Software and Networks, ICCSN,
pp. 433--437, 2009

\2. Jaszkiewicz A., #emph[Inżynieria Oprogramowania], Helion, Gliwice
1997

\3. http:/\/www.omg.org/bpmn/ Documents/Introduction\_to\_BPMN.pdf

#strong[W opracowaniu korzystano z następujących pozycji
  literaturowych:]

#block[
  #set enum(numbering: "1.", start: 1)
  + Zawadzki K. M.: #emph[Metodologia pisania prac dyplomowych
      (licencjackich, magisterskich)], Politechnika Gdańska, PWSZ, 2009.

  + Instrukcja przygotowania prac dyplomowych (licencjackich,
    magisterskich), Uniwersytet Gdański, Wydział Ekonomiczny, Sopot, 2011.
]
