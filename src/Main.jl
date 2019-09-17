function existance(string,exist,a1)
  if occursin(a1, string)
    exist=true
  else
    exist=false
  end
  return exist
end
function one_time(string, a1, a2)
    string=replace(string, a1=>a2,count=1)
    return string
end

function multiple_times(string, a1, a2)
    while occursin(a1, string)
        string=replace(string, a1=>a2, count=1)
    end
    return string
end




global string=readline()
substitutions=parse(UInt8, readline())
global algorithm=fill( "aaa" , (substitutions,3) ) ##чтобы не оставлять массив пустым заполним его символами 'aaa'
for i=1:substitutions
    alg=readline()
    algorithm[i,1], algorithm[i,2],algorithm[i,3]=split(alg," ")

end

exist=true

while exist
  for i=1:substitutions
    global operation_number=i
    global exist=existance(string,exist,algorithm[operation_number,1])
    if exist==true
      break
    end
  end
  if algorithm[operation_number,3]=="0"
      global string=one_time(string,algorithm[operation_number,1],algorithm[operation_number,2])
  else
      global string=multiple_times()(string,algorithm[operation_number,1],algorithm[operation_number,2])
   end
end
println(string)




##if occursin("aa", string)
    ##string=multiple_times(string, "aa", "a")
   ##println(string)
##end
