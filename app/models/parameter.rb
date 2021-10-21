class Parameter < ApplicationRecord
  validates :measurement, numericality: true, presence: true, inclusion: -5.0..50.3
  validates :process_step_id, presence: true
  belongs_to :process_step
end
