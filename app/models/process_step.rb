class ProcessStep < ApplicationRecord
  validates :description, :name, :position, presence: true
  has_many :parameters, dependent: :destroy

  def no_params?
    parameters
    .last
    .nil?
  end

  def measurement_less_than_last?(measurement)
    measurement.to_f < self.parameters.last.measurement
  end

  def last_measurement
    parameters
    .last
    .measurement
  end
end
