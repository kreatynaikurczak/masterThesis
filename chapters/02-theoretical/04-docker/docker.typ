== Docker

Docker to otwarta platforma służąca do automatyzacji wdrażania, skalowania i zarządzania aplikacjami wewnątrz lekkich i przenośnych kontenerów. Została ona zapoczątkowana przez Solomona Hykesa i udostępniona jako projekt open-source w marcu 2013 roku. Docker zrewolucjonizował podejście do tworzenia oprogramowania, wprowadzając standard konteneryzacji, który pozwala na izolację aplikacji od infrastruktury systemowej, zapewniając ich spójne działanie w różnych środowiskach — od lokalnej maszyny programisty po zaawansowane klastry obliczeniowe w chmurze.

=== Konteneryzacja a Wirtualizacja

Kluczem do zrozumienia fenomenu Dockera jest rozróżnienie między tradycyjną wirtualizacją a konteneryzacją. Tradycyjne maszyny wirtualne (VM) wymagają pełnego systemu operacyjnego (Guest OS) dla każdej instancji, co wiąże się z dużym narzutem zasobów (procesora, pamięci RAM i miejsca na dysku).

Konteneryzacja, na której opiera się Docker, wykorzystuje mechanizmy jądra systemu operacyjnego gospodarza (takie jak namespaces i control groups w systemie Linux) do izolacji procesów. Dzięki temu kontenery współdzielą jądro systemu z gospodarzem, co czyni je znacznie lżejszymi, szybszymi w uruchamianiu i bardziej wydajnymi pod względem wykorzystania zasobów niż maszyny wirtualne.

=== Architektura Systemu Docker

Architektura Dockera opiera się na modelu klient-serwer (rysunek @fig:docker-architecture). Głównymi elementami tego systemu są:

- *Docker Daemon (dockerd):* Działa w tle na systemie gospodarza i zarządza obiektami Dockera, takimi jak obrazy, kontenery, sieci oraz wolumeny.
- *Docker Client:* Narzędzie linii komend (CLI), które pozwala użytkownikowi komunikować się z demonem Dockera poprzez API REST.
- *Docker Registry:* Miejsce przechowywania obrazów. Najpopularniejszym publicznym rejestrem jest Docker Hub, ale organizacje często korzystają z prywatnych rejestrów w celu zapewnienia bezpieczeństwa.

#figure(
  image("images/dockera-architecture.png", width: 90%),
  caption: [Architektura platformy Docker i interakcja między jej komponentami],
) <fig:docker-architecture>

=== Kluczowe Pojęcia i Obiekty

W ekosystemie Dockera wyróżnia się kilka fundamentalnych pojęć, które stanowią o jego funkcjonalności:

- *Obraz (Image):* Tylko do odczytu szablon instrukcji służący do tworzenia kontenera. Często obraz bazuje na innym obrazie z dodatkowymi modyfikacjami (np. obraz aplikacji bazujący na obrazie systemu Ubuntu z zainstalowanym serwerem Apache).
- *Kontener (Container):* Uruchomiona instancja obrazu. Można go tworzyć, uruchamiać, zatrzymywać, przenosić lub usuwać. Kontenery są z definicji ulotne, co oznacza, że dane w nich zapisane zostają utracone po ich usunięciu, chyba że zostaną użyte mechanizmy trwałości danych (wolumeny).
- *Dockerfile:* Plik tekstowy zawierający zestaw instrukcji, które Docker wykonuje w celu automatycznego zbudowania obrazu. Pozwala to na pełną dokumentację środowiska i łatwą reprodukcję artefaktów.
- *Wolumeny (Volumes):* Mechanizm służący do trwałego przechowywania danych generowanych i używanych przez kontenery. Wolumeny są zarządzane przez Dockera i są niezależne od cyklu życia samego kontenera.

=== Zalety Wykorzystania Dockera w Projektach Inżynierskich

Zastosowanie Dockera w procesie wytwórczym oprogramowania niesie ze sobą szereg korzyści:

1. *Izolacja środowiska:* Każdy kontener posiada własne biblioteki i zależności, co eliminuje problem "u mnie działa" oraz konflikty między różnymi wersjami oprogramowania na tej samej maszynie.
2. *Przenośność:* Raz zbudowany obraz może zostać uruchomiony na dowolnym systemie wspierającym Dockera, bez konieczności dodatkowej konfiguracji.
3. *Szybkość i wydajność:* Kontenery uruchamiają się w ciągu milisekund, co pozwala na błyskawiczne skalowanie usług i optymalne wykorzystanie infrastruktury.
4. *Usprawnienie CI/CD:* Docker idealnie wpisuje się w potoki ciągłej integracji i ciągłego wdrażania, umożliwiając automatyczne budowanie i testowanie identycznych artefaktów na każdym etapie cyklu życia aplikacji.

Dzięki tym cechom Docker stał się standardem de facto w nowoczesnym inżynierii oprogramowania, stanowiąc fundament dla architektury mikroserwisowej oraz nowoczesnych systemów automatyki i IoT.
