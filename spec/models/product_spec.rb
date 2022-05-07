require 'rails_helper'

RSpec.describe Product, type: :model do
  it {  should validate_presence_of :title  }
  it {  should validate_presence_of :description  }
  it 'have many attached files' do
    expect(Product.new.pictures).to be_an_instance_of(ActiveStorage::Attached::Many)
  end
end
