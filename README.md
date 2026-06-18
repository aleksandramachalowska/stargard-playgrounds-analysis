# Analiza dostępności placów zabaw w Stargardzie

## Opis projektu

Projekt przedstawia analizę dostępności placów zabaw w Stargardzie z wykorzystaniem PostgreSQL, PostGIS oraz QGIS.
Celem analizy było określenie, jaka część powierzchni miasta oraz budynków znajduje się w zasięgu 500 m od istniejących placów zabaw.

## Wykorzystane technologie

- PostgreSQL
- PostGIS
- QGIS

## Dane

W projekcie wykorzystano dane:
- OpenStreetMap (lokalizacja placów zabaw, budynków),
- Państwowy Rejestr Granic (granice administracyjne Stargardu i Polski).

## Zakres prac

- pozyskanie danych OpenStreetMap oraz Państwowego Rejestru Granic,
- import danych do PostgreSQL,
- przygotowanie danych w PostgreSQL/PostGIS (m.in. wyodrębnienie warstw z placami zabaw i budynkami, transformacja układów współrzędnych oraz utworzenie indeksów przestrzennych),
- utworzenie buforów 500 m wokół placów zabaw oraz ich agregacja,
- analiza pokrycia powierzchni miasta oraz dostępności budynków w odniesieniu do placów zabaw,
- wizualizacja wyników w QGIS.

Analiza została przeprowadzona w układzie współrzędnych EPSG:2180.

## Wyniki

Z danych OpenStreetMap wyodrębiono 62 place zabaw. Analiza wykazała, że 42% powierzchni miasta znajduje się w zasięgu 500 m od placu zabaw.
Jednocześnie 44% budynków ma dostęp do placu zabaw w promieniu 500 m.

## Mapa wynikowa

![Mapa dostępności placów zabaw](place_zabaw.png)

## Autor

Aleksandra Machałowska
