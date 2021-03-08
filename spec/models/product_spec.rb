require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    context "name exists" do
      it "is not valid if name doesn't exist" do
        a_product = Product.new(name:nil)
        expect(a_product).to_not be_valid
      end
    end

    context "price exists" do
      it "is not valid if price doesn't exist" do
        a_product = Product.new(price:nil)
        expect(a_product).to_not be_valid
      end
    end

    context "quantity exists" do
      it "is not valid if quantity doesn't exist" do
        a_product = Product.new(quantity:nil)
        expect(a_product).to_not be_valid
      end
    end

    context "category exists" do
      it "is not valid if quantity doesn't exist" do
        a_product = Product.new(category:nil)
        expect(a_product).to_not be_valid
      end
    end

  end
end
