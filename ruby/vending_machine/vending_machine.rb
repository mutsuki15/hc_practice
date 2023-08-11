# frozen_string_literal: true

require_relative 'suica'
require_relative 'drink'

class VendingMachine
  attr_reader :sales

  def initialize
    @sales = 0
    @drinks_stock = {}
  end

  def set_suica(suica)
    @suica = suica
  end

  def default_drink_stock
    @drinks_stock ={ pepsi: 5, monster: 5, irohasu: 5 }
  end

  def add_drink(drink)
    @drinks_stock[drink.name.to_sym] += 1
  end

  def stock_list
    @drinks_stock.map { |key, value| "drink: #{key}, stock: #{value}本" }
  end

  def purchasable(drink)
    if @drinks_stock[drink.name.to_sym].positive?
      puts '購入できます'
    else
      puts '在庫がありません'
    end
  end

  def purchase(drink)
    if drink.name == 'ペプシ' && @suica.total >= drink.price && @drinks_stock[:pepsi] > 0
      @suica.payment(drink.price)
      @sales += drink.price
      @drinks_stock[:pepsi] -= 1
    elsif  drink.name == 'モンスター' && @suica.total >= drink.price && @drinks_stock[:monster] > 0
      @suica.payment(drink.price)
      @sales += drink.price
      @drinks_stock[:monster] -= 1
    elsif  drink.name == 'いろはす' && @suica.total >= drink.price && @drinks_stock[:irohasu] > 0
      @suica.payment(drink.price)
      @sales += drink.price
      @drinks_stock[:irohasu] -= 1
    elsif @drinks_stock[:pepsi] < 1 || @drinks_stock[:monster] < 1 || @drinks_stock[:irohasu] < 1
      puts '在庫がありません'
    else
      puts '残高が不足しています'
    end
  end
end

suica = Suica.new
# 任意の金額をチャージ
suica.charge(100)
# チャージ残高確認
suica.total

pepsi = Drink.new('ペプシ', 150)
monster = Drink.new('モンスター', 230)
irohasu = Drink.new('いろはす', 120)

vending_machine = VendingMachine.new
vending_machine.set_suica(suica)
vending_machine.default_drink_stock

# 在庫補充
vending_machine.add_drink(:pepsi)
vending_machine.add_drink(:monster)
vending_machine.add_drink(:irohasu)

# 在庫確認
vending_machine.stock_list

# 購入可否
vending_machine.purchasable(:pepsi)
vending_machine.purchasable(:monster)
vending_machine.purchasable(:irohasu)

# ドリンク購入
vending_machine.purchase(pepsi)
vending_machine.purchase(monster)
vending_machine.purchase(irohasu)

# 売上金額確認
vending_machine.sales
