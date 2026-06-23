#include "intro/intro.typ"

== Testy w warstwie sieciowej (Layer 3) - Izolacja sieciowa

Niniejsza sekcja opisuje eksperymenty przeprowadzone w celu zbadania mechanizmów separacji ruchu w warstwie sieciowej. Testy polegały na weryfikacji drożności pakietów ICMP Echo (polecenie `ping`) pomiędzy różnymi węzłami sieciowymi w trzech różnych scenariuszach konfiguracji fizycznej i logicznej routerów.

#include "Layer3_tests/scenariusz_1 - tplink and ISP router not connected/s1.typ"
#include "Layer3_tests/scenariusz_2 - tplink and ISP router connected (WAN to LAN) without acces controll rules/s2.typ"
#include "Layer3_tests/scenariusz_3 - tplink and ISP router connected (WAN to LAN), acces controll rules on tplink/s3.typ"

#include "Layer4_tests/layer4.typ"


