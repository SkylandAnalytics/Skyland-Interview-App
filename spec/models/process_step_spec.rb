require 'rails_helper'

RSpec.describe ProcessStep do
  describe '#relationships' do
    it { should have_many(:parameters) }
  end
end
