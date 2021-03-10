User.destroy_all
Movie.destroy_all
Favorite.destroy_all

User.reset_pk_sequence
Movie.reset_pk_sequence
Favorite.reset_pk_sequence

u1 = User.create(name: "Radiyah", username: "rsabur", password: "abc123")
# u2 = User.create(name: "Susana", username: "svik", password: "abc123")
u3 = User.create(name: "Eric", username: "ekim", password: "abc123")

m1 = Movie.create(title: "Twilight", description: "diamond skin", genre: "Fantasy", rotten_tomatoes_review: 49)
m2 = Movie.create(title: "Clueless", description: "as if", genre: "Comedy", rotten_tomatoes_review: 82)
m3 = Movie.create(title: "Juno", description: "prego", genre: "Romance", rotten_tomatoes_review: 94)
m4 = Movie.create(title: "Roman Holiday", description: "Stow away princess", genre: "Romance", rotten_tomatoes_review: 97)
m5 = Movie.create(title: "Casino", description: "Casinos and mobs", genre: "Crime", rotten_tomatoes_review: 80)
m6 = Movie.create(title: "Mean Girls", description: "HS dramatics", genre: "Comedy", rotten_tomatoes_review: 84)
m7 = Movie.create(title: "Lovelace", description: "Linda Lovelace", genre: "Drama", rotten_tomatoes_review: 53)
m8 = Movie.create(title: "Superbad", description: "Coming of age", genre: "Comedy", rotten_tomatoes_review: 88)
m9 = Movie.create(title: "Pulp Fiction", description: "Hip crime", genre: "Crime", rotten_tomatoes_review: 92)
m10 = Movie.create(title: "Mask", description: "Magic masks", genre: "Comedy", rotten_tomatoes_review: 77)
m11 = Movie.create(title: "Heathers", description: "Teen Murder", genre: "Comedy", rotten_tomatoes_review: 93)
m12 = Movie.create(title: "Cats", description: "Talking cats", genre: "Musical", rotten_tomatoes_review: 19)
m13 = Movie.create(title: "Kazaam", description: "Shaq is a genie", genre: "Fantasy", rotten_tomatoes_review: 24)
m14 = Movie.create(title: "Scream", description: "Masked knife maniac", genre: "Horror", rotten_tomatoes_review: 79)
m15 = Movie.create(title: "Get Out", description: "Weird things happen", genre: "Horror", rotten_tomatoes_review: 98)



f1 = Favorite.create(movie_id: m3.id, user_id: u3.id)
f2 = Favorite.create(movie_id: m1.id, user_id: u3.id)
f3 = Favorite.create(movie_id: m2.id, user_id: u1.id)
f4 = Favorite.create(movie_id: m3.id, user_id: u1.id)
# f5 = Favorite.create(movie_id: m2.id, user_id: u2.id)
# f6 = Favorite.create(movie_id: m1.id, user_id: u2.id)
f7 = Favorite.create(movie_id: m8.id, user_id: u3.id)
f8 = Favorite.create(movie_id: m11.id, user_id: u1.id)
# f9 = Favorite.create(movie_id: m6.id, user_id: u2.id)

# User.first.movies.map do |movie|
#     movie.title
# end  