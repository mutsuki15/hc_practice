# frozen_string_literal: true

require_relative 'pokemon'
class Pikachu < Pokemon
  attr_reader :type1, :type2, :hp

  def attack
    super
    puts "#{@name}の10万ボルト!"
  end
end
pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
# pika.name
# pika.attack
# pika.change_name("うんこ")
# pika.change_name("ゼニガメ")
# pika.get_name
