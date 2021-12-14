require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'instance methods' do
    before do
      @studio = Studio.create!(name: "Syntax Studios", location: "Burbank")
      @movie = @studio.movies.create!(title: "Active Record", creation_year: 2022, genre: "Suspense/Thriller")
      @actor1 = Actor.create!(name: "Ruby Rails", age: 26)
      @actor2 = Actor.create!(name: "Mercy Quill", age: 30)
      @actor3 = Actor.create!(name: "Repo Pomodoro", age: 22)
      @movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor1.id)
      @movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor2.id)
      @movie_actor = MovieActor.create!(movie_id: @movie.id, actor_id:@actor3.id)
    end

    describe '#actor_age_average' do
      it 'returns the average age for actors in a movie' do
        expect(@movie.average_age).to eq(26)
      end
    end

    describe '#order_actors' do
      it 'orders actors of a movie from youngest' do
        expect(@movie.order_actors).to eq([@actor3, @actor1, @actor2])
      end
    end
  end
end
