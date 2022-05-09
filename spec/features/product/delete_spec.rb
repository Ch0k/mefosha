require 'rails_helper'

feature 'User can delete product', %q{
  User can delete a product
} do
  given!(:product) { create(:product) }

  scenario 'User can delete product' do
    visit product_path(product)
    expect(page).to have_content product.title
    click_on 'Destroy this product'
    expect(page).to have_content "Product was successfully destroyed."
    expect(page).to_not have_content product.title
  end
end

