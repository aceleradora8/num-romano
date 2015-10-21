iguais = true
subs = true

def sub_maior_valor(aux, simbolos)
  for i in 0..aux.length
    if(aux[i+2] != nil)  
      if(aux[i] == aux[i+2] && simbolos.rindex(aux[i]) > simbolos.rindex(aux[i+1]))
        aux.slice!(i)
        aux[i+1] = simbolos[simbolos.rindex(aux[i+1])+1]
      end
    end
   end
  return aux
end

def teste_sub_mv(aux, simbolos)
  for i in 0..aux.length
    if(aux[i+2] != nil)  
      if(aux[i] == aux[i+2] && simbolos.rindex(aux[i]) > simbolos.rindex(aux[i+1]))
        return true
        break
      else
        subs = false
    end
  end
 end
end

def quatro_iguais(aux, simbolos)
  for i in 0..aux.length
  if(aux[i+3] != nil)
	  if(aux[i] == aux[i+1] && aux[i] == aux[i+2] && aux[i] == aux[i+3])
	  	aux.slice!(i)
	  	aux.slice!(i+1)
	  	aux[i] = simbolos[simbolos.rindex(aux[i])+1]
	  	break
    end
  end
end
  return aux
end

def quatro_iguais?(aux)
for i in 0..aux.length
if(aux[i+3] != nil)
  if(aux[i] == aux[i+1] && aux[i] == aux[i+2] && aux[i] == aux[i+3])
    return true
    break
  else
    iguais = false
  end
end
end
end

basicos = {
M: 1000,
D: 500,
C: 100,
L: 50,
X: 10,
V: 5,
I: 1
}

simbolos = [:I, :V, :X, :L, :C, :D, :M]

teste = Hash.new
teste = basicos.invert


puts "Digite o numero: "
num = gets.chomp.to_i


dezenas = num / 10
unidade = num % 10

resposta = []


teste.each do |x,y|
	if (num / x > 0)
	valor = num / x			
	valor.times do resposta.push(teste[x]) end
	num = num - (valor * x)
end
end

aux = resposta.reverse

while(iguais == true) do
aux = quatro_iguais(aux, simbolos)
iguais = quatro_iguais?(aux)
end



aux = aux.reverse

while(subs == true) do
aux = sub_maior_valor(aux,simbolos)
subs = teste_sub_mv(aux, simbolos)
end

puts aux.to_s
