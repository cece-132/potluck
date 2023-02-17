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
    types = {}
    @dishes.each do |dish|
      if !types[:"#{dish.category}s"]
        types[:"#{dish.category}s"] = (get_all_from_category(dish.category).map { |dish| dish.name}).sort
      end
    end
    types
  end

  def ratio(category)
    (get_all_from_category(category).length.to_f / dishes.length) * 100
  end
end