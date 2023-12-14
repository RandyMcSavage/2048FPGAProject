module blocks(clk,rst, update, xCount, yCount, block);
input clk, rst, update;
input [9:0]xCount;
input [9:0]yCount;
wire [9:0] xCount;
wire [9:0] yCount;


output [15:0]block;
assign block[0] = block0;
assign block[1] = block1;
assign block[2] = block2;
assign block[3] = block3;
assign block[4] = block4;
assign block[5] = block5;
assign block[6] = block6;
assign block[7] = block7;
assign block[8] = block8;
assign block[9] = block9;
assign block[10] = block10;
assign block[11] = block11;
assign block[12] = block12;
assign block[13] = block13;
assign block[14] = block14;
assign block[15] = block15;

reg block0;
reg block1;
reg block2;
reg block3;
reg block4;
reg block5;
reg block6;
reg block7;
reg block8;
reg block9;
reg block10;
reg block11;
reg block12;
reg block13;
reg block14;
reg block15;

reg [9:0] block0X [0:31];
reg [8:0] block0Y [0:31];
reg [9:0] block1X [0:31];
reg [8:0] block1Y [0:31];
reg [9:0] block2X [0:31];
reg [8:0] block2Y [0:31];
reg [9:0] block3X [0:31];
reg [8:0] block3Y [0:31];
reg [9:0] block4X [0:31];
reg [8:0] block4Y [0:31];
reg [9:0] block5X [0:31];
reg [8:0] block5Y [0:31];
reg [9:0] block6X [0:31];
reg [8:0] block6Y [0:31];
reg [9:0] block7X [0:31];
reg [8:0] block7Y [0:31];
reg [9:0] block8X [0:31];
reg [8:0] block8Y [0:31];
reg [9:0] block9X [0:31];
reg [8:0] block9Y [0:31];
reg [9:0] block10X [0:31];
reg [8:0] block10Y [0:31];
reg [9:0] block11X [0:31];
reg [8:0] block11Y [0:31];
reg [9:0] block12X [0:31];
reg [8:0] block12Y [0:31];
reg [9:0] block13X [0:31];
reg [8:0] block13Y [0:31];
reg [9:0] block14X [0:31];
reg [8:0] block14Y [0:31];
reg [9:0] block15X [0:31];
reg [8:0] block15Y [0:31];





//controls block sizes
always@(posedge clk) 
	begin	
		//vertical block
		block0 <= (xCount > block0X[0] && xCount < (block0X[0] + 15'd125)) && (yCount > block0Y[0] && yCount < (block0Y[0] + 10'd100));
		block1 <= (xCount > block1X[0] && xCount < (block1X[0] + 15'd125)) && (yCount > block1Y[0] && yCount < (block1Y[0] + 10'd100));
		block2 <= (xCount > block2X[0] && xCount < (block2X[0] + 15'd125)) && (yCount > block2Y[0] && yCount < (block2Y[0] + 10'd100));
		block3 <= (xCount > block3X[0] && xCount < (block3X[0] + 15'd125)) && (yCount > block3Y[0] && yCount < (block3Y[0] + 10'd100));
		block4 <= (xCount > block4X[0] && xCount < (block4X[0] + 15'd125)) && (yCount > block4Y[0] && yCount < (block4Y[0] + 10'd100));
		block5 <= (xCount > block5X[0] && xCount < (block5X[0] + 15'd125)) && (yCount > block5Y[0] && yCount < (block5Y[0] + 10'd100));
		block6 <= (xCount > block6X[0] && xCount < (block6X[0] + 15'd125)) && (yCount > block6Y[0] && yCount < (block6Y[0] + 10'd100));
		block7 <= (xCount > block7X[0] && xCount < (block7X[0] + 15'd125)) && (yCount > block7Y[0] && yCount < (block7Y[0] + 10'd100));
		block8 <= (xCount > block8X[0] && xCount < (block8X[0] + 15'd125)) && (yCount > block8Y[0] && yCount < (block8Y[0] + 10'd100));
		block9 <= (xCount > block9X[0] && xCount < (block9X[0] + 15'd125)) && (yCount > block9Y[0] && yCount < (block9Y[0] + 10'd100));
		block10 <= (xCount > block10X[0] && xCount < (block10X[0] + 15'd125)) && (yCount > block10Y[0] && yCount < (block10Y[0] + 10'd100));
		block11 <= (xCount > block11X[0] && xCount < (block11X[0] + 15'd125)) && (yCount > block11Y[0] && yCount < (block11Y[0] + 10'd100));
		block12 <= (xCount > block12X[0] && xCount < (block12X[0] + 15'd125)) && (yCount > block12Y[0] && yCount < (block12Y[0] + 10'd100));
		block13 <= (xCount > block13X[0] && xCount < (block13X[0] + 15'd125)) && (yCount > block13Y[0] && yCount < (block13Y[0] + 10'd100));
		block14 <= (xCount > block14X[0] && xCount < (block14X[0] + 15'd125)) && (yCount > block14Y[0] && yCount < (block14Y[0] + 10'd100));
		block15 <= (xCount > block15X[0] && xCount < (block15X[0] + 15'd125)) && (yCount > block15Y[0] && yCount < (block15Y[0] + 10'd100));
		
		//horizontal block
	
	end




// Stationary block control
always @(posedge update)
	begin
		if (rst == 1'b0) // position
			begin 
				block0X[0] <= 10'd50;
				block0Y[0] <= 11'd50;
				block1X[0] <= 10'd175;
				block1Y[0] <= 11'd50;
				block2X[0] <= 10'd300;
				block2Y[0] <= 11'd50;
				block3X[0] <= 10'd425;
				block3Y[0] <= 11'd50;
				block4X[0] <= 10'd50;
				block4Y[0] <= 11'd150;
				block5X[0] <= 10'd175;
				block5Y[0] <= 11'd150;
				block6X[0] <= 10'd300;
				block6Y[0] <= 11'd150;
				block7X[0] <= 10'd425;
				block7Y[0] <= 11'd150;
				block8X[0] <= 10'd50;
				block8Y[0] <= 11'd250;
				block9X[0] <= 10'd175;
				block9Y[0] <= 11'd250;
				block10X[0] <= 10'd300;
				block10Y[0] <= 11'd250;
				block11X[0] <= 10'd425;
				block11Y[0] <= 11'd250;
				block12X[0] <= 10'd50;
				block12Y[0] <= 11'd350;
				block13X[0] <= 10'd175;
				block13Y[0] <= 11'd350;
				block14X[0] <= 10'd300;
				block14Y[0] <= 11'd350;
				block15X[0] <= 10'd425;
				block15Y[0] <= 11'd350;
				
			end
	end
endmodule
