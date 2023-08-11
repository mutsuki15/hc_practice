# frozen_string_literal: true

class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
