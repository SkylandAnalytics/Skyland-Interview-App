class Parameter < ApplicationRecord
  validates :measurement, numericality: true, presence: true, inclusion: -4.9..50.2
  validates :process_step_id, presence: true
  belongs_to :process_step
end
