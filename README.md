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

## Wnioski

Z danych OpenStreetMap wyodrębiono 62 place zabaw. Analiza wykazała, że 42% powierzchni miasta znajduje się w zasięgu 500 m od placu zabaw.
Jednocześnie 44% budynków ma dostęp do placu zabaw w promieniu 500 m. Wyniki sugerują, że nadal istnieją obszary o ograniczonym dostępie do placów zabaw. Analiza może stanowić podstawę do dalszych badań nad lokalizacją nowych placów zabaw w celu poprawy dostępności przestrzeni rekreacyjnych dla mieszkańców.

## Mapa wynikowa

![Mapa dostępności placów zabaw](place_zabaw.png)

## Ograniczenia danych

Należy uwzględnić, że dane OpenStreetMap mają charakter społecznościowy, co może wpływać na ich kompletność i aktualność. Nie wszystkie obiekty (np. place zabaw lub budynki) mogą być w pełni zmapowane, a ich dokładność zależy od jakości danych wprowadzanych przez użytkowników. W związku z tym wyniki analizy należy traktować jako przybliżenie rzeczywistej dostępności przestrzennej.

## Autor

Aleksandra Machałowska
