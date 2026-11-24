`timescale 1ns / 1ps
module tb_traffic_light_top;
reg clk=0, reset=1;
wire ns_red,ns_yellow,ns_green,ew_red,ew_yellow,ew_green;
traffic_light_top #(.CLK_FREQ_HZ(10),.GREEN_SEC(2),.YELLOW_SEC(1),.CLEAR_SEC(1)) dut(.clk(clk),.reset(reset),.ns_red(ns_red),.ns_yellow(ns_yellow),.ns_green(ns_green),.ew_red(ew_red),.ew_yellow(ew_yellow),.ew_green(ew_green));
always #5 clk=~clk;
task step_cycles; input integer n; integer i; begin for(i=0;i<n;i=i+1) @(posedge clk); #1; end endtask
task check_lamps; input a,b,c,d,e,f; begin
 if({ns_red,ns_yellow,ns_green,ew_red,ew_yellow,ew_green} !== {a,b,c,d,e,f}) begin $display("FAIL at %0t: NS=%b%b%b EW=%b%b%b",$time,ns_red,ns_yellow,ns_green,ew_red,ew_yellow,ew_green); $fatal(1,"Unexpected lamp output"); end
 if(ns_green && ew_green) $fatal(1,"Both directions green");
end endtask
initial begin
 $dumpfile("traffic_light.vcd"); $dumpvars(0,tb_traffic_light_top);
 step_cycles(1); reset=0;
 check_lamps(0,0,1,1,0,0); step_cycles(20);
 check_lamps(0,1,0,1,0,0); step_cycles(10);
 check_lamps(1,0,0,1,0,0); step_cycles(10);
 check_lamps(1,0,0,0,0,1); step_cycles(20);
 check_lamps(1,0,0,0,1,0); step_cycles(10);
 check_lamps(1,0,0,1,0,0); step_cycles(10);
 check_lamps(0,0,1,1,0,0);
 $display("PASS: all phases and safety checks passed."); $finish;
end
endmodule
