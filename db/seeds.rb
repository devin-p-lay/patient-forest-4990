# universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
#
# universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
# universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

@studio = Studio.create!(name: "Syntax Studios", location: "Burbank")
@movie = @studio.movies.create!(title: "Active Record", creation_year: 2022, genre: "Suspense/Thriller")
@actor1 = Actor.create!(name: "Ruby Rails", age: 26)
@actor2 = Actor.create!(name: "Mercy Quill", age: 30)
@actor3 = Actor.create!(name: "Repo Pomodoro", age: 22)
@movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor1.id)
@movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor2.id)
@movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor3.id)