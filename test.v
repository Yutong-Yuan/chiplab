module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter s0 = 0, s1 =1 , s2 =2 ;
    reg [2:0] state,nextstate;

    always @(*) begin
        case (state)
            s0 : nextstate=in[3]?s1:s0;
            s1 : nextstate=s2;
            s2 : nextstate=s3; 
            default: ;
        endcase
    end

    always @(posedge clk)   begin
        if(reset)   state<=s0;
        else begin
            state<=nextstate;
            done<=1;
        end
    end
endmodule
