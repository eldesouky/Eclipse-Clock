module change (output1 , input1 , input2 , changed);

input [6:0] input1; 
input [6:0] input2;
input changed;
output [6:0] output1;
reg [6:0] output1;


always@(changed) 
begin
if (changed)begin 
output1 <= input1;
end else
begin
output1 <= input2;
end 
end

endmodule