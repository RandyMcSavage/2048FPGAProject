module Logic2048(clk, up, down, left, right, rst, row0, row1, row2, row3);

input clk, rst, up, down, left, right;
reg [11:0] row0[3:0];
reg [11:0] row1[3:0];
reg [11:0] row2[3:0];
reg [11:0] row3[3:0];

//reg [11:0] Matrix[15:0];
reg [10:0] randCount;

//Matrix[0] = row0[0]
//Matrix[1] = row0[1]
//Matrix[2] = row0[2]
//Matrix[3] = row0[3]
//Matrix[4] = row1[0]
//Matrix[5] = row1[1]
//Matrix[6] = row1[2]
//Matrix[7] = row1[3]
//Matrix[8] = row2[0]
//Matrix[9] = row2[1]
//Matrix[10] = row2[2]
//Matrix[11] = row2[3]
//Matrix[12] = row3[0]
//Matrix[13] = row3[1]
//Matrix[14] = row3[2]
//Matrix[15] = row3[3]





assign check_over = ((row0[0] !== row0[1]) && (row0[0] !== row1[0]) && (row0[1] !== row1[1]) && (row0[1] !== row0[2]) &&(row0[2] !== row1[2]) &&
	(row0[2] !== row0[3]) && (row0[3] !== row1[3]) && (row1[0] !== row1[1]) && (row1[0] !== row2[0]) && (row1[1] !== row2[1]) && 
	(row1[1] !== row1[2]) && (row1[2] !== row1[3]) && (row1[2] !== row2[2]) && (row1[3] !== row2[3]) && (row2[0] !== row2[1]) && 
	(row2[0] !== row3[0]) && (row2[1] !== row2[2]) && (row2[1] !== row3[1]) && (row2[2] !== row3[2]) && (row2[2] !== row2[3]) && 
	(row2[3] !== row3[3]) && (row3[0] !== row3[1]) && (row3[1] !== row3[2]) && (row3[2] !== row3[3])&&(row0[0] !== 0)&&
	(row0[1] !== 0)&&(row0[2] !== 0)&&(row0[3] !== 0)&&(row1[0] !== 0)&&(row1[1] !== 0)
	&&(row1[2] !== 0)&&(row1[3] !== 0)&&(row2[0] !== 0)&&(row2[1] !== 0)&&(row2[2] !== 0)
	&&(row2[3] !== 0)&&(row3[0] !== 0)&&(row3[1] !== 0)&&(row3[2] !== 0)&&(row3[3] !== 0));
	

assign checkWin = ((row0[0] == 2048) || (row0[1] == 2048) || (row0[2] == 2048) || (row0[3] == 2048) || (row1[0] == 2048) || (row1[1] == 2048) || (row1[2] == 2048) || (row1[3] == 2048) || 
(row2[0] == 2048) || (row2[1] == 2048) || (row2[2] == 2048) || (row2[3] == 2048) || (row3[0] == 2048) || (row3[1] == 2048) || (row3[2] == 2048) || (row3[3] == 2048));

reg state;
//An attempt to make code for sliding left.
// for input left
parameter START = 3'b000,
                    MOVEUP = 3'b001,
                    MOVEDOWN = 3'b010,
                    MOVELEFT = 3'b011,
                    MOVERIGHT = 3'b100;

always @ (posedge clk, posedge rst) 
	begin 
	if(!rst)  begin 
	row1[0] <= 12'd0; 
	row1[1] <= 12'd0; 
	row1[2] <= 12'd0; 
	row1[3] <= 12'd0; 
	row2[0] <= 12'd0; 
	row2[1] <= 12'd0; 
	row2[2] <= 12'd0; 
	row2[3] <= 12'd0; 
	row3[0] <= 12'd0; 
	row3[1] <= 12'd0; 
	row3[2] <= 12'd0; 
	row3[3] <= 12'd0; 
	state <= 3'b000;
	end 
	else begin 
	case (state) 
		START: begin 
			if(!up) begin 
				state <= MOVEUP;
			end 
			if(!down) begin 
				state <= MOVEDOWN;
			end 
			if(!left) begin 
				state <= MOVELEFT; 
			end 
			if(!right) begin 
				state <= MOVERIGHT; 
			end 
		   end 
	   MOVELEFT: begin
			for(i = 0; i < 3; i = i + 1) 
			begin 
				if(row0[i] == 0) begin 
			row0[i] <= row0[i+1];
				i = 0; 
				end 
				
			end 
			end 
	endcase 
	end 
	end 
	





//Counter for Random Number
always @ (posedge clk, posedge rst)
	begin
		if (rst)
			randCount <=0;
		else if (randCount == 11'b11111111111)
			randCount <=0;
		else randCount <= randCount + 1;
	
	end
	
	endmodule 
	