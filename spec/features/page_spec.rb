require 'spec_helper'

feature 'Home page' do
    scenario 'guest can see best sellers books, latest books, get started' do
        visit root_path
        expect(page).to have_selector('div#slider')
        expect(page).to have_link("Get started")
    end
end