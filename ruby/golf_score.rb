# frozen_string_literal: true

puts '1行目に18ホールの各ホールの規定打数を、2行目にプレイヤーの打数を入力してください'
inputs = readlines.map(&:chomp)

par = inputs[0].split(',').map(&:to_i)
shot_count = inputs[1].split(',').map(&:to_i)

score = par.map.with_index do |n, index|
  if (n == 3 && n - shot_count[index] == 2) || (n == 4 && n - shot_count[index] == 3)
    'ホールインワン'
  elsif shot_count[index] - n == -4
    'コンドル'
  elsif n == 5 && shot_count[index] - n == -3
    'アルバトロス'
  elsif shot_count[index] - n == -2
    'イーグル'
  elsif shot_count[index] - n == -1
    'バーディ'
  elsif (shot_count[index] - n).zero?
    'パー'
  elsif shot_count[index] - n == 1
    'ボギー'
  else
    "#{shot_count[index] - n}ボギー"
  end
end

p score.join(',')
