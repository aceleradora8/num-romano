#COM COLA DA INTERNET. Hash contem números especificos com a combinação de dois números romanos

class Romano2

def converter_para_romano(num)
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

resposta = []

teste.each do |x,y|
	if (num / x > 0)
		valor = num / x
		valor.times do resposta.push(teste[x]) end
		num = num - (valor * x)
	end
end

valor = ""
resposta.each { |simbolo| valor << simbolo.to_s }
return valor

end
end
