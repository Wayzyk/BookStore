require 'spec_helper'

feature 'User filling addresses', :js => true do
    scenario 'with all valid fields' do
        filling_with 'John', 'Doe', 'First street', 'Kyiv', '123', 'Ukraine', '+38065685659' 
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank first name' do
        filling_with '', 'Doe', 'First street', 'Kyiv', '123', 'Ukraine', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank last name' do
        filling_with 'John', '', 'First street', 'Kyiv', '123', 'Ukraine', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank address' do
        filling_with 'John', 'Doe', '', 'Kyiv', '123', 'Ukraine', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank city' do
        filling_with 'John', 'Doe', 'First street', '', '123', 'Ukraine', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank zip' do
        filling_with 'John', 'Doe', 'First street', 'Kyiv', '', 'Ukraine', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank country' do
        filling_with 'John', 'Doe', 'First street', 'Kyiv', '123', '', '+38065685659'
        
        expect(page.title).to eq 'Settings'
    end
    
    scenario 'with blank phone' do
        filling_with 'John', 'Doe', 'First street', 'Kyiv', '123', 'Ukraine', ''
        expect(page.title).to eq 'Settings'
    end
    
    def filling_with(first_name, last_name, address, city, zip, country, phone)
        visit user_session_path
        fill_in 'user_email', with: email
        fill_in 'user_password', with: password
        click_on 'Sign in'
        
        visit settings_path
        
        fill_in 'address_first_name', with: :first_name
        fill_in 'address_last_name', with: :last_name
        fill_in 'address_address', with: :address
        fill_in 'address_city', with: :city
        fill_in 'address_zip', with: :zip
        fill_in 'address_country', with: :country
        fill_in 'address_phone', with: :first_phone
        click_button 'Save'
    end 
end