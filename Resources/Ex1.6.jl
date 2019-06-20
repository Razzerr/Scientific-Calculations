#Coded by: Michał Budnik

function f(x)
    return sqrt(x^2+1)-1
end
function g(x)
    return x^2/(sqrt(x^2+1)+1)
end
for i = 1:10
    print("f(8^-$i) = $(f(8.0^-i)), || g(8^-$i) = $(g(8.0^-i))\n\n")
end