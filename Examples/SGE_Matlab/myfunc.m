function [ output ] = myfunc(b,B)
output = sum(B+[b; ones(1,size(B,2))]);
end
