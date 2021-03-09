radiyah = User.create(name: "Radiyah", username: "rsabur", password: "abc123")
susana = User.create(name: "Susana", username: "svik", password: "abc123")
eric = User.create(name: "Eric", username: "ekim", password: "abc123")

twilight1 = Movie.create(title: "Twilight", description: "blahblahblah", genre: "Fantasy", rotten_tomatoes_review: 49)
clueless = Movie.create(title: "Clueless", description: "as if", genre: "Comedy", rotten_tomatoes_review: 82)
juno = Movie.create(title: "Juno", description: "prego", genre: "Romance", rotten_tomatoes_review: 94)

f1 = Favorite.create(movie_id: juno.id, user_id: eric.id)
f2 = Favorite.create(movie_id: 3, user_id: 3)
f3 = Favorite.create(movie_id: 2, user_id: 1)
f4 = Favorite.create(movie_id: 3, user_id: 1)
f5 = Favorite.create(movie_id: 2, user_id: 2)
f6 = Favorite.create(movie_id: 1, user_id: 2)

# User.first.movies.map do |movie|
#     movie.title
# end  