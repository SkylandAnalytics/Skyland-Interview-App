require 'rails_helper'

RSpec.describe "parameter create", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'can delete a parameter measurement' do
      click_on 'Process Step 1'

      expect(current_path).to eq(process_step_path(@process_step1))
      click_on 2.8

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))
      expect(page).to have_content('Delete')

      click_on 'Delete'
      expect(current_path).to eq(process_steps_path)
      expect(page).to have_content(33.1)
      expect(page).not_to have_content(2.8)
    end
  end

  describe 'sad path' do
    it 'cannot delete last parameter measurement' do
      click_on 'Process Step 1'
      click_on 2.8
      click_on 'Delete'
      click_on 'Process Step 1'
      click_on 33.1
      click_on 'Delete'
      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter2))
      expect(page).to have_content('Process step must have at least one measurement')
    end
  end
end
