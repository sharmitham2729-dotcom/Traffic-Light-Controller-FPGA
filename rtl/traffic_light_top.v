`timescale 1ns / 1ps
module traffic_light_top #(parameter integer CLK_FREQ_HZ=100_000_000, GREEN_SEC=10, YELLOW_SEC=3, CLEAR_SEC=1)(input wire clk, reset, output reg ns_red, ns_yellow, ns_green, ew_red, ew_yellow, ew_green);
localparam [2:0] NS_GREEN=0, NS_YELLOW=1, ALL_RED_1=2, EW_GREEN=3, EW_YELLOW=4, ALL_RED_2=5;
reg [2:0] state;
reg [31:0] tick_count, phase_ticks;
always @(*) begin
 case(state)
 NS_GREEN: phase_ticks=CLK_FREQ_HZ*GREEN_SEC;
 NS_YELLOW: phase_ticks=CLK_FREQ_HZ*YELLOW_SEC;
 ALL_RED_1: phase_ticks=CLK_FREQ_HZ*CLEAR_SEC;
 EW_GREEN: phase_ticks=CLK_FREQ_HZ*GREEN_SEC;
 EW_YELLOW: phase_ticks=CLK_FREQ_HZ*YELLOW_SEC;
 ALL_RED_2: phase_ticks=CLK_FREQ_HZ*CLEAR_SEC;
 default: phase_ticks=CLK_FREQ_HZ*CLEAR_SEC;
 endcase
end
always @(posedge clk) begin
 if(reset) begin state<=NS_GREEN; tick_count<=0; end
 else if(tick_count>=phase_ticks-1) begin
  tick_count<=0;
  case(state)
   NS_GREEN: state<=NS_YELLOW;
   NS_YELLOW: state<=ALL_RED_1;
   ALL_RED_1: state<=EW_GREEN;
   EW_GREEN: state<=EW_YELLOW;
   EW_YELLOW: state<=ALL_RED_2;
   ALL_RED_2: state<=NS_GREEN;
   default: state<=NS_GREEN;
  endcase
 end else tick_count<=tick_count+1'b1;
end
always @(*) begin
 ns_red=1; ns_yellow=0; ns_green=0; ew_red=1; ew_yellow=0; ew_green=0;
 case(state)
  NS_GREEN: begin ns_red=0; ns_green=1; end
  NS_YELLOW: begin ns_red=0; ns_yellow=1; end
  EW_GREEN: begin ew_red=0; ew_green=1; end
  EW_YELLOW: begin ew_red=0; ew_yellow=1; end
  default: begin end
 endcase
end
endmodule
