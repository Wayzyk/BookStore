require 'spec_helper'

feature 'Describe book' do
    before do
        @book = Book.sort_by_param('created_at DESC').first
        
        visit catalog_path
    end
    
    
    scenario 'should be first book' do
        expect(page.title).to eq @book.title
        
        expect(page).to have_content @book.title
        expect(page).to have_content @book.description
        expect(page).to have_content @book.price
    end
    
    scenario 'should redirect to catalog' do
        expect(page.title).to eq 'Catalog'
    end
    
    scenario 'Should add book to cart' do
        expect(find('.shop-quantity')).to have_content '0'
    
        find('#add-to-cart').click
    
        expect(find('.shop-quantity')).to have_content '1'
  end
end