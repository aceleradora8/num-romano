load "romano.rb"

romano = Romano.new()

puts "Digite o numero: "
num = gets.chomp.to_i
puts romano.converter_para_romano(num)
