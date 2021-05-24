require 'rails_helper'

RSpec.describe 'astronaut index' do
  it 'lists all of the astronaut names' do
    armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    aldrin = Astronaut.create!(name: 'Buzz Aldrin', age: 42, job: 'Navigator')

    visit '/astronauts'

    expect(page).to have_content('Neil Armstrong')
    expect(page).to have_content('Buzz Aldrin')
  end

  it 'lists the age and job of each astronaut' do
    armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    aldrin = Astronaut.create!(name: 'Buzz Aldrin', age: 42, job: 'Navigator')

    visit '/astronauts'

    within "div#astro-#{armstrong.id}" do
      expect(page).to have_content('Age: 37')
      expect(page).to have_content('Job: Commander')
    end
  end
end

# As a visitor,
# When I visit '/astronauts'
# I see a list of astronauts with the following info:
# - Name
# - Age
# - Job
#
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander")
