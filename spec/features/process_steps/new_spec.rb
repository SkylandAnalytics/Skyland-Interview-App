require 'rails_helper'

RSpec.describe "process step new page", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'can create a new process step' do

      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Name', with: 'New Name 123'
      fill_in 'Description', with: 'Lalalalala'
      fill_in 'Position', with: 11
      fill_in 'Measurement', with: 2.2

      click_on 'Save'

      expect(current_path).to eq(process_steps_path)

      expect(page).to have_content('New Name 123')
      expect(page).to have_content('Lalalalala')
      expect(page).to have_content(11)
      expect(page).to have_content(2.2)
    end
  end

  describe 'sad path' do
    it 'renders error when measurement is missing' do

      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Name', with: 'New Name 123'
      fill_in 'Description', with: 'Lalalalala'
      fill_in 'Position', with: 11

      click_on 'Save'

      expect(current_path).to eq(new_process_step_path)

      expect(page).not_to have_content('New Name 123')
      expect(page).to have_content('You must fill in measurements')
    end

    it 'renders error when measurement is invalid' do

      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Name', with: 'New Name 123'
      fill_in 'Description', with: 'Lalalalala'
      fill_in 'Position', with: 11
      fill_in 'Measurement', with: 999

      click_on 'Save'

      expect(current_path).to eq(new_process_step_path)

      expect(page).not_to have_content('New Name 123')
      expect(page).to have_content('Wrong or missing measurement parameter')
    end

    it 'renders error when process step name is not filled in but the measurement is present and valid' do
      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Measurement', with: 12

      click_on 'Save'

      expect(current_path).to eq(new_process_step_path)

      expect(page).not_to have_content('New Name 123')
      expect(page).to have_content('Please add at least a name')
    end

    it 'renders error when everything is filled out but measurement is invalid' do
      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Name', with: 'New Name 123'
      fill_in 'Description', with: 'Lalalalala'
      fill_in 'Position', with: 11
      fill_in 'Measurement', with: 999

      click_on 'Save'

      expect(current_path).to eq(new_process_step_path)

      expect(page).not_to have_content('New Name 123')
      expect(page).to have_content('Wrong or missing measurement parameter')
    end

    it 'renders error when not everything is filled out but measurement is invalid' do
      click_on 'Create Process Step'

      expect(current_path).to eq(new_process_step_path)

      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')
      expect(page).to have_field('Measurement')

      fill_in 'Name', with: 'New Name 123'
      fill_in 'Measurement', with: 999

      click_on 'Save'

      expect(current_path).to eq(new_process_step_path)

      expect(page).not_to have_content('New Name 123')
      expect(page).to have_content('Wrong or missing measurement parameter')
    end
  end
end
