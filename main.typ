#import "template.typ": setup
#import "chapters/titlePage.typ": title-page

#show: setup

#title-page(
  autor: "Imię NAZWISKO",
  temat-pl: "TEMAT PRACY (w języku polskim)",
  temat-en: "TEMAT PRACY (w języku angielskim)",
  opiekun: "Imię i nazwisko opiekuna pracy",
  kierunek: "Elektrotechnika",
  specjalnosc: "Automatyka i Robotyka",
)

#outline(indent: auto)

= Streszczenie
<streszczenie>
// Miejsce na streszczenie w języku polskim i angielskim

= Wykaz słów kluczowych
<slowa-kluczowe>
// Miejsce na słowa kluczowe

#include "chapters/01_wstep.typ"

#include "chapters/02_wprowadzenie.typ"

// = Kolejne rozdziały...

// #bibliography("bibliografia.bib")
