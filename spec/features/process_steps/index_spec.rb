require 'rails_helper'

RSpec.describe "process step index page", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)
    @process_step2 = ProcessStep.create!(name: 'Process Step 2', description: 'Description 2', position: 5)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)
    @parameter3 = FactoryBot.create(:parameter, process_step_id: @process_step2.id, measurement: 11.1)
    @parameter4 = FactoryBot.create(:parameter, process_step_id: @process_step2.id, measurement: 5.3)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'shows list of process steps' do
      expect(page).to have_content('Process Step 1')
      expect(page).to have_content('Process Step 2')
    end

    it 'shows list of process steps' do
      expect(page).to have_content(2.8)
      expect(page).to have_content(33.1)
      expect(page).to have_content(11.1)
      expect(page).to have_content(5.3)
    end
  end
end
