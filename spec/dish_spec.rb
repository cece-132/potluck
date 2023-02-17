require 'rspec'
require './lib/dish'

describe Dish do
  
  describe '#intialize' do
    it 'exists and has attributes' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish).to be_a Dish
      expect(dish.name).to eq "Couscous Salad"
      expect(dish.category).to eq :appetizer
    end
  end
end