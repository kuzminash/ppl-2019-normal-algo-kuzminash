function one_time(string, a1, a2)
    string=replace(string, a1=>a2,count=1)
    return string
end
function multiple_times(string, a1, a2)



string=readline()
algorithm1=[] #кладем элементы, которые будем заменять(переменная a1)
algorithm2=[] #кладем элементы на которые будем заменять(переменная a2)
algorithm3=[] #кладем 0 если подстановка однакратна и 1 если нет
if occursin("aa", string)
   string=one_time(string, "aa", "a")
   println(string)
end
