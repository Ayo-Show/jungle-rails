require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save new product successfully' do
      @category = Category.new(name: 'clothing') 
      @product = Product.new(name: 't-shirt', description: 'a soft tee for your everyday needs', category: @category, quantity: 10, price_cents: 2500, image: 'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')

      @product.save!

      expect(@product.id).to be_present

    end

    it 'should expect error when name is set to nil and not valid' do
      @category = Category.new(name: 'clothing') 
      @product = Product.new(name: nil, description: 'a soft tee for your everyday needs', category: @category, quantity: 10, price_cents: 2500, image: 'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")

    end

    it 'should expect error when price is set to nil and not valid' do
      @category = Category.new(name: 'clothing') 
      @product = Product.new(name: 't-shirt', description: 'a soft tee for your everyday needs', category: @category, quantity: 10, price_cents: nil, image: 'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')

      @product.save

  
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      expect(@product.errors.full_messages[1]).to eq("Price is not a number")

    end

    it 'should expect error when quantity is set to nil and not valid' do
      @category = Category.new(name: 'clothing') 
      @product = Product.new(name: 't-shirt', description: 'a soft tee for your everyday needs', category: @category, quantity: nil, price_cents: 2500, image: 'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")

    end

    it 'should expect error when category is set to nil and not valid' do
      @category = Category.new(name: 'clothing') 
      @product = Product.new(name: 't-shirt', description: 'a soft tee for your everyday needs', category: nil, quantity: 10, price_cents: 2500, image: 'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')

      @product.save

      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")

    end

  end
  
end
