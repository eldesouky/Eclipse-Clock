module direc (output1,secs_segments,changed,reset,clk);
output [13:0] secs_segments;
output [6:0] output1;
wire [6:0] output2;
wire [6:0] output3;
wire [13:0] secs_segments1;
wire [13:0] mins_segments;
wire [13:0] hours_segments;
//output [13:0] mins_segments;
input reset;
input clk;
input changed;
wire clk_1hz,min_complete,hour_complete,day_complete,reset;
wire [7:0] mins,secs,hrs;
wire [6:0] secst , secsu;
assign secs_segments1 = {secs_tens_segments,secs_units_segments};
assign mins_segments = {mins_tens_segments,mins_units_segments};
assign hours_segments = {hours_tens_segments,hours_units_segments};
assign secs_segments = {~secst,~secsu};
clk_generator clk2 (clk_1hz,clk);
clk_generator1 clk3 (clk_min,clk);


sixty_counter seconds (secs,min_complete,clk_1hz,~reset);
sixty_counter minutes (mins,hour_complete,min_complete,~reset);
twentyfour_counter hours (hrs, day_complete,hour_complete,~reset);

wire [6:0] secs_units_segments,secs_tens_segments;
wire [6:0] mins_units_segments,mins_tens_segments;
wire [6:0] hours_units_segments,hours_tens_segments;

seven_segment_decoder secs_units (secs[3:0],secs_units_segments);
seven_segment_decoder secs_tens (secs[7:4],secs_tens_segments);
//assign mins_segments = secs_segments;
seven_segment_decoder mins_units (mins[3:0],mins_units_segments);
seven_segment_decoder mins_tens (mins[7:4],mins_tens_segments);

seven_segment_decoder hrs_units (hrs[3:0],hours_units_segments);
seven_segment_decoder hrs_tens (hrs[7:4],hours_tens_segments);
//assign output1 =~secs_units_segments ;
hrs_mins_secs hrs_mins_secs1(output2,secst,secsu,~hours_segments,~mins_segments,~secs_segments1,clk_min);
eclipse eclipse1(output3,clk_min);
change change1 (output1 , output3 , output2 , changed);


endmodule
