require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  before() do
    Word.clear()
  end

  describe('My word list', {:type => :feature}) do
    it ('processes the user entry and returns a list of words and definitions') do
      visit('/')
      fill_in('word', :with => 'continent')
      fill_in('definition', :with => 'one of the seven main landmasses on the Earth')
      click_button('Add word!')
      expect(page).to have_content('continent')
    end
  end

  describe('a word', {:type => :feature}) do
    it ('navigates to an individual word page') do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      click_link("continent")
      expect(page).to have_content('continent')
    end
  end
end #Word class
