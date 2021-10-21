require 'rails_helper'

RSpec.describe Parameter do
  describe '#validations' do
    it { should validate_presence_of(:measurment) }
    it { should validate_inclusion_of(:measurment).in(-5.0..50.3) }
  end

  describe '#relationships' do
    it { should belong_to(:process_step)}
  end
end
