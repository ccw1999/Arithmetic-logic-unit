module ALU_1bit(result, c_out, set, overflow, a, b, less, Ainvert, Binvert, c_in, op);
input        a;
input        b;
input        less;
input        Ainvert;
input        Binvert;
input        c_in;
input  [1:0] op;
output       result;
output       c_out;
output       set;                 
output       overflow;

reg 		result;
wire		a1, b1, c1, c2, c3;

assign a1 = Ainvert ? ~a : a;
assign b1 = Binvert ? ~b : b;
assign set = c3;

and(c1, a1, b1);
or(c2, a1, b1);
FA FA1(.s(c3), .carry_out(c_out), .x(a1), .y(b1), .carry_in(c_in));
xor(overflow, c_in, c_out);

always @(*)
begin
	case(op)
	2'b00: result = c1;
	2'b01: result = c2;
	2'b10: result = c3;
	default: result = less;
	endcase
end

endmodule
