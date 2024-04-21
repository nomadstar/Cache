#!/bin/bash
set -e


# Funciona para tabla csv, cambia la tabla y adaptala  al archivo csv en caso de usar uno diferente
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE steam(
        id INT,
        app_id BIGINT,
        app_name TEXT,
        review_id BIGINT,
        language TEXT,
        review TEXT,
        timestamp_created BIGINT,
        timestamp_updated BIGINT,
        recommended BOOLEAN,
        votes_helpful BIGINT,
        votes_funny BIGINT,
        weighted_vote_score FLOAT,
        comment_count BIGINT,
        steam_purchase BOOLEAN,
        received_for_free BOOLEAN,
        written_during_early_access BOOLEAN,
        author_steamid BIGINT,
        author_num_games_owned BIGINT,
        author_num_reviews BIGINT,
        author_playtime_forever FLOAT,
        author_playtime_last_two_weeks FLOAT,
        author_playtime_at_review FLOAT,
        author_last_played FLOAT
    );
    \copy steam FROM 'steam_reviews.csv' WITH (FORMAT csv, HEADER true)
EOSQL