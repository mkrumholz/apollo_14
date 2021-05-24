require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'class methods' do
    describe '::average_age' do
      it 'returns the average age of all astronauts' do
        armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
        aldrin = Astronaut.create!(name: 'Buzz Aldrin', age: 43, job: 'Navigator')

        expect(Astronaut.average_age).to eq 40
      end
    end
  end

  describe 'instance methods' do
    describe 'list_missions' do
      it 'lists the astronauts missions in alphabetical order' do
        armstrong = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
        capricorn = armstrong.missions.create!(title: 'Capricorn 4', time_in_space: 72)
        apollo = armstrong.missions.create!(title: 'Apollo 13', time_in_space: 48)
        gemini = armstrong.missions.create!(title: 'Gemini 7', time_in_space: 31)

        expect(armstrong.list_missions).to eq [apollo, capricorn, gemini]
      end
    end
  end
end
