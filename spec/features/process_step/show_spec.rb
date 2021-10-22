require 'rails_helper'

RSpec.describe 'ProcessStep Show' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)
    @process_step_2 = ProcessStep.create!(name: 'Second', description: 'Description of Second step', position: 2)
    @process_step_3 = ProcessStep.create!(name: 'Third', description: 'Description of Third step', position: 3)
  end

  it 'shows the attribtues of a single Process step' do
    visit "/process_steps/#{@process_step_1.id}"

    expect(page).to have_content(@process_step_1.name)
    expect(page).to have_content(@process_step_1.description)
    expect(page).to have_content(@process_step_1.position)
  end
end
