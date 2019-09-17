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
#function multiple_times(string, a1, a2)



global string=readline()
substitutions=parse(UInt8, readline())
global algorithm=fill( "aaa" , (substitutions,3) )
for i=1:substitutions
    alg=readline()
    algorithm[i,1], algorithm[i,2],algorithm[i,3]=split(alg," ")

end






##if occursin("aa", string)
    ##string=multiple_times(string, "aa", "a")
   ##println(string)
##end
