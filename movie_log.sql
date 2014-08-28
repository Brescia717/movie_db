DROP VIEW movie_log;

CREATE VIEW movie_log AS
SELECT movies.title, movies.year, movies.rating, movies.studio_id, cast_members.actor_id, cast_members.character, actors.name
FROM cast_members
JOIN movies ON movies.id = cast_members.movie_id
JOIN actors ON actors.id = cast_members.actor_id;
