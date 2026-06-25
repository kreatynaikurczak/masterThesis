#heading(level: 1, numbering: none)[Streszczenie] <streszczenie>

Przedmiotem pracy dyplomowej jest implementacja serwerowego systemu automatyki domowej zbudowanego w oparciu o mikrokontrolery z rodziny ESP oraz protokół komunikacyjny MQTT. Głównym celem projektu było opracowanie skalowalnej oraz działającej lokalnie architektury inteligentnego domu, a następnie poddanie jej badaniom pod kątem bezpieczeństwa w sieci.

W części teoretycznej zostaje opisana platforma Home Assistant, która jest centralnym środowiskiem zarządzania automatyką domową. Dalej omówiona zostaje platforma Docker, która jest narzędziem konteneryzacji usług serwerowych. Następnie scharakteryzowany zostaje również protokół komunikacyjny MQTT. Uzupełnieniem tego przeglądu jest zestawienie dostępnych rozwiązań sprzętowych dla systemów tego typu.

W części praktycznej zaprojektowano i wdrożono trójwarstwowy system automatyki domowej. Warstwę fizyczną tworzą mikrokontrolery ESP32, które podzielono ze względu na zastosowanie. Pierwszy z nich to czujnik publikujący dane telemetryczne, a drugi to element wykonawczy. Rolę warstwy sieciowej pełni broker MQTT Mosquitto, a warstwę aplikacyjną stanowi platforma Home Assistant uruchomiona w kontenerze Docker na serwerze z systemem Debian.

Kluczowym elementem pracy są badania bezpieczeństwa wdrożonego systemu. Badania te przeprowadzono na przygotowanym stanowisku badawczym, na którym sieć IoT była fizycznie i logicznie odizolowana od sieci domowej przy użyciu routera TP-Link. Testy w warstwie sieciowej pozwoliły zweryfikować skuteczność izolacji ruchu ICMP w trzech różnych scenariuszach konfiguracyjnych. Z kolei testy warstwy aplikacji potwierdziły, że wymóg uwierzytelniania MQTT hasłem skutecznie blokuje nieautoryzowany dostęp do komunikacji z brokerem. Zbadano również bezpieczny zdalny dostęp do interfejsu Home Assistant za pomocą sieci VPN Tailscale, która działa na protokole WireGuard.

Uzyskane wyniki prowadzą do wniosku, że architektura łącząca separację sieci, uwierzytelnianie komunikacji z brokerem oraz tunelowanie VPN tworzy solidny i niezawodny fundament bezpiecznego systemu automatyki domowej.

#heading(level: 1, numbering: none)[Abstract] <abstract>

The subject of this thesis is the design and implementation of a server-based home automation system built upon the ESP family of microcontrollers and the MQTT communication protocol. The main goal of the project was to develop a scalable and locally operating smart home architecture and then test it for network security.

The theoretical section describes the Home Assistant platform, which serves as a central environment for managing home automation. Next, the MQTT protocol is characterized as a method for data exchange between Internet of Things devices. The Docker platform, which is a tool for containerizing server services, is also discussed. This overview is supplemented by a comparison of available hardware solutions for systems of this type.

In the practical section, a three-layer home automation system was designed and deployed. The physical layer is formed by ESP32 microcontrollers, which are divided based on their application. The first of these is a sensor publishing telemetry data, and the second is an actuator. The network layer is represented by the Mosquitto MQTT broker, while the application layer consists of the Home Assistant platform running in a Docker container on a Debian-based server.

A key element of the thesis is the security research of the deployed system. These tests were conducted on a prepared test bench where the IoT network was physically and logically isolated from the home network using a TP-Link router. Tests at the network layer allowed for the verification of the effectiveness of ICMP traffic isolation under three different configuration scenarios. Application layer tests confirmed that the MQTT password authentication requirement effectively blocks unauthorized access to communication with the broker. Secure remote access to the Home Assistant interface was also investigated using the Tailscale VPN network, which operates on the WireGuard protocol.

The obtained results lead to the conclusion that the architecture combining network separation, authentication of communication with the broker, and VPN tunneling forms a solid and reliable foundation for a secure home automation system.
