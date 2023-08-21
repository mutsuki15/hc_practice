# frozen_string_literal: true

class Pokemon
  attr_reader :type1, :type2, :hp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}のこうげき!"
  end

  def get_name
    @name
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      puts '不適切な名前です'
    else
      @name = new_name
    end
  end
end
pokemon = Pokemon.new('ポケモン', 'タイプ1', 'タイプ2', 'HP')
# pokemon.name
# pokemon.change_name("うんこ")
# pokemon.change_name("ゼニガメ")
# pokemon.get_name
