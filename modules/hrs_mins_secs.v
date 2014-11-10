module hrs_mins_secs(output1,secst,secsu,hrs,mins,secs,clk);
input [13:0] hrs;
input [13:0] mins;
input [13:0] secs;
input clk;
output [6:0] output1;
output [6:0] secst;
output [6:0] secsu;
reg    [6:0] output1;
//reg [1:0] count ;
reg [32:0] count = 2'b01;
reg    [6:0] secst;
reg    [6:0] secsu;


//assign count = 2'b01;
//wire [13:0] mins,secs,hrs;
//wire [13:7]hours_tens_segments;
//wire [6:0]hours_units_segments;
//wire [13:7]mins_tens_segments;
///wire [6:0]mins_units_segments;
///assign hours_tens_segments = hrs [13:7];
///assign hours_units_segments = hrs [6:0];
///assign mins_tens_segments =  mins [13:7];
////assign mins_units_segments = mins [6:0];

//assign mins_segments = {mins_tens_segments,mins_units_segments};
always@(posedge clk)
begin
if (count == 1 )
begin
output1 <=  hrs[13:7] ;
secst <=    hrs[13:7];
count <= count +1 ; 
end 
else if (count == 2 )
begin
output1 <=  6'b0000000 ;
count <= count +1;
end 
else if (count == 5)
begin
output1 <=  hrs [6:0];
secsu <=    hrs [6:0];
count <= count +1;
end else if(count == 6)
begin
output1 <=  6'b0000000 ;
count <= count +1;
end 
else  
if (count ==28) begin
output1 <=  mins [13:7];
count <= count +1;
end 
else if (count == 29) 
begin 
output1 <=  6'b0000000 ;
count <= count +1;
end
else if (count == 34) 
begin 
output1 <=  mins [6:0];
//secsu <=    secs [6:0];
count <= count +1;
end 
else if(count == 35)
begin
output1 <=  6'b0000000 ;
count <= count +1;
end 
if (count == 57) begin
output1 <=  secs [13:7];
count <= count +1;
end 
else if (count == 58) 
begin 
output1 <=  6'b0000000 ;
count <= count +1;
end
else if (count == 62) 
begin 
output1 <=  secs [6:0];
//secsu <=    secs [6:0];
count <= count +1;
end 
else if(count == 63)
begin
output1 <=  6'b0000000 ;
count <= count +1;
end 

else if (count == 900)
begin
count <= 1;
end 
else 
begin  
count <= count +1;
end
end


endmodule