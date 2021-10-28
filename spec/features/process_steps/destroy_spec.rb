require 'rails_helper'

RSpec.describe "process step delete", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'can delete a process step' do
      expect(page).to have_content('Process Step 1')

      click_on 'Delete'
      
      expect(page).not_to have_content('Process Step 1')
    end
  end
end
