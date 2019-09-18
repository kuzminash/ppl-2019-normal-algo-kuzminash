function existance(string,exist,a1) ##функция возвращабщая переменную типа bool в зависимости от того нашлась ли подстрока
  if occursin(a1, string)
    exist=true
  elseif a1=="•"
    exist=true
  else
    exist=false
  end
  return exist
end
function substitution(string, a1, a2) ##реализация замены подстроки
    if a1!="•" && a2!="•"
        string=replace(string, a1=>a2,count=1)
    elseif  a1=="•"
         string=a2*string
    else
         string=replace(string, a1=>"",count=1)
    end
    return string
end



println("Введите строку:")
global string=readline()
println("Введите количество подстановок:")
substitutions=parse(UInt8, readline())
println("Введите алгоритм следуя слудующим правилам:")
println("Через пробел введите 3 значения. Первое-подстрока, которую хотите заменить, второе-подстрока на которую хотите заменить и третье-символ 0 если подстановка конечная и 1 если не конечная")
println("Каждую последующую подстановку следует вводить с новой строки через enter")
println("Пустую подстроку при вводе обозначать символом •  (вводится с клавиатуры как alt+8)")
global algorithm=fill( "aaa" , (substitutions,3) ) ##в массиве будут хранится все подстановки (чтобы не оставлять массив пустым заполним его символами 'aaa')
for i=1:substitutions ##
    alg=readline()
    algorithm[i,1], algorithm[i,2],algorithm[i,3]=split(alg," ")
end

exist=true

while exist
  for i=1:substitutions
    global operation_number=i
    global exist=existance(string,exist,algorithm[operation_number,1])
    if exist==true
        global string=substitution(string,algorithm[operation_number,1],algorithm[operation_number,2])
        if algorithm[operation_number,3]=="0"
            exist=false ##в случае конечной подстановки завершаем while
        end
        break
    end
  end
end
println("Получившаяся строка:")
println(string)
