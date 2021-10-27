require 'test_helper'

class ProcessStepTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:parameters).class_name('Parameter')
  end
end
