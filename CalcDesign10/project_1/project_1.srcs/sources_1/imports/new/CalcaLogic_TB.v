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
			#1700
			newkey = 1'b1;
			#100
			newkey = 1'b0;
			#300
			keycode = 5'h01;
			#800
			newkey = 1'b1;
			#100
			newkey = 1'b0;
			#26150
			$stop;
		end
endmodule
