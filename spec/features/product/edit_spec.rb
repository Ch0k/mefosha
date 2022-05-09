require 'rails_helper'

feature 'User can edit product', %q{
  User can edit product
} do
  given!(:product) { create(:product) }

    scenario 'User edit question' do
      visit product_path(product)
      click_on 'Edit this product'
      fill_in 'Title', with: 'new title'
      #fill_in 'Body', with: 'new body'
      click_on 'Update Product'
      expect(page).to have_content "Product was successfully updated."
    end
end

