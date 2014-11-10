module sixty_counter (count,count_complete,clk,reset);
input clk,reset;
output count_complete;
output [7:0] count;
reg[3:0] tens_counter , units_counter;
assign count = {tens_counter,units_counter};
reg count_complete;
//assign count_complete = 1'b1;
always @(posedge clk) begin
if(reset) begin 
tens_counter <=0;
units_counter <=0;
count_complete <=0;

end else if(units_counter == 9) begin 
if(tens_counter==5) begin
count_complete <=1;
units_counter <= 0;
tens_counter <=0;
end else begin 
count_complete <=0;
units_counter <=0;
tens_counter = tens_counter + 1;
end end else begin
units_counter <=units_counter +1;
count_complete <=0;
end 
end 
endmodule
