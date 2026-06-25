#let title-page(
  katedra: "Automatyki i Informatyki E1",
  kierunek: "Infotronika",
  specjalnosc: "……………………………..",
  typ-studiów: "STACJONARNE",
  stopien: "MAGISTERSKA",
  autor: "Michał Filipiak",
  temat-pl: "Projekt i implementacja serwerowego systemu automatyki domowej opartego na mikrokontrolerach ESP oraz protokole MQTT",
  temat-en: "Design and implementation of a server home automation system based on ESP microcontrollers and the MQTT protocol",
  opiekun: "dr inż. Paweł Król",
  rok: "2026",
) = {
  set page(numbering: none)
  grid(
    columns: (80pt, 1fr, 80pt),
    align: (left + horizon, center + horizon, right + horizon),
    stroke: none,
    image("images/logo_pk.png", width: 100%),
    [
      #strong[POLITECHNIKA KRAKOWSKA \ im. T. Kościuszki] \
      #v(3pt)
      Wydział Inżynierii Elektrycznej i Komputerowej \
      #v(3pt)
      #strong[Katedra #katedra]
    ],
    image("images/logo_wieik.png", width: 100%),
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
