# frozen_string_literal: true

require 'date'
require 'optparse'

def main
  today = Date.today
  year = today.year
  month = today.month

  opt = OptionParser.new
  opt.on('-m VAL') do |v|
    if v.to_i < 13
      month = v.to_i
      create_calendar(year, month)
    else
      puts "#{v} is neither a month number (1..12) nor a name"
    end
    exit
  end
  opt.parse(ARGV)

  opt = {}
  return unless opt.empty?

  create_calendar(year, month)
end

def create_calendar(year, month)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  head_month = first_day.strftime('%B')
  week = %w[Mo Tu We Th Fr Sa Su]
  puts "#{head_month} #{year}".center(20)
  puts week.join(' ')

  space = '   ' * (first_day.cwday - 1)
  print space

  (1..last_day.day).each do |day|
    printf('%2d ', day)
    print "\n" if ((first_day.cwday - 1 + day) % 7).zero?
  end
  puts "\n"
end

main
