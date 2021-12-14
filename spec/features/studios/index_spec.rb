require 'rails_helper'

describe 'Studio Index' do
  before do
    @studio1 = Studio.create!(name: "Syntax Studios", location: "Burbank")
    @studio2 = Studio.create!(name: "Convention Studios", location: "Hollywood")
    @movie1 = @studio1.movies.create!(title: "Active Record", creation_year: 2022, genre: "Suspense/Thriller")
    @movie2 = @studio1.movies.create!(title: "Add Foreign Key", creation_year: 2022, genre: "Romantic/Comedy")
    visit '/studios'
  end

  describe 'display' do
    it 'each studio name and location' do
      within "#studio-#{@studio1.id}" do
        expect(page).to have_content(@studio1.name)
        expect(page).to have_content(@studio1.location)
      end
      within "#studio-#{@studio2.id}" do
        expect(page).to have_content(@studio2.name)
        expect(page).to have_content(@studio2.location)
      end
    end

    it 'movies of that studio' do
      within "#studio-#{@studio1.id}" do
        expect(page).to have_content(@movie1.title)
        expect(page).to have_content(@movie2.title)
      end
    end
  end
end
