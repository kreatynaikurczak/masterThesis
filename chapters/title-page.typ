#let title-page(
  katedra: "..................................",
  kierunek: "..........................",
  specjalnosc: "……………………………..",
  typ-studiów: "STACJONARNE",
  stopien: "INŻYNIERSKA / MAGISTERSKA",
  autor: "Imię NAZWISKO",
  temat-pl: "TEMAT PRACY (w języku polskim)",
  temat-en: "TEMAT PRACY (w języku angielskim)",
  opiekun: "Imię i nazwisko opiekuna pracy",
  rok: "20……..",
) = {
  grid(
    columns: (80pt, 1fr, 80pt),
    align: (left + horizon, center + horizon, right + horizon),
    stroke: none,
    image("../media/title-page/logo_pk.png", width: 100%),
    [
      #strong[POLITECHNIKA KRAKOWSKA \ im. T. Kościuszki] \
      #v(3pt)
      Wydział Inżynierii Elektrycznej i Komputerowej \
      #v(3pt)
      #strong[Katedra #katedra]
    ],
    image("../media/title-page/logo_wieik.png", width: 100%),
  )

  align(center)[
    #v(1cm)
    Kierunek studiów: #kierunek

    #quote(block: true)[
      Specjalność: #specjalnosc
    ]
    #v(2.5cm)
    STUDIA #typ-studiów
    #v(0.5cm)
    #strong[PRACA DYPLOMOWA]
    #v(0.5cm)
    #stopien
    #v(0.5cm)
    #strong[#autor]
    #v(0.5cm)
    #temat-pl
    #v(0.5cm)
    #temat-en

    #align(right)[
      #v(2.5cm)
      Opiekun pracy:

      #emph[#opiekun]
    ]
    #v(.5cm)
    Kraków, #rok
  ]
  pagebreak()
}
