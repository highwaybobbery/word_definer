require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  # before() do
  #   Word.clear()
  # end

  describe('My word list', {:type => :feature}) do
    it ('processes the user entry and returns a list of words') do
      visit('/')
      fill_in('word', :with => 'continent')
      click_button('Add word!')
      expect(page).to have_content('continent')
    end
  end
end
