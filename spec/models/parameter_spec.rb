require 'rails_helper'

RSpec.describe Parameter do
  describe '#validations' do
    it { should validate_presence_of(:process_step_id)}
    it { should validate_presence_of(:measurement) }
    it { should validate_inclusion_of(:measurement).in_range(-5.0..50.3) }
  end

  describe '#relationships' do
    it { should belong_to(:process_step) }
  end
end
