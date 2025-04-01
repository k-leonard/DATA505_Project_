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

COMMIT;
