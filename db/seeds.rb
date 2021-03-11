User.destroy_all
Movie.destroy_all
Favorite.destroy_all

User.reset_pk_sequence
Movie.reset_pk_sequence
Favorite.reset_pk_sequence

u1 = User.create(name: "Radiyah", username: "rsabur", password: "abc123")
u2 = User.create(name: "Susana", username: "svik", password: "abc123")
u3 = User.create(name: "Eric", username: "ekim", password: "abc123")
u4 = User.create(name: "Sean", username: "spadden", password: "abc123")

m1 = Movie.create(title: "Twilight", description: 
"When Bella Swan moves to a small town in the Pacific Northwest, 
she falls in love with Edward Cullen, a mysterious classmate who 
reveals himself to be a 108-year-old vampire. 

Director: Catherine Hardwicke
Writers: Melissa Rosenberg (screenplay), Stephenie Meyer (novel)
Stars: Kristen Stewart, Robert Pattinson, Billy Burke", genre: "Fantasy", rotten_tomatoes_review: 49, 
trailer: "https://www.youtube.com/watch?v=uxjNDE2fMjI")


m2 = Movie.create(title: "Clueless", description: 
"Shallow, rich and socially successful Cher is at the top of 
her Beverly Hills high school's pecking scale. Seeing herself 
as a matchmaker, Cher first coaxes two teachers into dating 
each other. 

Director: Amy Heckerling
Writer: Amy Heckerling
Stars: Alicia Silverstone, Stacey Dash, Brittany Murphy", genre: "Comedy", rotten_tomatoes_review: 82,
trailer: "https://www.youtube.com/watch?v=Mgjwq1ZzdPQ")


m3 = Movie.create(title: "Juno", description: 
"Faced with an unplanned pregnancy, an offbeat young woman makes 
an unusual decision regarding the unborn child. 

Director: Jason Reitman
Writer: Diablo Cody
Stars: Elliot Page, Michael Cera, Jennifer Garner", genre: "Romance", rotten_tomatoes_review: 94,
trailer: "https://www.youtube.com/watch?v=QuN0Z65sp5c")


m4 = Movie.create(title: "Roman Holiday", description: 
"A bored and sheltered princess escapes her guardians and falls 
in love with an American newsman in Rome.

Director: William Wyler
Writers: Ian McLellan Hunter (screenplay), John Dighton (screenplay)
Stars: Gregory Peck, Audrey Hepburn, Eddie Albert", genre: "Romance", rotten_tomatoes_review: 97,
trailer: "https://www.youtube.com/watch?v=twi3lQIDkiU")


m5 = Movie.create(title: "Casino", description: 
"A tale of greed, deception, money, power, and murder occur 
between two best friends: a mafia enforcer and a casino executive 
compete against each other over a gambling empire, and over a 
fast-living and fast-loving socialite.

Director: Martin Scorsese
Writers: Nicholas Pileggi (book), Nicholas Pileggi (screenplay)
Stars: Robert De Niro, Sharon Stone, Joe Pesci", genre: "Crime", rotten_tomatoes_review: 80,
trailer: "https://www.youtube.com/watch?v=EJXDMwGWhoA")


m6 = Movie.create(title: "Mean Girls", description: 
"Cady Heron is a hit with The Plastics, the A-list girl clique 
at her new school, until she makes the mistake of falling for 
Aaron Samuels, the ex-boyfriend of alpha Plastic Regina George.

Director: Mark Waters
Writers: Rosalind Wiseman (book), Tina Fey (screenplay)
Stars: Lindsay Lohan, Jonathan Bennett, Rachel McAdams", genre: "Comedy", rotten_tomatoes_review: 84,
trailer: "https://www.youtube.com/watch?v=oDU84nmSDZY")


m7 = Movie.create(title: "Lovelace", description: 
"The story of Linda Lovelace, who is used and abused by the porn 
industry at the behest of her coercive husband before taking 
control of her life.

Directors: Rob Epstein, Jeffrey Friedman
Writer: Andy Bellin
Stars: Amanda Seyfried, Peter Sarsgaard, Sharon Stone", genre: "Drama", rotten_tomatoes_review: 53,
trailer: "https://www.youtube.com/watch?v=HPJY-g-WoQo")


m8 = Movie.create(title: "Superbad", description: 
"Two co-dependent high school seniors are forced to deal with 
separation anxiety after their plan to stage a booze-soaked 
party goes awry.

Director: Greg Mottola
Writers: Seth Rogen, Evan Goldberg
Stars: Michael Cera, Jonah Hill, Christopher Mintz-Plasse", genre: "Comedy", rotten_tomatoes_review: 88,
trailer: "https://www.youtube.com/watch?v=4eaZ_48ZYog")


m9 = Movie.create(title: "Pulp Fiction", description: 
"The lives of two mob hitmen, a boxer, a gangster and his wife, 
and a pair of diner bandits intertwine in four tales of violence 
and redemption.

Director: Quentin Tarantino
Writers: Quentin Tarantino (stories), Roger Avary (stories)
Stars: John Travolta, Uma Thurman, Samuel L. Jackson", genre: "Crime", rotten_tomatoes_review: 92,
trailer: "https://www.youtube.com/watch?v=s7EdQ4FqbhY")


m10 = Movie.create(title: "The Mask", description: 
"Bank clerk Stanley Ipkiss is transformed into a manic superhero 
when he wears a mysterious mask.

Director: Chuck Russell (as Charles Russell)
Writers: Michael Fallon (story), Mark Verheiden (story)
Stars: Jim Carrey, Cameron Diaz, Peter Riegert", genre: "Comedy", rotten_tomatoes_review: 77,
trailer: "https://www.youtube.com/watch?v=LZl69yk5lEY")


m11 = Movie.create(title: "Heathers", description: 
"At Westerburg High where cliques rule, jerk jocks dominate and 
the most popular girls are all named Heather, it's going to take 
a Veronica and the mysterious and possibly psychotic new kid J.D. 
to give teen angst a body count.

Director: Michael Lehmann
Writer: Daniel Waters
Stars: Winona Ryder, Christian Slater, Shannen Doherty", genre: "Comedy", rotten_tomatoes_review: 93,
trailer: "https://www.youtube.com/watch?v=KJVKh9KKiug")


m12 = Movie.create(title: "Cats", description: 
"A tribe of cats called the Jellicles must decide yearly which one 
will ascend to the Heaviside Layer and come back to a new Jellicle 
life.

Director: Tom Hooper
Writers: Lee Hall (screenplay by), Tom Hooper (screenplay by)
Stars: James Corden, Judi Dench, Jason Derulo", genre: "Musical", rotten_tomatoes_review: 19,
trailer: "https://www.youtube.com/watch?v=yleb8iqI2cY")


m13 = Movie.create(title: "Kazaam", description: 
"A troubled kid inadvertently releases a genie, who must grant him 
any three wishes he requests.

Director: Paul Michael Glaser (as Paul M. Glaser)
Writers: Paul Michael Glaser (story) (as Paul M. Glaser), Christian Ford (screenplay)
Stars: Shaquille O'Neal, Francis Capra, Ally Walker", genre: "Fantasy", rotten_tomatoes_review: 24,
trailer: "https://www.youtube.com/watch?v=fFVaxa1UKNg")


m14 = Movie.create(title: "Scream", description: 
"A year after the murder of her mother, a teenage girl is terrorized 
by a new killer, who targets the girl and her friends by using horror 
films as part of a deadly game.

Director: Wes Craven
Writer: Kevin Williamson
Stars: Neve Campbell, Courteney Cox, David Arquette", genre: "Horror", rotten_tomatoes_review: 79,
trailer: "https://www.youtube.com/watch?v=AWm_mkbdpCA")


m15 = Movie.create(title: "Get Out", description: 
"A young African-American visits his white girlfriend's parents for 
the weekend, where his simmering uneasiness about their reception of 
him eventually reaches a boiling point.

Director: Jordan Peele
Writer: Jordan Peele
Stars: Daniel Kaluuya, Allison Williams, Bradley Whitford", genre: "Horror", rotten_tomatoes_review: 98,
trailer: "https://www.youtube.com/watch?v=DzfpyUB60YY")





f1 = Favorite.create(movie_id: m3.id, user_id: u3.id)
f2 = Favorite.create(movie_id: m1.id, user_id: u3.id)
f3 = Favorite.create(movie_id: m2.id, user_id: u1.id)
f4 = Favorite.create(movie_id: m3.id, user_id: u1.id)
f5 = Favorite.create(movie_id: m2.id, user_id: u2.id)
f6 = Favorite.create(movie_id: m1.id, user_id: u2.id)
f7 = Favorite.create(movie_id: m8.id, user_id: u3.id)
f8 = Favorite.create(movie_id: m11.id, user_id: u1.id)
f9 = Favorite.create(movie_id: m6.id, user_id: u2.id)

# User.first.movies.map do |movie|
#     movie.title
# end  