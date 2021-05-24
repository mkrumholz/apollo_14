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
end
