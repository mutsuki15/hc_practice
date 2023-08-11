# frozen_string_literal: true

class Suica
  attr_reader :money

  def initialize
    @money = 500
  end

  def charge(charge_money)
    if charge_money >= 100
      @money += charge_money
    else
      puts '100円未満はチャージできません'
    end
  end

  def payment(price)
    if @money >= price
      @money -= price
    else
      puts '残高が不足しています'
    end
  end

  def total
    @money
  end
end
