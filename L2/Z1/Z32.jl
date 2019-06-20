"""
Created by Mateusz Jachniak

"""

x32 = [2.718281828f0, -3.141592654f0, 1.414213562f0, 0.577215664f0, 0.301029995f0]
y32 = [1486.2497f0, 878366.9879f0, -22.37492f0, 4773714.647f0, 0.000185049f0]

function newWector32(x,y)
	result = Array{Float32}(5)
	result[1]=x[1]*y[1]
	result[2]=x[2]*y[2]
	result[3]=x[3]*y[3]
	result[4]=x[4]*y[4]
result[5]=x[5]*y[5]
	return result
end

function a32(x,y)
	Sum=0.0f0
	result=newWector32(x,y)
	for i = 1:length(result)
		Sum+=result[i]
	end
	println(Sum)

end

function b32(x,y)
	Sum=0.0f0
	result=newWector32(x,y)
	for i = 1:length(result)
		Sum+=result[length(result)-i+1]
	end
	println(Sum)

end

function c32(x,y)
	Sum=0.0f0
	SumMinus=0.0f0
	SumPlus=0.0f0
	tmp=0f0
	result=newWector32(x,y)
	sort!(result)
	for i = 1:length(result)
		if(result[length(result)-i+1]>=0)
			SumPlus+=result[length(result)-i+1]
		end
		if(result[length(result)-i+1]<0)
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


function d32(x,y)
	Sum=0.0f0
	SumMinus=0.0f0
	SumPlus=0.0f0
	tmp=0f0
	result=newWector32(x,y)
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




a32(x32, y32)
b32(x32, y32)
c32(x32, y32)
d32(x32, y32)
