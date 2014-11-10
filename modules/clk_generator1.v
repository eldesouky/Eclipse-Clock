module clk_generator1(clk_1hz,clk);
input clk;
output clk_1hz;
reg clk_1hz;
reg[34:0]count;
always@ (posedge clk)
begin if(count==3465)begin
count <= 0;
clk_1hz <= ~clk_1hz;
end else begin 
count <= count +1;
clk_1hz <= clk_1hz;
end 
end
endmodule