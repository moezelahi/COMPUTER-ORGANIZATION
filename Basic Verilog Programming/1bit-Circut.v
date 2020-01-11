module labK;

   reg a, b, cin;
   // reg flag;
   reg [1:0] expect;
   wire z, cout;
   wire xor1, xor2;
   wire and1, and2;
   integer i, j, k;

   xor(xor1, b, a);
   xor(z, cin, xor1);
   and(and1, b, a);
   and(and2, xor1, cin);
   or(cout, and2, and1);

   initial
     begin
        // flag = $value$plusargs("a=%b", a);
        // if (~flag)
        //   $display("Warning: argument a is missing.");

        // flag = $value$plusargs("b=%b", b);
        // if (~flag)
        //   $display("Warning: argument b is missing.");

        // flag = $value$plusargs("cin=%b", cin);
        // if (~flag)
        //   $display("Warning: argument cin is missing.");

        for (i = 0; i < 2; i = i + 1)
          for (j = 0; j < 2; j = j + 1)
            for (k = 0; k < 2; k = k + 1)
              begin
                 a = i;
                 b = j;
                 cin = k;

                 expect = a + b + cin;

                 #1; // wait for z and cout
                 if (expect[0] === z && expect[1] === cout)
                   $display("PASS: a=%b b=%b cin=%b z=%b cout=%b",
                            a, b, cin, z, cout);
                 else
                   $display("FAIL: a=%b b=%b cin=%b z=%b cout=%b",
                            a, b, cin, z, cout);
              end
        $finish;
     end

endmodule