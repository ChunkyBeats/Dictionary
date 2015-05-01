require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word creation path', {:type=>:feature}) do
  it('allows the user to enter a word into their dictionary') do
    visit('/')
    click_on('Add a New Word')
    fill_in('new_word', :with=>'fox')
    click_button('Add Word')
    expect(page).to have_content('fox')
  end
end

describe('definition creation path', {:type=>:feature}) do
  it('allows the user to enter a definition for a word') do
    visit('/')
    click_on('Add a New Word')
    fill_in('new_word', :with=>'dragon')
    click_button('Add Word')
    click_on('dragon')
    click_on('Add a definition')
    fill_in('new_def', :with=>'AWESOMESAUCEFIREPANTS')
    click_button('Add')
    click_on('Look at definitions')
    expect(page).to have_content('AWESOMESAUCEFIREPANTS')
  end
end
