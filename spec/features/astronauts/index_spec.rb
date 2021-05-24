require 'rails_helper'

RSpec.describe 'astronaut index' do
  before :each do
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @aldrin = Astronaut.create!(name: 'Buzz Aldrin', age: 43, job: 'Navigator')
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
end

# As a visitor,
# When I visit '/astronauts'
# I see the average age of all astronauts.
#
# (e.g. "Average Age: 34")
