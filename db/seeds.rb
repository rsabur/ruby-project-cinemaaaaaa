User.destroy_all
Movie.destroy_all
Favorite.destroy_all

User.reset_pk_sequence
Movie.reset_pk_sequence
Favorite.reset_pk_sequence

radiyah = User.create(name: "Radiyah", username: "rsabur", password: "abc123")
susana = User.create(name: "Susana", username: "svik", password: "abc123")
eric = User.create(name: "Eric", username: "ekim", password: "abc123")

twilight = Movie.create(title: "Twilight", description: "blahblahblah", genre: "Fantasy", rotten_tomatoes_review: 49)
clueless = Movie.create(title: "Clueless", description: "as if", genre: "Comedy", rotten_tomatoes_review: 82)
juno = Movie.create(title: "Juno", description: "prego", genre: "Romance", rotten_tomatoes_review: 94)

f1 = Favorite.create(movie_id: juno.id, user_id: eric.id)
f2 = Favorite.create(movie_id: twilight.id, user_id: eric.id)
f3 = Favorite.create(movie_id: clueless.id, user_id: radiyah.id)
f4 = Favorite.create(movie_id: juno.id, user_id: radiyah.id)
f5 = Favorite.create(movie_id: clueless.id, user_id: susana.id)
f6 = Favorite.create(movie_id: twilight.id, user_id: susana.id)

# User.first.movies.map do |movie|
#     movie.title
# end  