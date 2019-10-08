function existance(string,first_substring)##функция возвращабщая переменную типа bool в зависимости от того нашлась ли подстрока
      return occursin(first_substring, string)
end

function change_empty_sign(first_substring, second_substring)##заменяем в массиве знак пустой строки на пустую строку для дальнейшего упрощения
    if first_substring==" "
        first_substring=""
    end
    if second_substring==" "
        second_substring=""
    end
    return first_substring, second_substring
end

function substitution(word, first_substring, second_substring) ##реализация замены подстрок
    return replace(word, first_substring=>second_substring,count=1)
end

function if_found_substring(exist, word, first_substring, second_substring)
    if exist
        word=substitution(word,first_substring, second_substring)
    end
    return word
end

function read_from_the_file()
    println("Напишите пиуть к файлу")
    name_of_the_file=readline()
    f = open(name_of_the_file, "r")
    lines=readlines(f)
    close(f)
    return lines
end

function from_string_to_tuple(substitution)
    left_part_of_substitution,righ_part_of_substitution=split(substitution,"=>")
    if first(righ_part_of_substitution)=='.'
        not_ultimate_substitution=false
        righ_part_of_substitution=righ_part_of_substitution[2:end]
    else
        not_ultimate_substitution=true
    end
    left_part_of_substitution,righ_part_of_substitution=change_empty_sign(left_part_of_substitution, righ_part_of_substitution)
    return left_part_of_substitution,righ_part_of_substitution,not_ultimate_substitution
end

function split_substitutions(lines)
 tuple_of_substitutions=Array{Tuple{String,String,Bool},1}()#заводим массив для подстановок
 for number_of_the_substitution=1:length(lines)
    push!(tuple_of_substitutions,from_string_to_tuple(lines[number_of_the_substitution]))
 end
 return tuple_of_substitutions
end

function while_exist(word,lines,substitutions)
    for i=1:length(lines)
            operation_number=i
            exist=existance(word,substitutions[operation_number][1])
            if exist
                word=if_found_substring(exist,word,substitutions[operation_number][1],substitutions[operation_number][2])
                return word, substitutions[operation_number][3]
            end
    end
    return word, exist
end

function main()
    lines=read_from_the_file()#считываем весь файл
    word=lines[1]
    lines=lines[2:end] #удаляем слово из нашего считанного файла, чтобы стались только подстановки
    substitutions=split_substitutions(lines) #из файла делаем кортеж из подстановок
    exist=true ##переменная отвечает за существование подстроки в строке

    while exist  ##цикл будет существовать пока нашлась подстрока которую нужно заменить
        word, exist=while_exist(word, lines,substitutions)
    end
    println("Получившееся слово:")
    println(word)

end

main()

