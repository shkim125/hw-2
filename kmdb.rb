# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output


# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

studio = Studio.new
studio["name"] = "Warner Bros."
studio.save
# puts "Studios: #{Studio.all.count}" - for me

Warner = Studio.find_by({"name" => "Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = "2005"
movie["rated"] = "PG-13"
movie["studio_id"] = Warner["id"]
movie.save
BB = Movie.find_by({"title" => "Batman Begins"})

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = "2008"
movie["rated"] = "PG-13"
movie["studio_id"] = Warner["id"]
movie.save
TDK = Movie.find_by({"title" => "The Dark Knight"})

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = "2012"
movie["rated"] = "PG-13"
movie["studio_id"] = Warner["id"]
movie.save
TDKR = Movie.find_by({"title" => "The Dark Knight Rises"})

# puts "Movies: #{Movie.all.count}"

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save
Christian = Actor.find_by({"name" => "Christian Bale"})

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save
Michael = Actor.find_by({"name" => "Michael Caine"})

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save
Liam = Actor.find_by({"name" => "Liam Neeson"})

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save
Katie = Actor.find_by({"name" => "Katie Holmes"})

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save
Gary = Actor.find_by({"name" => "Gary Oldman"})

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save
Heath = Actor.find_by({"name" => "Heath Ledger"})

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save
Aaron = Actor.find_by({"name" => "Aaron Eckhart"})

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save
Maggie = Actor.find_by({"name" => "Maggie Gyllenhaal"})

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save
Tom = Actor.find_by({"name" => "Tom Hardy"})

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save
Joseph = Actor.find_by({"name" => "Joseph Gordon-Levitt"})

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save
Anne = Actor.find_by({"name" => "Anne Hathaway"})

# puts "Actors: #{Actor.all.count}" - for me

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = Christian["id"]
role["character_name"] ="Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = Michael["id"]
role["character_name"] ="Alfred"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = Liam["id"]
role["character_name"] ="Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = Katie["id"]
role["character_name"] ="Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = BB["id"]
role["actor_id"] = Gary["id"]
role["character_name"] ="Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = Christian["id"]
role["character_name"] ="Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = Heath["id"]
role["character_name"] ="Joker"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = Aaron["id"]
role["character_name"] ="Harvey Dent"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = Michael["id"]
role["character_name"] ="Alfred"
role.save

role = Role.new
role["movie_id"] = TDK["id"]
role["actor_id"] = Maggie["id"]
role["character_name"] ="Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = Christian["id"]
role["character_name"] ="Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = Gary["id"]
role["character_name"] ="Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = Tom["id"]
role["character_name"] ="Bane"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = Joseph["id"]
role["character_name"] ="John Blake"
role.save

role = Role.new
role["movie_id"] = TDKR["id"]
role["actor_id"] = Anne["id"]
role["character_name"] ="Selina Kyle"
role.save
# puts "Roles: #{Role.all.count}"

puts "Movies"
puts "======="
puts ""


movie_all = Movie.all
  for movie in movie_all
      title = movie["title"]
      year_released = movie["year_released"]
      rated = movie["rated"]
      studio_id = movie["studio_id"]
      warner = Studio.find_by({"id" => studio_id})
      puts "#{title} #{year_released} #{rated} #{warner["name"]}"
  end 

puts "Top Cast"
puts "========"
puts ""

role_all = Role.all
 for role in role_all
     movie_id = role["movie_id"]
     movie = Movie.find_by({"id" => movie_id})
     actor_id = role["actor_id"]
     actor = Actor.find_by({"id" => actor_id})
     character_name = role["character_name"]
        puts "#{movie["title"]} #{actor["name"]} #{character_name}"
    end



