class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age)
  end

  def list_missions
    missions.order(Arel.sql('lower(title)'))
  end

  def total_time_in_space
    missions.sum(:time_in_space)
  end
end
