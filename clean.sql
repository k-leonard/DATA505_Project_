START TRANSACTION;

INSERT INTO Netflix_Movies_Rankings (rank, title, points, date_scraped)
SELECT DISTINCT ON (netflix_movies.raw_json->>1, netflix_movies.added_at)  -- Ensure distinct title and date_scraped
    (netflix_movies.raw_json->>0) AS rank,  -- First element (rank)
    (netflix_movies.raw_json->>1) AS title,  -- Second element (title)
    CAST(netflix_movies.raw_json->>2 AS INT) AS points,  -- Third element (points)
    (netflix_movies.added_at) AS date_scraped  -- Date scraped from the testing table
FROM netflix_movies
WHERE netflix_movies.raw_json IS NOT NULL;

INSERT INTO hbo_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (hbo_movies.raw_json ->>1, hbo_movies.added_at)
(hbo_movies.raw_json->>0) AS rank,
(hbo_movies.raw_json->>1) AS title,
CAST(hbo_movies.raw_json->>2 AS INT) AS points,
(hbo_movies.added_at) AS date_scraped
FROM hbo_movies
WHERE hbo_movies.raw_json IS NOT NULL;

INSERT INTO Disney_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (disney_movies.raw_json ->>1, disney_movies.added_at)
(disney_movies.raw_json->>0) AS rank,
(disney_movies.raw_json->>1) AS title,
CAST(disney_movies.raw_json->>2 AS INT) AS points,
(disney_movies.added_at) AS date_scraped
FROM disney_movies
WHERE disney_movies.raw_json IS NOT NULL;

INSERT INTO Amazon_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (amazon_movies.raw_json ->>1, amazon_movies.added_at)
(amazon_movies.raw_json->>0) AS rank,
(amazon_movies.raw_json->>1) AS title,
CAST(amazon_movies.raw_json->>2 AS INT) AS points,
(amazon_movies.added_at) AS date_scraped
FROM amazon_movies
WHERE amazon_movies.raw_json IS NOT NULL;

INSERT INTO Paramount_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (paramount_movies.raw_json ->>1, paramount_movies.added_at)
(paramount_movies.raw_json->>0) AS rank,
(paramount_movies.raw_json->>1) AS title,
CAST(paramount_movies.raw_json->>2 AS INT) AS points,
(paramount_movies.added_at) AS date_scraped
FROM paramount_movies
WHERE paramount_movies.raw_json IS NOT NULL;

INSERT INTO Apple_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (apple_movies.raw_json ->>1, apple_movies.added_at)
(apple_movies.raw_json->>0) AS rank,
(apple_movies.raw_json->>1) AS title,
CAST(apple_movies.raw_json->>2 AS INT) AS points,
(apple_movies.added_at) AS date_scraped
FROM apple_movies
WHERE apple_movies.raw_json IS NOT NULL;


INSERT INTO amazon2_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (amazon2_movies.raw_json ->>1, amazon2_movies.added_at)
(amazon2_movies.raw_json->>0) AS rank,
(amazon2_movies.raw_json->>1) AS title,
CAST(amazon2_movies.raw_json->>2 AS INT) AS points,
(amazon2_movies.added_at) AS date_scraped
FROM amazon2_movies
WHERE amazon2_movies.raw_json IS NOT NULL;

INSERT INTO itunes_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (itunes_movies.raw_json ->>1, itunes_movies.added_at)
(itunes_movies.raw_json->>0) AS rank,
(itunes_movies.raw_json->>1) AS title,
CAST(itunes_movies.raw_json->>2 AS INT) AS points,
(itunes_movies.added_at) AS date_scraped
FROM itunes_movies
WHERE itunes_movies.raw_json IS NOT NULL;

INSERT INTO Google_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (google_movies.raw_json ->>1, google_movies.added_at)
(google_movies.raw_json->>0) AS rank,
(google_movies.raw_json->>1) AS title,
CAST(google_movies.raw_json->>2 AS INT) AS points,
(google_movies.added_at) AS date_scraped
FROM google_movies
WHERE google_movies.raw_json IS NOT NULL;

INSERT INTO Rakuten_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (rakuten_movies.raw_json ->>1, rakuten_movies.added_at)
(rakuten_movies.raw_json->>0) AS rank,
(rakuten_movies.raw_json->>1) AS title,
CAST(rakuten_movies.raw_json->>2 AS INT) AS points,
(rakuten_movies.added_at) AS date_scraped
FROM rakuten_movies
WHERE rakuten_movies.raw_json IS NOT NULL;

INSERT INTO Chili_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (chili_movies.raw_json ->>1, chili_movies.added_at)
(chili_movies.raw_json->>0) AS rank,
(chili_movies.raw_json->>1) AS title,
CAST(chili_movies.raw_json->>2 AS INT) AS points,
(chili_movies.added_at) AS date_scraped
FROM chili_movies
WHERE chili_movies.raw_json IS NOT NULL;

INSERT INTO Vudu_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (vudu_movies.raw_json ->>1, vudu_movies.added_at)
(vudu_movies.raw_json->>0) AS rank,
(vudu_movies.raw_json->>1) AS title,
CAST(vudu_movies.raw_json->>2 AS INT) AS points,
(vudu_movies.added_at) AS date_scraped
FROM vudu_movies
WHERE vudu_movies.raw_json IS NOT NULL;

INSERT INTO freevee_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (freevee_movies.raw_json ->>1, freevee_movies.added_at)
(freevee_movies.raw_json->>0) AS rank,
(freevee_movies.raw_json->>1) AS title,
CAST(freevee_movies.raw_json->>2 AS INT) AS points,
(freevee_movies.added_at) AS date_scraped
FROM freevee_movies
WHERE freevee_movies.raw_json IS NOT NULL;


INSERT INTO osn_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (osn_movies.raw_json ->>1, osn_movies.added_at)
(osn_movies.raw_json->>0) AS rank,
(osn_movies.raw_json->>1) AS title,
CAST(osn_movies.raw_json->>2 AS INT) AS points,
(osn_movies.added_at) AS date_scraped
FROM osn_movies
WHERE osn_movies.raw_json IS NOT NULL;


INSERT INTO Starz_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (starz_movies.raw_json ->>1, starz_movies.added_at)
(starz_movies.raw_json->>0) AS rank,
(starz_movies.raw_json->>1) AS title,
CAST(starz_movies.raw_json->>2 AS INT) AS points,
(starz_movies.added_at) AS date_scraped
FROM starz_movies
WHERE starz_movies.raw_json IS NOT NULL;


INSERT INTO Viaplay_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (viaplay_movies.raw_json ->>1, viaplay_movies.added_at)
(viaplay_movies.raw_json->>0) AS rank,
(viaplay_movies.raw_json->>1) AS title,
CAST(viaplay_movies.raw_json->>2 AS INT) AS points,
(viaplay_movies.added_at) AS date_scraped
FROM viaplay_movies
WHERE viaplay_movies.raw_json IS NOT NULL;

INSERT INTO Hulu_Movie_Rankings(rank, title, points, date_scraped)
SELECT DISTINCT ON (hulu_movies.raw_json ->>1, hulu_movies.added_at)
(hulu_movies.raw_json->>0) AS rank,
(hulu_movies.raw_json->>1) AS title,
CAST(hulu_movies.raw_json->>2 AS INT) AS points,
(hulu_movies.added_at) AS date_scraped
FROM hulu_movies
WHERE hulu_movies.raw_json IS NOT NULL;


COMMIT;
