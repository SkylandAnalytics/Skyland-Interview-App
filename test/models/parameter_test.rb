require 'test_helper'

class ParameterTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:process_step).class_name('ProcessStep')
    should validate_presence_of(:measurement)
  end
end
