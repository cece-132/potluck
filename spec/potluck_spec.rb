require 'rspec'
require './lib/potluck'

describe Potluck do
  
  describe '#intialize' do
    it 'exists and has attributes' do
      potluck = Potluck.new("7-13-18")

      expect(potluck).to be_a Potluck
      expect(potluck.date).to eq "7-13-18"
      expect(potluck.dishes).to be_empty
      expect(potluck.dishes).to be_a Array
    end
  end

  describe '#add_dish' do
    it 'can add dishes to the potluck' do
      potluck = Potluck.new("7-13-18")

      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.dishes).to eq [couscous_salad, summer_pizza, roast_pork,
                                    cocktail_meatballs, candy_salad]
      expect(potluck.dishes.length).to eq 5
    end
  end

  describe '#get_all_from_category(category)' do
    it 'can list all dishes in category' do
      potluck = Potluck.new("7-13-18")

      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq [couscous_salad, summer_pizza]
      expect(potluck.get_all_from_category(:appetizer).first).to eq couscous_salad
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq "Couscous Salad"
    end
  end

  describe '#menu' do
    it 'can sort the dishes alphabetically' do
      potluck = Potluck.new("7-13-18")

      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expected = { :appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
                   :entres=>["Cocktail Meatballs", "Roast Pork"],
                   :desserts=>["Candy Salad"]
                  }
      expect(potluck.menu).to eq expected
      expect(potluck.menu.keys.count).to eq 3
    end
  end

end