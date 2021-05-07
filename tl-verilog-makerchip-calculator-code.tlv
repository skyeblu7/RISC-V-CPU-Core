\m4_TLV_version 1d: tl-x.org
\SV


   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   /* verilator lint_on WIDTH */
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv'])
\TLV  
   
   $reset = *reset;
   
   
   $val1[31:0] = >>1$out;
   $val2[31:0] = {28'd0, $val2_rand[3:0]};
   
   $sum[31:0] = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;
   
   $out[31:0] = 
      $reset ? 32'd0 :
      $op[1:0] == 2'd0 ? $sum :
      $op == 2'd1 ? $diff :
      $op == 2'd2 ? $prod :
                    $quot; // defualt
   
   

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 90;
   *failed = 1'b0;
   
   m4+calc_viz()
\SV
   endmodule
