require 'rails_helper'

RSpec.describe 'ProcessStep Index' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)
    @process_step_2 = ProcessStep.create!(name: 'Second', description: 'Description of Second step', position: 2)
    @process_step_3 = ProcessStep.create!(name: 'Third', description: 'Description of Third step', position: 3)

    @process_step_1.parameters.create!(measurement: 4.7)
    @process_step_2.parameters.create!(measurement: 13)
    @process_step_3.parameters.create!(measurement: 14)
  end

  it 'shows all ProcessSteps' do
    visit '/process_steps'

    expect(page).to have_content(@process_step_1.name)
    expect(page).to have_content(@process_step_2.name)
    expect(page).to have_content(@process_step_3.name)
  end
end
