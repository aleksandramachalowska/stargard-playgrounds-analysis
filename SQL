-- ==========================================
-- Analiza dostępności placów zabaw w Stargardzie
-- PostgreSQL + PostGIS
-- ==========================================

-- Ustawienie SRID dla granicy miasta

UPDATE stargard
SET geom = ST_SetSRID(geom, 2180)
WHERE ST_SRID(geom) = 0;

-- Transformacja danych OSM do EPSG:2180

CREATE TABLE planet_osm_polygon_2180 AS
SELECT
    *,
    ST_Transform(way, 2180) AS geom_2180
FROM planet_osm_polygon;

-- Przycięcie danych do granicy Stargardu

CREATE TABLE planet_osm_polygon_stargard AS
SELECT p.*
FROM planet_osm_polygon_2180 p
JOIN stargard b
ON ST_Within(p.geom_2180, b.geom);

-- Wybór placów zabaw

CREATE TABLE place_zabaw_polygon AS
SELECT *
FROM planet_osm_polygon_stargard
WHERE leisure = 'playground';

-- Liczba placów zabaw

SELECT COUNT(*)
FROM place_zabaw_polygon;

-- Bufory 500 m wokół placów zabaw

CREATE TABLE bufory_poligony AS
SELECT
    ST_Buffer(geom_2180, 500) AS geom
FROM place_zabaw_polygon;

-- Połączenie buforów

CREATE TABLE zasieg_placow AS
SELECT ST_Union(geom) AS geom
FROM bufory_poligony;

-- Procent powierzchni miasta w zasięgu placów zabaw

SELECT
    ROUND(
        (
            100 * ST_Area(z.geom) /
            ST_Area(s.geom)
        )::numeric,
        2
    ) AS procent_pokrycia
FROM zasieg_placow z,
     stargard s;

-- Budynki znajdujące się w zasięgu placów zabaw

SELECT COUNT(*)
FROM planet_osm_polygon_stargard b
JOIN zasieg_placow z
ON ST_Intersects(b.way, z.geom)
WHERE building IS NOT NULL;

-- Procent budynków mających plac zabaw w odległości do 500 m

SELECT
ROUND(
    100 * (
        SELECT COUNT(*)
        FROM planet_osm_polygon_stargard b
        JOIN zasieg_placow z
        ON ST_Intersects(b.way, z.geom)
        WHERE building IS NOT NULL
    )
    /
    (
        SELECT COUNT(*)
        FROM planet_osm_polygon_stargard
        WHERE building IS NOT NULL
    ),
    2
) AS procent;
