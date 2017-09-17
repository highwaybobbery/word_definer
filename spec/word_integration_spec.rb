require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  before() do
    Word.clear()
  end

  describe('My word list', {:type => :feature}) do
    before do
      visit('/')
      add_word(
        word: 'continent',
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
        word: 'continent',
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
        word: 'continent',
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

  def add_word(word:, definitions: [])
    fill_in('word', with: word)
    fill_in('definition_1', with: definitions[0])
    fill_in('definition_2', with: definitions[1])
    fill_in('definition_3', with: definitions[2])
  end

end #Word class
