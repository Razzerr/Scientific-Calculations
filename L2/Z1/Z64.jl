"""
Created by Mateusz Jachniak

"""

x64 = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y64 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
x32 = [2.718281828f0, -3.141592654f0, 1.414213562f0, 0.577215664f0, 0.301029995f0]
y32 = [1486.2497f0, 878366.9879f0, -22.37492f0, 4773714.647f0, 0.000185049f0]

function newWector64(x,y)
	result = Array{Float64}(5)
	result[1]=x[1]*y[1]
	result[2]=x[2]*y[2]
	result[3]=x[3]*y[3]
	result[4]=x[4]*y[4]
result[5]=x[5]*y[5]
	return result
end
function newWector32(x,y)
	result = Array{Float32}(5)
	result[1]=x[1]*y[1]
	result[2]=x[2]*y[2]
	result[3]=x[3]*y[3]
	result[4]=x[4]*y[4]
result[5]=x[5]*y[5]

	return result
end

function a64(x,y)
	Sum=0.0;
	result=newWector64(x,y)
	for i = 1:length(result)
		Sum+=result[i]
	end
	println(Sum)

end

function b64(x,y)
	Sum=0.0;
	result=newWector64(x,y)
	for i = 1:length(result)
		Sum+=result[length(result)-i+1]
	end
	println(Sum)

end

function c64(x,y)
	Sum=0.0
	SumMinus=0.0
	SumPlus=0.0
	tmp=0
	result=newWector64(x,y)
	sort!(result)
	for i = 1:length(result)
		if(result[length(result)-i+1]>=0)
			SumPlus+=result[length(result)-i+1]		
		else
			tmp=length(result)-i+1
			break
		end
	end
	for j=1:tmp
		SumMinus+=result[j]
	end
	Sum=SumPlus+SumMinus
	println(Sum)
end


function d64(x,y)
	Sum=0.0
	SumMinus=0.0
	SumPlus=0.0
	tmp=0
	result=newWector64(x,y)
	sort!(result)
	for i = 1:length(result)
		if(result[i]>=0)
			tmp=i
			break		
		end
	end
	for i = 1:tmp-1
		SumMinus+=result[i]
	end
	for i = tmp:length(result)
		SumPlus+=result[i]
	end
	Sum=SumPlus+SumMinus
	println(Sum)


end



a64(x64, y64)
b64(x64, y64)
c64(x64, y64)
d64(x64, y64)
