require 'integration_spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  describe('My word list', {:type => :feature}) do
    before do
      visit('/')
      add_word(
        term: 'continent',
        definitions: [
          'one of the seven main landmasses on the Earth',
          'a large landmass on another planet',
          'the mainland of Europe',
        ],
      )
      click_button('Add word!')
    end

    it ('processes the user entry and returns a list of words') do
      expect(page).to have_content('continent')
    end
  end

  describe('a word link', {:type => :feature}) do
    before do
      visit('/')
      add_word(
        term: 'continent',
      )
      click_button('Add word!')
      click_link("continent")
    end

    it ('navigates to an individual word page') do
      expect(page).to have_content('continent')
    end
  end

  describe('a word page', {:type => :feature}) do
    before do
      visit('/')
      add_word(
        term: 'continent',
        definitions: [
          'one of the seven main landmasses on the Earth',
          'a large landmass on another planet',
          'the mainland of Europe',
        ],
      )
      click_button('Add word!')
      click_link("continent")
    end

    it ('displays multiple definitions if entered') do
      expect(page).to have_content('continent')
      expect(page).to have_content('Europe')
      expect(page).to have_content('landmass')
    end
  end

  def add_word(term:, definitions: [])
    fill_in('term', with: term)
    fill_in('definition_1', with: definitions[0])
    fill_in('definition_2', with: definitions[1])
    fill_in('definition_3', with: definitions[2])
  end

end #Word class
