require 'pry'
class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.map do |dish|
      dish if dish.category == category 
    end.compact
  end

  def menu
    menu_hash.each do |category, dishes|
      dishes.sort!
    end
  end

  def menu_hash
    hash = {}
    @dishes.each do |dish|
      if !hash[:"#{dish.category}s"].nil?
        hash[:"#{dish.category}s"] << dish.name
      else
        hash[:"#{dish.category}s"] = [dish.name]
      end
    end
    hash
  end

  def ratio(category)
    menu_hash.each do |h_category, dishes|
      return (dishes.length.to_f / @dishes.length) * 100 if h_category == "#{category}s".to_sym
    end
  end
end