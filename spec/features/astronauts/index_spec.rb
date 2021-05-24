require 'rails_helper'

RSpec.describe 'astronaut index' do
  before :each do
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @aldrin = Astronaut.create!(name: 'Buzz Aldrin', age: 43, job: 'Navigator')
    @capricorn = @armstrong.missions.create!(title: 'Capricorn 4', time_in_space: 72)
    @apollo = @armstrong.missions.create!(title: 'Apollo 13', time_in_space: 48)
    @gemini = @armstrong.missions.create!(title: 'Gemini 7', time_in_space: 31)
  end

  it 'lists all of the astronaut names' do
    visit '/astronauts'

    expect(page).to have_content('Neil Armstrong')
    expect(page).to have_content('Buzz Aldrin')
  end

  it 'lists the age and job of each astronaut' do
    visit '/astronauts'

    within "div#astro-#{@armstrong.id}" do
      expect(page).to have_content('Age: 37')
      expect(page).to have_content('Job: Commander')
    end
  end

  it 'lists the average age of all astronauts' do
    visit '/astronauts'

    expect(page).to have_content('Average Astronaut Age: 40')
  end

  it 'lists the space missions for each astronaut in alphabetical order' do
    visit '/astronauts'

    within "div#astro-#{@armstrong.id}" do
      expect('Apollo 13').to appear_before('Capricorn 4')
      expect('Capricorn 4').to appear_before('Gemini 7')
    end
  end

  it 'lists the total time in space for each astronaut' do
    visit '/astronauts'

    within "div#astro-#{@armstrong.id}" do
      expect(page).to have_content('Total time in space: 151 days')
    end
  end
end
