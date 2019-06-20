#Credits: Michał Budnik
using matrixgen
using blocksys

#startup dummy
blockmat(16, 4, 10.0, "A.txt")
@time solveGauss("C:/CS/University/ON/L5/A.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "dummy.txt")

# blockmat(16, 4, 10.0, "A1.txt")
# @time solveGauss("C:/CS/University/ON/L5/A1.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "test16.txt")
# blockmat(10000, 4, 10.0, "A2.txt")
# @time solveGauss("C:/CS/University/ON/L5/A2.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "test10k.txt")
# blockmat(50000, 4, 10.0, "A3.txt")
# @time solveGauss("C:/CS/University/ON/L5/A3.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "test50k.txt")

# blockmat(16, 4, 1.0, "A4.txt")
# @time solveGauss("C:/CS/University/ON/L5/A4.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "ptest16.txt")
# blockmat(10000, 4, 10.0, "A5.txt")
# @time solveGauss("C:/CS/University/ON/L5/A5.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "ptest10k.txt")
# blockmat(50000, 4, 10.0, "A6.txt")
# @time solveGauss("C:/CS/University/ON/L5/A6.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "ptest50k.txt")

# blockmat(16, 4, 10.0, "A1.txt")
# @time solveGauss("C:/CS/University/ON/L5/A1.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "LUtest16.txt")
# blockmat(10000, 4, 10.0, "A2.txt")
# @time solveGauss("C:/CS/University/ON/L5/A2.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "LUtest10k.txt")
# blockmat(50000, 4, 10.0, "A3.txt")
# @time solveGauss("C:/CS/University/ON/L5/A3.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", false, true, "LUtest50k.txt")

# blockmat(16, 4, 1.0, "A4.txt")
# @time solveGauss("C:/CS/University/ON/L5/A4.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "LUptest16.txt")
# blockmat(10000, 4, 10.0, "A5.txt")
# @time solveGauss("C:/CS/University/ON/L5/A5.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "LUptest10k.txt")
# blockmat(50000, 4, 10.0, "A6.txt")
# @time solveGauss("C:/CS/University/ON/L5/A6.txt", true, "C:/CS/University/ON/L5/Dane16/b.txt", true, true, "LUptest50k.txt")

