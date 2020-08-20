 module division_5(

     input clk,rst,
     output cnt_pos_w,cnt_neg_w,
     output [2:0] cnt_w,
     output clk_o
 );
 reg [2:0] cnt;
 reg  cnt_neg;
 reg  cnt_pos;

 assign cnt_pos_w = cnt_pos;
 assign cnt_neg_w = cnt_neg;

assign cnt_w = cnt;

 always @( posedge clk , negedge rst) begin
     if(!rst)
     begin
         cnt <= 3'b0;
     end
     else if (cnt == 3'd4)
     begin
         cnt <= 3'b0;
     end 
     else begin
         cnt <= cnt +1;
     end
 end

 
 always @( posedge clk , negedge rst) begin
      if(!rst)
     begin
         cnt_pos <= 3'b0;
     end
     else if (cnt == 1 || cnt == 4) begin
         cnt_pos <= ~cnt_pos;
     end
 end

 always @( negedge clk , negedge rst) begin
      if(!rst)
     begin
         cnt_neg <= 3'b0;
     end
     else if (cnt == 0 || cnt == 2) begin
         cnt_neg <= ~cnt_neg;
     end
 end

 assign clk_o = cnt_neg & cnt_pos;

    endmodule
