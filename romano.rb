#NOSSA LÓGICA. Hash contem apenas os caracteres dos números romanos
class Romano

def initialize()
  @basicos = {1000 => :M, 500 => :D, 100 => :C, 50 => :L, 10 => :X, 5 => :V, 1 => :I }
  @simbolos = [:I, :V, :X, :L, :C, :D, :M]
end

def sub_maior_valor(aux)
  for i in 0..aux.length
    if(aux[i+2] != nil)
      if(aux[i] == aux[i+2] && @simbolos.rindex(aux[i]) == @simbolos.rindex(aux[i+1])+1)
        aux.slice!(i)
        aux[i+1] = @simbolos[@simbolos.rindex(aux[i+1])+1]
      end
    end
   end
  return aux
end

def teste_sub_mv(aux)
  for i in 0..aux.length
    if(aux[i+2] != nil)
      if(aux[i] == aux[i+2] && @simbolos.rindex(aux[i]) == @simbolos.rindex(aux[i+1])+1)
        return true
        break
      else
        @subs = false
    end
  end
 end
end

def quatro_iguais(aux)
  for i in 0..aux.length
  if(aux[i+3] != nil)
	  if(aux[i] == aux[i+1] && aux[i] == aux[i+2] && aux[i] == aux[i+3])
	  	aux.slice!(i)
	  	aux.slice!(i+1)
	  	aux[i] = @simbolos[@simbolos.rindex(aux[i])+1]
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
        return false
      end
    end
  end
end


def converter_para_romano(num)
  resposta = []
  @iguais = true
  @subs = true

  @basicos.each do |x,y|
  	if (num/x > 0)
  	    valor = num / x
  	    valor.times do resposta.push(@basicos[x]) end
        num = num - (valor * x)
    end
  end

  aux = resposta.reverse

  while(@iguais == true) do
  aux = quatro_iguais(aux)
  @iguais = quatro_iguais?(aux)
  end

  aux = aux.reverse

  while(@subs == true) do
      aux = sub_maior_valor(aux)
      @subs = teste_sub_mv(aux)
    end

valor = ""
aux.each { |simbolo| valor << simbolo.to_s }
    return valor
  end
end
