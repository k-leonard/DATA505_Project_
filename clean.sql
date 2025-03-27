START TRANSACTION;

INSERT INTO Netflix_Movies_Rankings (rank, title, points, date_scraped)
SELECT DISTINCT ON (netflix_movies.raw_json->>1, netflix_movies.added_at)  -- Ensure distinct title and date_scraped
    (netflix_movies.raw_json->>0) AS rank,  -- First element (rank)
    (netflix_movies.raw_json->>1) AS title,  -- Second element (title)
    CAST(netflix_movies.raw_json->>2 AS INT) AS points,  -- Third element (points)
    (netflix_movies.added_at) AS date_scraped  -- Date scraped from the testing table
FROM netflix_movies
WHERE netflix_movies.raw_json IS NOT NULL;

INSERT INTO Netflix_TV_Rankings (rank, title, points, date_scraped)
SELECT DISTINCT ON (netflix_tv.raw_json->>1, netflix_tv.added_at)  -- Ensure distinct title and date_scraped
    (netflix_tv.raw_json->>0) AS rank,  -- First element (rank)
    (netflix_tv.raw_json->>1) AS title,  -- Second element (title)
    CAST(netflix_tv.raw_json->>2 AS INT) AS points,  -- Third element (points)
    (netflix_tv.added_at) AS date_scraped  -- Date scraped from the testing table
FROM netflix_tv
WHERE netflix_tv.raw_json IS NOT NULL;


COMMIT;
