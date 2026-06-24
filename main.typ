#import "template.typ": setup
#import "chapters/title-page/title-page.typ": title-page

#show: setup

#title-page()

#outline(indent: auto)

#include "chapters/content.typ"

// #bibliography("bibliografia.bib")
