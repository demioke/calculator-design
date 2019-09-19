`timescale 1ns / 1ps
module TB_myCalc;
	// Inputs to module being verified
	reg clk, rst, newkey;
	reg [4:0] keycode;
	// Outputs from module being verified
	wire LED_NEG_digit, LED_OVW;
	wire [15:0] Xdisplay;
	// Instantiate module
	myCalc uut (
		.clk(clk),
		.rst(rst),
		.keycode(keycode),
		.newkey(newkey),
		.Xdisplay(Xdisplay),
		.LED_NEG_digit(LED_NEG_digit),
		.LED_OVW(LED_OVW)
		);
	// Generate clock signal
	initial
		begin
			clk  = 1'b1;
			forever
				#100 clk  = ~clk ;
		end
	// Generate other input signals
	initial
		begin
			rst = 1'b0;
			keycode = 5'h0;
			newkey = 1'b0;
			#250
			rst = 1'b1;
			#600
			rst = 1'b0;
			#800
			keycode = 5'h15;
			newkey = 1'b1;
			#200
			newkey = 1'b0;
			#200
			keycode = 5'h18;
			#300
			newkey = 1'b1;
			#200
			newkey = 1'b0;
			#1100
			keycode = 5'h0a;
			newkey = 1'b1;
			#300
			newkey = 1'b0;
			#300
			keycode = 5'h14;
			#400
			newkey = 1'b1;
			#200
			newkey = 1'b0;
			#500
			keycode = 5'h03;
			#300
			newkey = 1'b1;
			#200
			newkey = 1'b0;
			#1000
			keycode = 5'h04;
			newkey = 1'b1;
			#300
			newkey = 1'b0;
			#2850
			$stop;
		end
endmodule
