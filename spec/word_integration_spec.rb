require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Word") do
  before() do
    Word.clear()
  end

  describe('My word list', {:type => :feature}) do
    it ('processes the user entry and returns a list of words') do
      visit('/')
      fill_in('word', :with => 'continent')
      fill_in('definition_1', :with => 'one of the seven main landmasses on the Earth')
      fill_in('definition_2', :with => 'a large landmass on another planet')
      fill_in('definition_3', :with => 'the mainland of Europe')
      click_button('Add word!')
      expect(page).to have_content('continent')
    end
  end

  describe('a word link', {:type => :feature}) do
    it ('navigates to an individual word page') do
      visit('/')
      fill_in('word', :with => 'continent')
      fill_in('definition_1', :with => 'one of the seven main landmasses on the Earth')
      click_button('Add word!')
      click_link("continent")
      expect(page).to have_content('continent')
    end
  end

  describe('a word page', {:type => :feature}) do
    it ('displays multiple definitions if entered') do
      visit('/')
      fill_in('word', :with => 'continent')
      fill_in('definition_1', :with => 'one of the seven main landmasses on the Earth')
      fill_in('definition_2', :with => 'a large landmass on another planet')
      fill_in('definition_3', :with => 'the mainland of Europe')
      click_button('Add word!')
      click_link("continent")
      expect(page).to have_content('continent', 'landmass', "Europe")
    end
  end

end #Word class
