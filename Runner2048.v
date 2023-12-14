module Runner2048 (board_clk, VGA_R, VGA_G, VGA_B, hsync, vsync, clk, blank_n, rst, inputnums);
input board_clk, rst; 
//input up, down, left, right;
input [3:0] inputnums; 
output hsync, vsync, clk, blank_n;

clock_converter clocks(board_clk, update, clk); //converts the board clock to VGA clock and frame update clock
wire clk; 
wire update; 

wire [9:0] xCount; 
wire [9:0] yCount;
wire ScreenArea;

VGA_Controller VGA(clk, xCount, yCount, ScreenArea, hsync, vsync, blank_n);

output reg [7:0]VGA_R, VGA_G, VGA_B;

reg R;
reg G;
reg B;
wire game_over;
wire win;
wire game_over_text;
wire win_text;

//wire [15:0]blocks1;
reg [11:0] row0[3:0];
reg [11:0] row1[3:0];
reg [11:0] row2[3:0];
reg [11:0] row3[3:0];


assign game_over = ((row0[0] !== row0[1]) && (row0[0] !== row1[0]) && (row0[1] !== row1[1]) && (row0[1] !== row0[2]) &&(row0[2] !== row1[2]) &&
	(row0[2] !== row0[3]) && (row0[3] !== row1[3]) && (row1[0] !== row1[1]) && (row1[0] !== row2[0]) && (row1[1] !== row2[1]) && 
	(row1[1] !== row1[2]) && (row1[2] !== row1[3]) && (row1[2] !== row2[2]) && (row1[3] !== row2[3]) && (row2[0] !== row2[1]) && 
	(row2[0] !== row3[0]) && (row2[1] !== row2[2]) && (row2[1] !== row3[1]) && (row2[2] !== row3[2]) && (row2[2] !== row2[3]) && 
	(row2[3] !== row3[3]) && (row3[0] !== row3[1]) && (row3[1] !== row3[2]) && (row3[2] !== row3[3])&&(row0[0] !== 0)&&
	(row0[1] !== 0)&&(row0[2] !== 0)&&(row0[3] !== 0)&&(row1[0] !== 0)&&(row1[1] !== 0)
	&&(row1[2] !== 0)&&(row1[3] !== 0)&&(row2[0] !== 0)&&(row2[1] !== 0)&&(row2[2] !== 0)
	&&(row2[3] !== 0)&&(row3[0] !== 0)&&(row3[1] !== 0)&&(row3[2] !== 0)&&(row3[3] !== 0));
	
	
assign win = ((row0[0] == 256) || (row0[1] == 256) || (row0[2] == 256) || (row0[3] == 256) || (row1[0] == 256) || (row1[1] == 256) || (row1[2] == 256) || (row1[3] == 256) || 
(row2[0] == 256) || (row2[1] == 256) || (row2[2] == 256) || (row2[3] == 256) || (row3[0] == 256) || (row3[1] == 256) || (row3[2] == 256) || (row3[3] == 256));



blocks bloc(clk,rst,update, xCount,yCount,squares1);

wire [15:0] squares1;
reg [15:0]squares;
integer i;
integer a;
always @(posedge clk)
	begin
		squares <= squares1;
	end



always @(posedge clk)
	begin
		if (game_over == 1'b0)
			begin
				if (win == 1'b0)
					begin
						R = 1'b0;
						G = 1'b0;
						B = 1'b0;
						
						
						
						//for first row
						for (i = 0; i < 4; i = i + 1) begin
							if(row0[i] == 0) begin
								R = R || squares[i];
								G = G || squares[i];
								B = B || squares[i];
							end
							else if(row0[i] == 2) begin
								R = R || squares[i];
								
							end
							else if(row0[i] == 4) begin
								B = B || squares[i];
							end
							else if(row0[i] == 8) begin
								G = G || squares[i];
							end
							else if(row0[i] == 16) begin
								R = R || squares[i];
								B = B || squares[i];
							end
							else if(row0[i] == 32) begin
								R = R || squares[i];
								G = G || squares[i];
							end
							else if(row0[i] == 64) begin
								B = B || squares[i];
								G = G || squares[i];
							end
							else if(row0[i] == 128) begin
								B = B;
								G = G;
								R = R;
							end
						end  //end for
						
						i = 0;
						
						//for second row
						for (i = 0; i < 4; i = i + 1) begin
							if(row1[i] == 0) begin
								R = R || squares[i + 4];
								G = G || squares[i + 4];
								B = B || squares[i + 4];
							end
							else if(row1[i] == 2) begin
								R = R || squares[i + 4];
							end
							else if(row1[i] == 4) begin
								B = B || squares[i + 4];
							end
							else if(row1[i] == 8) begin
								G = G || squares[i + 4];
							end
							else if(row1[i] == 16) begin
								R = R || squares[i + 4];
								B = B || squares[i + 4];
							end
							else if(row1[i] == 32) begin
								R = R || squares[i + 4];
								G = G || squares[i + 4];
							end
							else if(row1[i] == 64) begin
								B = B || squares[i + 4];
								G = G || squares[i + 4];
							end
							else if(row1[i] == 128) begin
								B = B;
								G = G;
								R = R;
							end
						end  //end for
						
						
						//for third row
						for (i = 0; i < 4; i = i + 1) begin
							if(row2[i] == 0) begin
								R = R || squares[i + 8];
								G = G || squares[i + 8];
								B = B || squares[i + 8];
							end
							else if(row2[i] == 2) begin
								R = R || squares[i + 8];
							end
							else if(row2[i] == 4) begin
								B = B || squares[i + 8];
							end
							else if(row2[i] == 8) begin
								G = G || squares[i + 8];
							end
							else if(row2[i] == 16) begin
								R = R || squares[i + 8];
								B = B || squares[i + 8];
							end
							else if(row2[i] == 32) begin
								R = R || squares[i + 8];
								G = G || squares[i + 8];
							end
							else if(row2[i] == 64) begin
								B = B || squares[i + 8];
								G = G || squares[i + 8];
							end
							else if(row2[i] == 128) begin
								B = B;
								G = G;
								R = R;
							end
						end  //end for
						
						//for fourth row
						for (i = 0; i < 4; i = i + 1) begin
							if(row3[i] == 0) begin
								R = R || squares[i + 12];
								G = G || squares[i + 12];
								B = B || squares[i + 12];
							end
							else if(row3[i] == 2) begin
								R = R || squares[i + 12];
							end
							else if(row3[i] == 4) begin
								B = B || squares[i + 12];
							end
							else if(row3[i] == 8) begin
								G = G || squares[i + 12];
							end
							else if(row3[i] == 16) begin
								R = R || squares[i + 12];
								B = B || squares[i + 12];
							end
							else if(row3[i] == 32) begin
								R = R || squares[i + 12];
								G = G || squares[i + 12];
							end
							else if(row3[i] == 64) begin
								B = B || squares[i + 12];
								G = G || squares[i + 12];
							end
							else if(row3[i] == 128) begin
								B = B;
								G = G;
								R = R;
							end
						end  //end for
						
						//fill in the 2048 code here
						/*R = squares[0] || squares[1] || squares[2] || squares[3] || squares[4] || squares[6]
							|| squares[7] || squares[8] || squares[11] || squares[12] || squares[13]
							|| squares[14] || squares[15];
						G = squares[8] || squares[9] || squares[0] || squares[0] || squares[10];
						B = squares[3] || squares[5] || squares[8] || squares[1] || squares[10];
						*/
					end
				else
					begin
						R = 1'b0;
						G = ScreenArea & !win_text;
						B = 1'b0;
					end
			end
		else
			begin
				R = ScreenArea & !game_over_text;
				G = 1'b0;
				B = 1'b0;
			end
	end
reg [2:0] state;
reg [3:0] NS;
reg [3:0] inputnumbers;

reg ran;

/*
always@(*)
begin 
inputnumbers [3] = up;
inputnumbers [2] = down;
inputnumbers [1] = left;
inputnumbers [0] = right;
end 
*/
//An attempt to make code for sliding left.
// for input left
parameter START = 3'b000,
          MOVEUP = 3'b001,
          MOVEDOWN = 3'b010,
          MOVELEFT = 3'b011,
          MOVERIGHT = 3'b100,
			 REVERSETRANSLATE = 3'b101,
			 CHECK = 3'b111; 
						  
integer terminate;
reg [11:0] vert0[3:0];
reg [11:0] vert1[3:0];
reg [11:0] vert2[3:0];
reg [11:0] vert3[3:0];

always @ (posedge board_clk, posedge rst) 
	begin 
	if(rst)  begin 
	row0[0] <= 12'd0; 
	row0[1] <= 12'd0; 
	row0[2] <= 12'd0; 
	row0[3] <= 12'd0; 
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
	ran = 0;
	NS <= START;
 vert0[0] <= 12'd0;  
			  vert0[1] <= 12'd0; 
			  vert0[2] <= 12'd0; 
			  vert0[3] <= 12'd0; 
			  vert1[0] <= 12'd0; 
			  vert1[1] <= 12'd0; 
			  vert1[2] <= 12'd0; 
			  vert1[3] <= 12'd0; 
			  vert2[0] <= 12'd0; 
			  vert2[1] <= 12'd0; 
			  vert2[2] <= 12'd0; 
			  vert2[3] <= 12'd0; 
			  vert3[0] <= 12'd0; 
			  vert3[1] <= 12'd0; 
			  vert3[2] <= 12'd0; 
			  vert3[3] <= 12'd0; 
	end 
	else begin 
	case (state) 
		START: begin 
			case(inputnums)
				4'b0111: begin 
					NS <= MOVEUP;
					end 
				4'b1011: begin 
					NS <= MOVEDOWN;
					end 
				4'b1101: begin 
					NS <= MOVELEFT;
					end 
				4'b1110: begin 
				   NS <= MOVERIGHT;
					end 
				default: begin 
				    vert0[0] <= row0[0]; 
			  vert0[1] <= row1[0];
			  vert0[2] <= row2[0];
			  vert0[3] <= row3[0];
			  vert1[0] <= row0[1];
			  vert1[1] <= row1[1];
			  vert1[2] <= row2[1];
			  vert1[3] <= row3[1];
			  vert2[0] <= row0[2];
			  vert2[1] <= row1[2];
			  vert2[2] <= row2[2];
			  vert2[3] <= row3[2];
			  vert3[0] <= row0[3];
			  vert3[1] <= row1[3];
			  vert3[2] <= row2[3];
			  vert3[3] <= row3[3];
				
					ran <= 0;
					NS <= START; 
			
					terminate = 0;	
					
					end 
				endcase
		   end 
	  
		
		REVERSETRANSLATE: begin 
			row0[0] <= vert0[0];
			row0[1] <= vert1[0]; 
			row0[2] <= vert2[0]; 
			row0[3] <= vert3[0]; 
			row1[0] <= vert0[1];
			row1[1] <= vert1[1]; 
			row1[2] <= vert2[1]; 
			row1[3] <= vert3[1]; 
			row2[0] <= vert0[2]; 
			row2[1] <= vert1[2]; 
			row2[2] <= vert2[2]; 
			row2[3] <= vert3[2]; 
			row3[0] <= vert0[3]; 
			row3[1] <= vert1[3]; 
			row3[2] <= vert2[3]; 
			row3[3] <= vert3[3]; 
			 terminate = 0;	
			NS <= CHECK; 
			
		end 
		
		
		MOVEUP: begin 
					
					
						for (a = 0; a < 3; a = a + 1) begin
						  if (((vert0[a] == 12'd0) || (vert0[a] == vert0[a + 1]))&&!(vert0[a] + vert0[a+1] == 12'd0)&&!(terminate)) begin
							 vert0[a] <= vert0[a] + vert0[a + 1];
							 vert0[a + 1] <= 12'd0;
							 ran = 1;
							 terminate  = 1;
						  end
						  end 
						for (a = 0; a < 3; a = a + 1) begin
						  if (((vert1[a] == 12'd0) || (vert1[a] == vert1[a + 1]))&&!(vert1[a] + vert1[a+1] == 12'd0)&&!(terminate) ) begin
							 vert1[a] <= vert1[a] + vert1[a + 1];
							 vert1[a + 1] <= 12'd0;
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 for (a = 0; a < 3; a = a + 1) begin
						  if (((vert2[a] == 12'd0) || (vert2[a] == vert2[a + 1]))&&!(vert2[a] + vert2[a+1] == 12'd0)&&!(terminate) ) begin
							 vert2[a] <= vert2[a] + vert2[a + 1];
							 vert2[a + 1] <= 12'd0;
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 for (a = 0; a < 3; a = a + 1) begin
						  if (((vert3[a] == 12'd0) || (vert3[a] == vert3[a + 1]))&&!(vert3[a] + vert3[a+1] == 12'd0)&&!(terminate)) begin
							 vert3[a] <= vert3[a] + vert3[a + 1];
							 vert3[a + 1] <= 12'd0;
							 
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 
						if(ran == 1) begin 
						 NS <= MOVEUP; 
						 ran = 0;
						 terminate = 0;	
						 end 
						 else begin 
						  terminate = 0;	
						 NS <= REVERSETRANSLATE;
						end 
		end 
		
		MOVEDOWN: begin 

		
		   for (a = 3; a > 0; a = a - 1) begin
			 if (((vert0[a] == 12'd0) || (vert0[a] == vert0[a - 1])) && !(vert0[a] + vert0[a - 1] == 12'd0) && !(terminate)) begin
				vert0[a] <= vert0[a] + vert0[a - 1];
				vert0[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((vert1[a] == 12'd0) || (vert1[a] == vert1[a - 1])) && !(vert1[a] + vert1[a - 1] == 12'd0) && !(terminate)) begin
				vert1[a] <= vert1[a] + vert1[a - 1];
				vert1[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((vert2[a] == 12'd0) || (vert2[a] == vert2[a - 1])) && !(vert2[a] + vert2[a - 1] == 12'd0) && !(terminate)) begin
				vert2[a] <= vert2[a] + vert2[a - 1];
				vert2[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((vert3[a] == 12'd0) || (vert3[a] == vert3[a - 1])) && !(vert3[a] + vert3[a - 1] == 12'd0) && !(terminate)) begin
				vert3[a] <= vert3[a] + vert3[a - 1];
				vert3[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  if(ran == 1) begin 
			 NS <= MOVEDOWN;
			 ran = 0;
			 terminate = 0;	
		  end else begin
			 NS <= REVERSETRANSLATE;
			 terminate = 0;
		  end
		end
		
		MOVELEFT: begin
	
						for (a = 0; a < 3; a = a + 1) begin
						  if (((row0[a] == 12'd0) || (row0[a] == row0[a + 1]))&&!(row0[a] + row0[a+1] == 12'd0)&&!(terminate)) begin
							 row0[a] <= row0[a] + row0[a + 1];
							 row0[a + 1] <= 12'd0;
							 ran = 1;
							 terminate  = 1;
						  end
						  end 
						for (a = 0; a < 3; a = a + 1) begin
						  if (((row1[a] == 12'd0) || (row1[a] == row1[a + 1]))&&!(row1[a] + row1[a+1] == 12'd0)&&!(terminate) ) begin
							 row1[a] <= row1[a] + row1[a + 1];
							 row1[a + 1] <= 12'd0;
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 for (a = 0; a < 3; a = a + 1) begin
						  if (((row2[a] == 12'd0) || (row2[a] == row2[a + 1]))&&!(row2[a] + row2[a+1] == 12'd0)&&!(terminate) ) begin
							 row2[a] <= row2[a] + row2[a + 1];
							 row2[a + 1] <= 12'd0;
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 for (a = 0; a < 3; a = a + 1) begin
						  if (((row3[a] == 12'd0) || (row3[a] == row3[a + 1]))&&!(row3[a] + row3[a+1] == 12'd0)&&!(terminate)) begin
							 row3[a] <= row3[a] + row3[a + 1];
							 row3[a + 1] <= 12'd0;
							 
							 ran = 1;
							 terminate = 1;
						  end
						
						 end 
						 
						if(ran == 1) begin 
						 NS <= MOVELEFT; 
						 ran = 0;
						 terminate = 0;	
						 end 
						 else begin 
						  terminate = 0;	
						 NS <= CHECK;
						end 
		end
		MOVERIGHT: begin
		
		  for (a = 3; a > 0; a = a - 1) begin
			 if (((row0[a] == 12'd0) || (row0[a] == row0[a - 1])) && !(row0[a] + row0[a - 1] == 12'd0) && !(terminate)) begin
				row0[a] <= row0[a] + row0[a - 1];
				row0[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((row1[a] == 12'd0) || (row1[a] == row1[a - 1])) && !(row1[a] + row1[a - 1] == 12'd0) && !(terminate)) begin
				row1[a] <= row1[a] + row1[a - 1];
				row1[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((row2[a] == 12'd0) || (row2[a] == row2[a - 1])) && !(row2[a] + row2[a - 1] == 12'd0) && !(terminate)) begin
				row2[a] <= row2[a] + row2[a - 1];
				row2[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  for (a = 3; a > 0; a = a - 1) begin
			 if (((row3[a] == 12'd0) || (row3[a] == row3[a - 1])) && !(row3[a] + row3[a - 1] == 12'd0) && !(terminate)) begin
				row3[a] <= row3[a] + row3[a - 1];
				row3[a - 1] <= 12'd0;
				ran = 1;
				terminate = 1;
			 end
		  end

		  if(ran == 1) begin 
			 NS <= MOVERIGHT;
			 ran = 0;
			 terminate = 0;	
		  end else begin
			 NS <= CHECK;
			 terminate = 0;
		  end
		end
		CHECK: begin
		if( inputnums == 4'b1111) begin 
			if(row0[0] == 0 || row0[1] == 0 || row0[2] == 0 || row0[3] == 0) begin
				for (a = 0; a < 4; a = a + 1) begin
						  if ((row0[a] == 0) && !(terminate)) begin
							row0[a] <= 12'd2;;
							terminate = 1;
						  end
				 end 
				 NS <= START; 
			end 
			else if(row1[0] == 0 || row1[1] == 0 || row1[2] == 0 || row1[3] == 0) begin
				for (a = 0; a < 4; a = a + 1) begin
						  if ((row1[a] == 0) && !(terminate)) begin
							row1[a] <= 12'd2;;
							terminate = 1;
						  end
				 end 
				 NS <= START; 
			end 
			else if(row2[0] == 0 || row2[1] == 0 || row2[2] == 0 || row2[3] == 0) begin
				for (a = 0; a < 4; a = a + 1) begin
						  if ((row2[a] == 0) && !(terminate)) begin
							row2[a] <= 12'd2;;
							terminate = 1;
						  end
				 end 
				 NS <= START; 
			end 
			else if(row3[0] == 0 || row3[1] == 0 || row3[2] == 0 || row3[3] == 0) begin
				for (a = 0; a < 4; a = a + 1) begin
						  if ((row3[a] == 0) && !(terminate)) begin
							row3[a] <= 12'd2;
							terminate = 1;
						  end
				 end
				NS <= START; 
			end 
			else begin 
			NS <= START;
		end 
		end 
		else 
		begin 
		NS<= CHECK;
		end
		end
	endcase 
	end 
	end 
	
always @ (posedge board_clk, posedge rst) 
	begin 
	if(rst)  begin 
	state <= START;
	end 
	else begin 
	state <= NS; 
	end 
	end 


always @ (posedge clk)
	begin
		VGA_R = {8{R}};
		VGA_G = {8{G}};
		VGA_B = {8{B}};
	end 






endmodule

