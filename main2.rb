#COM COLA DA INTERNET :/

basicos = {
M: 1000,
CM: 900,
D: 500,
CD: 400,
C: 100,
XC: 90,
L: 50,
XL: 40,
X: 10,
IX: 9,
V: 5,
IV: 4,
I: 1
}

teste = basicos.invert

puts "Digite o numero: "
num = gets.chomp.to_i

resposta = []

teste.each do |x,y|
	if (num / x > 0)
	valor = num / x			
	valor.times do resposta.push(teste[x]) end
	num = num - (valor * x)
end
end

valor = "Valor em Romano é: "
resposta.each { |simbolo| valor << simbolo.to_s }
puts valor
