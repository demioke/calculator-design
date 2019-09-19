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
			#30
			rst = 1'b1;
			#100
			@(negedge clk) rst = 1'b0;
			#200
			//input 1234
			keycode = 5'h11;
			@(negedge clk) newkey = 1'b1;
			@(posedge clk) newkey = 1'b0;
			keycode = 5'h12;
			@(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h13;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h14;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150			
			
		    //clear entry
		    keycode = 5'h0c;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
			
			//input 2 digit number
			keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h12;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
			
			//Change sign twice
			keycode = 5'h02;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h02;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
			
			//press +
			keycode = 5'h0b;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //input 1 digit
            keycode = 5'h15;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //press equals
            keycode = 5'h03;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //press +
            keycode = 5'h0b;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //4 digit number
            keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //press equals
            keycode = 5'h03;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //ch sign
            keycode = 5'h02;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //clear all
            keycode = 5'h04;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
                  
            //input 3 digit 
            keycode = 5'h15;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h1d;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150                              
            keycode = 5'h1e;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150                  
                  
            //minus
            keycode = 5'h0a;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150                  
                  
            //input 2 digit
            keycode = 5'h1f;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h1e;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150      
            
            //equals
            keycode = 5'h03;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150      
                  
            //clear all
            keycode = 5'h04;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150      
                  
            //input 3 digit
            keycode = 5'h15;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h11;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h12;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //multiply      
            keycode = 5'h09;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150      
                  
            //input 23
            keycode = 5'h12;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            keycode = 5'h13;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150      
            
            //equals
            keycode = 5'h03;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
            //clear all
            keycode = 5'h04;
            @(negedge clk) newkey = 1'b1;
            @(posedge clk) newkey = 1'b0;
            #150
            
			$stop;
			
            
		end
endmodule
