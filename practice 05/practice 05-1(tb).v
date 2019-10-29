module block( q, 
              d, 
              clk);
  output q ; 
  input d ; 
  input clk ;
  
  
  
  reg q;
  reg n1;
  
  
  always@(posedge clk) begin
      n1 = d;
      q = n1;
  end

endmodule

module nonblock( q, 
                 d, 
                 clk);
  output q ; 
  input d ; 
  input clk ;

  reg q;
  reg n1;
  
  always @(posedge clk)begin
       n1 <= d;
       q <= n1;
  end
   
   

endmodule




`timescale 1ns/1ns
module tb_bnb;
  
  wire q1;
  wire q2;
  reg d;
  reg clk;
  
  initial clk = 1'b0;
  always #(100) clk = ~clk;
  
  block dut_1 (.q(q1),
               .d(d),
               .clk(clk));
               
  nonblock dut_2 (.q(q2),
                  .d(d),
                  .clk(clk));
                  
  initial begin                 
   #(0)  {d} = 1'b1;
   #(50) {d} = 1'b0; 
   #(50) {d} = 1'b1; 
   #(50) {d} = 1'b1; 
   #(50) {d} = 1'b0; 
   #(50) {d} = 1'b0; 
   #(50) {d} = 1'b0; 
   #(50) {d} = 1'b1; 
            
   $finish;
  end
endmodule


