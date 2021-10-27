require 'test_helper'

class ParametersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @process_step = FactoryBot.create(:process_step)
    @parameter = Parameter.create(measurement: 1.2, process_step_id: @process_step.id)
  end

  def test_it_exists
    assert_instance_of Parameter, @parameter
  end

  def test_it_has_attributes
    assert_equal 1.2, @parameter.measurement
  end
end
