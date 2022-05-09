require 'rails_helper'

feature 'User can create product', %q{
  User can create product   
} do

    scenario 'successfuly create product' do
      visit products_path
      click_on 'New product'
      fill_in 'Title', with: 'Test product'
      #find(".trix-content").click.set("Text text text")
      save_and_open_page
      fill_in 'Price', with: '30'
      click_on 'Create Product'
      expect(page).to have_content 'Test product'
      expect(page).to have_content 'Text text text'
    end

    scenario 'unsuccessfuly create product with errors' do
      visit products_path
      click_on 'New product'
      click_on 'Create Product'
      expect(page).to have_content "Title can't be blank"
    end

end
