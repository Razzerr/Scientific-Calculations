#Written by: Michał Budnik
using module4list;

function testIlorazow()
    result = ilorazyRoznicowe([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0], [-1.0, -5.0, 2.0, 3.0, 0.3, 0.2, 0.6]);
    if (result == [-1.0, -4.0, 5.5, -2.8333333333333335, 0.8041666666666667, -0.1275, 0.004027777777777776]) println("Test ilorazów: Zaliczony");
    else println("Test ilorazów: Błąd!");
    end
end

function testNewtona()
    result = warNewton([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0], [-1.0, -5.0, 2.0, 3.0, 0.3, 0.2, 0.6], 3.0);
    if (result == -7) println("Test Newtona: Zaliczony");
    else println("Test Newtona: Błąd!");
    end
end

function testNaturalnej()
    result = naturalna([3.0, 1.0, 5.0, 6.0], [1.0, 2.0, -0.375, 0.175]);
    if (result == [-8.75, 7.525, -1.95, 0.175]) println("Test naturalnej: Zaliczony");
    else println("Test naturalnej: Błąd!");
    end
end

testIlorazow();
testNewtona();
testNaturalnej();