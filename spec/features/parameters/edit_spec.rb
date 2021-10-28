require 'rails_helper'

RSpec.describe "parameter edit page", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'can edit a process step parameter measurement' do
      expect(page).to have_content('Process Step 1')
      click_on 'Process Step 1'

      expect(current_path).to eq(process_step_path(@process_step1))
      click_on 2.8

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))
      expect(page).to have_field('parameter[measurement]')

      fill_in 'parameter[measurement]', with: 2.7
      click_on 'Save'

      expect(current_path).to eq(process_steps_path)
      expect(page).not_to have_content(2.8)
      expect(page).to have_content(2.7)
    end
  end

  describe 'sad path' do
    it 'cannot edit a process step parameter measurement if the measurement is outside of -5..50 bounds' do
      expect(page).to have_content('Process Step 1')
      click_on 'Process Step 1'

      expect(current_path).to eq(process_step_path(@process_step1))
      click_on 2.8

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))

      expect(page).to have_field('parameter[measurement]')
      fill_in 'parameter[measurement]', with: 999
      click_on 'Save'

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))
      expect(page).not_to have_content(999)
      expect(page).to have_content('Invalid new measurement')
    end

    it 'cannot edit a process step parameter measurement if the measurement is higher than any of the pre-existing measurements' do
      expect(page).to have_content('Process Step 1')
      click_on 'Process Step 1'

      expect(current_path).to eq(process_step_path(@process_step1))
      click_on 2.8

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))

      expect(page).to have_field('parameter[measurement]')
      fill_in 'parameter[measurement]', with: 34
      click_on 'Save'

      expect(current_path).to eq(edit_process_step_parameter_path(@process_step1, @parameter1))

      expect(page).not_to have_content(34)
      expect(page).to have_content('Invalid new measurement')
    end
  end
end
