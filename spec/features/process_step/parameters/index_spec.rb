require 'rails_helper'

RSpec.describe 'Process Step Parameters Index' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

    @param_1 = @process_step_1.parameters.create!(measurement: 4.7)
    @param_2 = @process_step_1.parameters.create!(measurement: 13)
  end

  it 'shows all of a process steps parameters' do
    visit "/process_steps/#{@process_step_1.id}/parameters"

    expect(page).to have_content(@param_1.measurement)
    expect(page).to have_content(@param_2.measurement)
  end
end
