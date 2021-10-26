require 'test_helper'

class ProcessStepsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @process_step = ProcessStep.create(
      name: "Process Zero",
      description: "Best process ever made",
      position: 5
    )
  end

  def test_it_exists
    assert_instance_of ProcessStep, @process_step
  end

  def test_it_has_attributes
    assert_equal "Process Zero", @process_step.name
    assert_equal "Best process ever made", @process_step.description
    assert_equal 5, @process_step.position
  end
end
