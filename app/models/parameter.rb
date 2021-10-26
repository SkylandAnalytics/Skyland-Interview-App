class Parameter < ApplicationRecord
  belongs_to :process_step

  validates :measurement, presence: true
  validates :measurement, numericality: { :greater_than => -5.0 }
  validates :measurement, numericality: { :less_than => 50.3 }
  # validate :maximum_parameter
  # validates :measurement, numericality: { :less_than => maximum_parameters_validator }
  #
  # private
  #
  # def maximum_parameter
  #   Parameter.find_by_sql
  #     "SELECT MAX(measurement)
  #      FROM parameters;"
  # end
end
