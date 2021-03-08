require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is gonna be saved" do
      @category = Category.new(name: "test")
      a_product = Product.new(name:"slippers", price:25, quantity:4,category:@category)
      expect(a_product.save).to eq(true)
    end

    it "is not valid if name doesn't exist" do
      @category = Category.new(name: "test")
      a_product = Product.new(name:nil, price:25, quantity:4,category:@category)
      a_product.save
      expect(a_product.errors.full_messages).to include("Name can't be blank")
    end
  
    it "is not valid if price doesn't exist" do
      @category = Category.new(name: "test")
      a_product = Product.new(name:"slippers", quantity:4,category:@category)
      a_product.save
      expect(a_product.errors.full_messages).to include("Price can't be blank")
    end
  
    it "is not valid if quantity doesn't exist" do
      @category = Category.new(name: "test")
      a_product = Product.new(name:"slippers", price:25,category:@category)
      a_product.save
      expect(a_product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid if category doesn't exist" do
      @category = Category.new(name: "test")
      a_product = Product.new(name:"slippers", price:25, quantity:4)
      a_product.save
      expect(a_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
