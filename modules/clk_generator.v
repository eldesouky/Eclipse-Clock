module clk_generator(clk_1hz,clk);
input clk;
output clk_1hz;
reg clk_1hz;
reg[24:0]count;
always@ (posedge clk)
begin if(count==25_000_000)begin
count <= 0;
clk_1hz <= ~clk_1hz;
end else begin 
count <= count +1;
clk_1hz <= clk_1hz;
end 
end
endmodule