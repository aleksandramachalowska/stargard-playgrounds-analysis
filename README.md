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

W ramach przetwarzania danych wykonano:
- import danych przestrzennych do bazy PostgreSQL,
- selekcję i przygotowanie warstw (place zabaw, budynki, granice miasta),
- transformację układów współrzędnych do jednolitego układu EPSG:2180,
- utworzenie indeksów przestrzennych w celu optymalizacji zapytań,
- wygenerowanie buforów o promieniu 500 m wokół placów zabaw,
- agregację wyników i obliczenie wskaźników dostępności,
- wizualizacja wyników w QGIS.

## Wnioski

Z danych OpenStreetMap wyodrębiono 62 place zabaw. Analiza wykazała, że 42% powierzchni miasta znajduje się w zasięgu 500 m od placu zabaw.
Jednocześnie 44% budynków ma dostęp do placu zabaw w promieniu 500 m. Wyniki sugerują, że nadal istnieją obszary o ograniczonym dostępie do placów zabaw. Analiza może stanowić podstawę do dalszych badań nad lokalizacją nowych placów zabaw w celu poprawy dostępności przestrzeni rekreacyjnych dla mieszkańców.

## Mapa wynikowa

![Mapa dostępności placów zabaw](place_zabaw.png)

## Ograniczenia danych

Należy uwzględnić, że dane OpenStreetMap mają charakter społecznościowy, co może wpływać na ich kompletność i aktualność. Nie wszystkie obiekty (np. place zabaw lub budynki) mogą być w pełni zmapowane, a ich dokładność zależy od jakości danych wprowadzanych przez użytkowników. W związku z tym wyniki analizy należy traktować jako przybliżenie rzeczywistej dostępności przestrzennej.

## Autor

Aleksandra Machałowska
