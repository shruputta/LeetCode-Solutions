WITH UserRatings AS (
    SELECT TOP 1
        u.name AS user_name,
        Dense_RANK() OVER (ORDER BY COUNT(mr.movie_id) DESC, u.name) AS user_rank
    FROM
        MovieRating mr
        LEFT JOIN users u  ON u.user_id = mr.user_id
    GROUP BY
        u.name
           ORDER BY  COUNT(mr.movie_id) DESC, u.name
),

MovieAvgRatings AS (
    SELECT TOP 1
        m.title AS movie_title,
       sum(MR.rating)*1.0/count(MR.rating) AS avg_rating,
        Dense_RANK() OVER (ORDER BY sum(MR.rating)*1.0/count(MR.rating) DESC, m.title) AS movie_rank
    FROM
      MovieRating mr  
        LEFT JOIN    Movies m 
        ON m.movie_id = mr.movie_id
    WHERE
        mr.created_at LIKE '2020-02%'
    GROUP By  m.title
        order by sum(MR.rating)*1.0/count(MR.rating) desc,M.title asc
)

SELECT 
    user_name AS results
FROM
    UserRatings

UNION ALL

SELECT
    movie_title AS results
FROM
    MovieAvgRatings
 
