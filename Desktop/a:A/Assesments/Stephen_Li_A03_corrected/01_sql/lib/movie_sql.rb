require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Zoolander"; order by the
# actor's name.
def zoolander_cast
  MovieDatabase.execute(<<-SQL)
  SELECT name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE title = 'Zoolander'
  ORDER BY name


SQL
end

# 2. List the films in which 'Matt Damon' has appeared; order by
# movie title.
def matt_damon_films
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Matt Damon'
  ORDER BY title
SQL
end

# 3. List the films where 'Matt Damon' has appeared, but not in the
# star role. Order by movie title.
def matt_damon_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Matt Damon' AND ord != 1
  ORDER BY title
SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE ord = 1 AND yr = 1962
  ORDER BY title
SQL
end

# 5. There is a film from 2012 in our database for which there is no
# associated casting information. Give the id and title of this movie.
def unknown_actors_2012
  MovieDatabase.execute(<<-SQL)
  SELECT id, title
  FROM movies
  LEFT JOIN castings ON castings.movie_id = movies.id
  WHERE yr = 2012 AND actor_id IS NULL
SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
def big_movies
  MovieDatabase.execute(<<-SQL)
  SELECT title, COUNT(*) as roles
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  GROUP BY movie_id
  HAVING COUNT(*) > 60
  ORDER BY title
SQL
end
# WHERE COUNT(ord) > 60

# 7. List the movie title and the leading actor for all of the films
#    in which 'Ben Affleck' appeared but not as the lead actor.
def stars_working_with_ben_affleck
  MovieDatabase.execute(<<-SQL)
  SELECT title, a2.name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  JOIN castings AS c2 ON c2.movie_id = movies.id
  JOIN actors AS a2 ON a2.id = c2.actor_id
  WHERE actors.name = 'Ben Affleck' AND castings.ord != 1 AND c2.ord = 1
SQL
end

# 8. There is a movie in which 'Barrie Ingham' plays two roles. Write a
# query that returns the title of this movie.
def barrie_ingham_multiple_roles
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Barrie Ingham'
  GROUP BY title
  HAVING COUNT(*) > 1

SQL
end
