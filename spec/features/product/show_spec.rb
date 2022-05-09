require 'rails_helper'

feature 'User can see product', %q{
  user can look at the product   
} do

  given!(:product) { create(:product) }

  scenario 'User see product' do
    visit product_path(product)
    expect(page).to have_content product.title
    expect(page).to have_content product.description
  end
end

