require 'rails_helper'

describe 'Movie Show' do
  before do
    @studio1 = Studio.create!(name: "Syntax Studios", location: "Burbank")
    @movie1 = @studio1.movies.create!(title: "Active Record", creation_year: 2022, genre: "Suspense/Thriller")
    @movie2 = @studio1.movies.create!(title: "Add Foreign Key", creation_year: 2022, genre: "Romantic/Comedy")
    @actor1 = Actor.create!(name: "Mercy Quill", age: 53)
    @actor2 = Actor.create!(name: "Ruby Rails", age: 27)
    @actor3 = Actor.create!(name: "Repo Pomodoro", age: 33)
    @actor4 = Actor.create!(name: "IC Pry", age: 35)
    @movie_actor = MovieActor.create!(movie_id: @movie1.id, actor_id:@actor1.id)
    @movie_actor = MovieActor.create!(movie_id: @movie1.id, actor_id:@actor2.id)
    @movie_actor = MovieActor.create!(movie_id: @movie1.id, actor_id:@actor3.id)
    @movie_actor = MovieActor.create!(movie_id: @movie2.id, actor_id:@actor4.id)
    visit "/movies/#{@movie1.id}"
  end

  describe 'display' do
    it 'title, creation year, and genre' do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
      expect(page).to_not have_content(@movie2.title)
    end

    describe 'actors' do
      it 'displays list of actors, from youngest' do
        within "#Actors" do
          expect(@actor2.name).to appear_before(@actor3.name)
          expect(@actor3.name).to appear_before(@actor1.name)
        end
      end

      it 'displays average age of actors' do
        within "#Actors" do
          expect(page).to have_content("Average Actor Age: #{@movie1.average_age}")
        end
      end

      it 'displays only actors of this movie' do
        within "#Actors" do
          expect(page).to_not have_content(@actor4.name)
        end
      end

      it 'displays a form to add an actor to this movie' do
        within "#Actors" do
          fill_in "Name", with: "Devin"
          fill_in "Age", with: "35"
          click_button "Submit"
          expect(current_path).to eq("/movies/#{@movie1.id}")
          expect(page).to have_content("Devin")
        end
      end
    end
  end
end
