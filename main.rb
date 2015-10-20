basicos = {
M: 1000,
D: 500,
C: 100,
L: 50,
X: 10,
V: 5,
I: 1
}

simbolos = {:I, :V, :X, :L, :C, :D, :M}

teste = Hash.new
teste = basicos.invert


puts "Digite o numero: "
num = gets.chomp.to_i


dezenas = num / 10
unidade = num % 10

resposta = []

# dezenas.times do resposta.push(teste[10]) end
# resposta.push(teste[unidade])

teste.each do |x,y|
	if (num / x > 0)
	valor = num / x			
	valor.times do resposta.push(teste[x]) end
	num = num - (valor * x)
end
end

aux = resposta.reverse

for i in 0..aux.length
	if(aux[i] == aux[i+1] && aux[i] == aux[i+2] && aux[i] == aux[i+3])
		aux.slice!(i)
		aux.slice!(i+1)
end
end

puts aux.to_s
