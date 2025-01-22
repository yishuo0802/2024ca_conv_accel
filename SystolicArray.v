module PE(
  input         clock,
  input         reset,
  input         io_compute_en,
  input         io_read_en,
  input         io_compute_mode,
  input  [7:0]  io_ifmap_i,
  output [7:0]  io_ifmap_o,
  input  [7:0]  io_weight_i,
  output [7:0]  io_weight_o,
  input  [31:0] io_ipsum,
  output [31:0] io_opsum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ifmap; // @[PE.scala 25:22]
  reg [7:0] weight; // @[PE.scala 26:23]
  reg [31:0] psum; // @[PE.scala 27:21]
  wire [15:0] _psum_T = $signed(io_ifmap_i) * $signed(io_weight_i); // @[PE.scala 37:34]
  wire [31:0] _GEN_8 = {{16{_psum_T[15]}},_psum_T}; // @[PE.scala 37:20]
  wire [31:0] _psum_T_3 = $signed(psum) + $signed(_GEN_8); // @[PE.scala 37:20]
  wire [31:0] _GEN_0 = io_compute_mode ? $signed(_psum_T_3) : $signed(psum); // @[PE.scala 36:57 37:12 27:21]
  assign io_ifmap_o = ifmap; // @[PE.scala 41:14]
  assign io_weight_o = weight; // @[PE.scala 42:15]
  assign io_opsum = io_read_en ? $signed(psum) : $signed(32'sh0); // @[PE.scala 43:18]
  always @(posedge clock) begin
    if (reset) begin // @[PE.scala 25:22]
      ifmap <= 8'sh0; // @[PE.scala 25:22]
    end else if (!(reset)) begin // @[PE.scala 29:23]
      if (io_compute_en) begin // @[PE.scala 31:31]
        ifmap <= io_ifmap_i; // @[PE.scala 32:11]
      end
    end
    if (reset) begin // @[PE.scala 26:23]
      weight <= 8'sh0; // @[PE.scala 26:23]
    end else if (!(reset)) begin // @[PE.scala 29:23]
      if (io_compute_en) begin // @[PE.scala 31:31]
        weight <= io_weight_i; // @[PE.scala 33:12]
      end
    end
    if (reset) begin // @[PE.scala 27:21]
      psum <= 32'sh0; // @[PE.scala 27:21]
    end else if (reset) begin // @[PE.scala 29:23]
      psum <= 32'sh0; // @[PE.scala 30:10]
    end else if (io_compute_en) begin // @[PE.scala 31:31]
      if (~io_compute_mode) begin // @[PE.scala 34:50]
        psum <= io_ipsum; // @[PE.scala 35:12]
      end else begin
        psum <= _GEN_0;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ifmap = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  weight = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  psum = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SystolicArray(
  input           clock,
  input           reset,
  input  [63:0]   io_compute_en,
  input  [63:0]   io_read_en,
  input  [63:0]   io_compute_mode,
  input  [63:0]   io_ifmap,
  input  [63:0]   io_weight,
  input  [2047:0] io_ipsum,
  output [2047:0] io_opsum
);
  wire  pe_array_0_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_0_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_0_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_0_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_1_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_1_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_1_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_2_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_2_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_2_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_3_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_3_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_3_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_4_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_4_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_4_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_5_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_5_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_5_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_6_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_6_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_6_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_0_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_0_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_0_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_0_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_0_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_0_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_0_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_0_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_0_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_0_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_0_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_1_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_1_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_1_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_1_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_1_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_1_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_1_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_1_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_1_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_1_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_1_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_2_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_2_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_2_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_2_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_2_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_2_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_2_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_2_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_2_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_2_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_2_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_3_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_3_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_3_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_3_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_3_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_3_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_3_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_3_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_3_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_3_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_3_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_4_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_4_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_4_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_4_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_4_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_4_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_4_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_4_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_4_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_4_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_4_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_5_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_5_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_5_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_5_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_5_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_5_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_5_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_5_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_5_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_5_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_5_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_6_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_6_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_6_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_6_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_6_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_6_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_6_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_6_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_6_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_6_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_6_io_opsum; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_7_clock; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_7_reset; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_7_io_compute_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_7_io_read_en; // @[Systolic_array.scala 16:47]
  wire  pe_array_7_7_io_compute_mode; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_7_io_ifmap_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_7_io_ifmap_o; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_7_io_weight_i; // @[Systolic_array.scala 16:47]
  wire [7:0] pe_array_7_7_io_weight_o; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_7_io_ipsum; // @[Systolic_array.scala 16:47]
  wire [31:0] pe_array_7_7_io_opsum; // @[Systolic_array.scala 16:47]
  wire  _pe_array_0_0_io_ifmap_i_T_1 = ~io_ifmap[7]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_1_0_io_ifmap_i_T_1 = ~io_ifmap[15]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_2_0_io_ifmap_i_T_1 = ~io_ifmap[23]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_3_0_io_ifmap_i_T_1 = ~io_ifmap[31]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_4_0_io_ifmap_i_T_1 = ~io_ifmap[39]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_5_0_io_ifmap_i_T_1 = ~io_ifmap[47]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_6_0_io_ifmap_i_T_1 = ~io_ifmap[55]; // @[Systolic_array.scala 27:50]
  wire  _pe_array_7_0_io_ifmap_i_T_1 = ~io_ifmap[63]; // @[Systolic_array.scala 27:50]
  wire [255:0] io_opsum_lo_lo_lo = {pe_array_0_7_io_opsum,pe_array_0_6_io_opsum,pe_array_0_5_io_opsum,
    pe_array_0_4_io_opsum,pe_array_0_3_io_opsum,pe_array_0_2_io_opsum,pe_array_0_1_io_opsum,pe_array_0_0_io_opsum}; // @[Systolic_array.scala 41:28]
  wire [511:0] io_opsum_lo_lo = {pe_array_1_7_io_opsum,pe_array_1_6_io_opsum,pe_array_1_5_io_opsum,pe_array_1_4_io_opsum
    ,pe_array_1_3_io_opsum,pe_array_1_2_io_opsum,pe_array_1_1_io_opsum,pe_array_1_0_io_opsum,io_opsum_lo_lo_lo}; // @[Systolic_array.scala 41:28]
  wire [255:0] io_opsum_lo_hi_lo = {pe_array_2_7_io_opsum,pe_array_2_6_io_opsum,pe_array_2_5_io_opsum,
    pe_array_2_4_io_opsum,pe_array_2_3_io_opsum,pe_array_2_2_io_opsum,pe_array_2_1_io_opsum,pe_array_2_0_io_opsum}; // @[Systolic_array.scala 41:28]
  wire [1023:0] io_opsum_lo = {pe_array_3_7_io_opsum,pe_array_3_6_io_opsum,pe_array_3_5_io_opsum,pe_array_3_4_io_opsum,
    pe_array_3_3_io_opsum,pe_array_3_2_io_opsum,pe_array_3_1_io_opsum,pe_array_3_0_io_opsum,io_opsum_lo_hi_lo,
    io_opsum_lo_lo}; // @[Systolic_array.scala 41:28]
  wire [255:0] io_opsum_hi_lo_lo = {pe_array_4_7_io_opsum,pe_array_4_6_io_opsum,pe_array_4_5_io_opsum,
    pe_array_4_4_io_opsum,pe_array_4_3_io_opsum,pe_array_4_2_io_opsum,pe_array_4_1_io_opsum,pe_array_4_0_io_opsum}; // @[Systolic_array.scala 41:28]
  wire [511:0] io_opsum_hi_lo = {pe_array_5_7_io_opsum,pe_array_5_6_io_opsum,pe_array_5_5_io_opsum,pe_array_5_4_io_opsum
    ,pe_array_5_3_io_opsum,pe_array_5_2_io_opsum,pe_array_5_1_io_opsum,pe_array_5_0_io_opsum,io_opsum_hi_lo_lo}; // @[Systolic_array.scala 41:28]
  wire [255:0] io_opsum_hi_hi_lo = {pe_array_6_7_io_opsum,pe_array_6_6_io_opsum,pe_array_6_5_io_opsum,
    pe_array_6_4_io_opsum,pe_array_6_3_io_opsum,pe_array_6_2_io_opsum,pe_array_6_1_io_opsum,pe_array_6_0_io_opsum}; // @[Systolic_array.scala 41:28]
  wire [1023:0] io_opsum_hi = {pe_array_7_7_io_opsum,pe_array_7_6_io_opsum,pe_array_7_5_io_opsum,pe_array_7_4_io_opsum,
    pe_array_7_3_io_opsum,pe_array_7_2_io_opsum,pe_array_7_1_io_opsum,pe_array_7_0_io_opsum,io_opsum_hi_hi_lo,
    io_opsum_hi_lo}; // @[Systolic_array.scala 41:28]
  PE pe_array_0_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_0_clock),
    .reset(pe_array_0_0_reset),
    .io_compute_en(pe_array_0_0_io_compute_en),
    .io_read_en(pe_array_0_0_io_read_en),
    .io_compute_mode(pe_array_0_0_io_compute_mode),
    .io_ifmap_i(pe_array_0_0_io_ifmap_i),
    .io_ifmap_o(pe_array_0_0_io_ifmap_o),
    .io_weight_i(pe_array_0_0_io_weight_i),
    .io_weight_o(pe_array_0_0_io_weight_o),
    .io_ipsum(pe_array_0_0_io_ipsum),
    .io_opsum(pe_array_0_0_io_opsum)
  );
  PE pe_array_0_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_1_clock),
    .reset(pe_array_0_1_reset),
    .io_compute_en(pe_array_0_1_io_compute_en),
    .io_read_en(pe_array_0_1_io_read_en),
    .io_compute_mode(pe_array_0_1_io_compute_mode),
    .io_ifmap_i(pe_array_0_1_io_ifmap_i),
    .io_ifmap_o(pe_array_0_1_io_ifmap_o),
    .io_weight_i(pe_array_0_1_io_weight_i),
    .io_weight_o(pe_array_0_1_io_weight_o),
    .io_ipsum(pe_array_0_1_io_ipsum),
    .io_opsum(pe_array_0_1_io_opsum)
  );
  PE pe_array_0_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_2_clock),
    .reset(pe_array_0_2_reset),
    .io_compute_en(pe_array_0_2_io_compute_en),
    .io_read_en(pe_array_0_2_io_read_en),
    .io_compute_mode(pe_array_0_2_io_compute_mode),
    .io_ifmap_i(pe_array_0_2_io_ifmap_i),
    .io_ifmap_o(pe_array_0_2_io_ifmap_o),
    .io_weight_i(pe_array_0_2_io_weight_i),
    .io_weight_o(pe_array_0_2_io_weight_o),
    .io_ipsum(pe_array_0_2_io_ipsum),
    .io_opsum(pe_array_0_2_io_opsum)
  );
  PE pe_array_0_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_3_clock),
    .reset(pe_array_0_3_reset),
    .io_compute_en(pe_array_0_3_io_compute_en),
    .io_read_en(pe_array_0_3_io_read_en),
    .io_compute_mode(pe_array_0_3_io_compute_mode),
    .io_ifmap_i(pe_array_0_3_io_ifmap_i),
    .io_ifmap_o(pe_array_0_3_io_ifmap_o),
    .io_weight_i(pe_array_0_3_io_weight_i),
    .io_weight_o(pe_array_0_3_io_weight_o),
    .io_ipsum(pe_array_0_3_io_ipsum),
    .io_opsum(pe_array_0_3_io_opsum)
  );
  PE pe_array_0_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_4_clock),
    .reset(pe_array_0_4_reset),
    .io_compute_en(pe_array_0_4_io_compute_en),
    .io_read_en(pe_array_0_4_io_read_en),
    .io_compute_mode(pe_array_0_4_io_compute_mode),
    .io_ifmap_i(pe_array_0_4_io_ifmap_i),
    .io_ifmap_o(pe_array_0_4_io_ifmap_o),
    .io_weight_i(pe_array_0_4_io_weight_i),
    .io_weight_o(pe_array_0_4_io_weight_o),
    .io_ipsum(pe_array_0_4_io_ipsum),
    .io_opsum(pe_array_0_4_io_opsum)
  );
  PE pe_array_0_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_5_clock),
    .reset(pe_array_0_5_reset),
    .io_compute_en(pe_array_0_5_io_compute_en),
    .io_read_en(pe_array_0_5_io_read_en),
    .io_compute_mode(pe_array_0_5_io_compute_mode),
    .io_ifmap_i(pe_array_0_5_io_ifmap_i),
    .io_ifmap_o(pe_array_0_5_io_ifmap_o),
    .io_weight_i(pe_array_0_5_io_weight_i),
    .io_weight_o(pe_array_0_5_io_weight_o),
    .io_ipsum(pe_array_0_5_io_ipsum),
    .io_opsum(pe_array_0_5_io_opsum)
  );
  PE pe_array_0_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_6_clock),
    .reset(pe_array_0_6_reset),
    .io_compute_en(pe_array_0_6_io_compute_en),
    .io_read_en(pe_array_0_6_io_read_en),
    .io_compute_mode(pe_array_0_6_io_compute_mode),
    .io_ifmap_i(pe_array_0_6_io_ifmap_i),
    .io_ifmap_o(pe_array_0_6_io_ifmap_o),
    .io_weight_i(pe_array_0_6_io_weight_i),
    .io_weight_o(pe_array_0_6_io_weight_o),
    .io_ipsum(pe_array_0_6_io_ipsum),
    .io_opsum(pe_array_0_6_io_opsum)
  );
  PE pe_array_0_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_0_7_clock),
    .reset(pe_array_0_7_reset),
    .io_compute_en(pe_array_0_7_io_compute_en),
    .io_read_en(pe_array_0_7_io_read_en),
    .io_compute_mode(pe_array_0_7_io_compute_mode),
    .io_ifmap_i(pe_array_0_7_io_ifmap_i),
    .io_ifmap_o(pe_array_0_7_io_ifmap_o),
    .io_weight_i(pe_array_0_7_io_weight_i),
    .io_weight_o(pe_array_0_7_io_weight_o),
    .io_ipsum(pe_array_0_7_io_ipsum),
    .io_opsum(pe_array_0_7_io_opsum)
  );
  PE pe_array_1_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_0_clock),
    .reset(pe_array_1_0_reset),
    .io_compute_en(pe_array_1_0_io_compute_en),
    .io_read_en(pe_array_1_0_io_read_en),
    .io_compute_mode(pe_array_1_0_io_compute_mode),
    .io_ifmap_i(pe_array_1_0_io_ifmap_i),
    .io_ifmap_o(pe_array_1_0_io_ifmap_o),
    .io_weight_i(pe_array_1_0_io_weight_i),
    .io_weight_o(pe_array_1_0_io_weight_o),
    .io_ipsum(pe_array_1_0_io_ipsum),
    .io_opsum(pe_array_1_0_io_opsum)
  );
  PE pe_array_1_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_1_clock),
    .reset(pe_array_1_1_reset),
    .io_compute_en(pe_array_1_1_io_compute_en),
    .io_read_en(pe_array_1_1_io_read_en),
    .io_compute_mode(pe_array_1_1_io_compute_mode),
    .io_ifmap_i(pe_array_1_1_io_ifmap_i),
    .io_ifmap_o(pe_array_1_1_io_ifmap_o),
    .io_weight_i(pe_array_1_1_io_weight_i),
    .io_weight_o(pe_array_1_1_io_weight_o),
    .io_ipsum(pe_array_1_1_io_ipsum),
    .io_opsum(pe_array_1_1_io_opsum)
  );
  PE pe_array_1_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_2_clock),
    .reset(pe_array_1_2_reset),
    .io_compute_en(pe_array_1_2_io_compute_en),
    .io_read_en(pe_array_1_2_io_read_en),
    .io_compute_mode(pe_array_1_2_io_compute_mode),
    .io_ifmap_i(pe_array_1_2_io_ifmap_i),
    .io_ifmap_o(pe_array_1_2_io_ifmap_o),
    .io_weight_i(pe_array_1_2_io_weight_i),
    .io_weight_o(pe_array_1_2_io_weight_o),
    .io_ipsum(pe_array_1_2_io_ipsum),
    .io_opsum(pe_array_1_2_io_opsum)
  );
  PE pe_array_1_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_3_clock),
    .reset(pe_array_1_3_reset),
    .io_compute_en(pe_array_1_3_io_compute_en),
    .io_read_en(pe_array_1_3_io_read_en),
    .io_compute_mode(pe_array_1_3_io_compute_mode),
    .io_ifmap_i(pe_array_1_3_io_ifmap_i),
    .io_ifmap_o(pe_array_1_3_io_ifmap_o),
    .io_weight_i(pe_array_1_3_io_weight_i),
    .io_weight_o(pe_array_1_3_io_weight_o),
    .io_ipsum(pe_array_1_3_io_ipsum),
    .io_opsum(pe_array_1_3_io_opsum)
  );
  PE pe_array_1_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_4_clock),
    .reset(pe_array_1_4_reset),
    .io_compute_en(pe_array_1_4_io_compute_en),
    .io_read_en(pe_array_1_4_io_read_en),
    .io_compute_mode(pe_array_1_4_io_compute_mode),
    .io_ifmap_i(pe_array_1_4_io_ifmap_i),
    .io_ifmap_o(pe_array_1_4_io_ifmap_o),
    .io_weight_i(pe_array_1_4_io_weight_i),
    .io_weight_o(pe_array_1_4_io_weight_o),
    .io_ipsum(pe_array_1_4_io_ipsum),
    .io_opsum(pe_array_1_4_io_opsum)
  );
  PE pe_array_1_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_5_clock),
    .reset(pe_array_1_5_reset),
    .io_compute_en(pe_array_1_5_io_compute_en),
    .io_read_en(pe_array_1_5_io_read_en),
    .io_compute_mode(pe_array_1_5_io_compute_mode),
    .io_ifmap_i(pe_array_1_5_io_ifmap_i),
    .io_ifmap_o(pe_array_1_5_io_ifmap_o),
    .io_weight_i(pe_array_1_5_io_weight_i),
    .io_weight_o(pe_array_1_5_io_weight_o),
    .io_ipsum(pe_array_1_5_io_ipsum),
    .io_opsum(pe_array_1_5_io_opsum)
  );
  PE pe_array_1_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_6_clock),
    .reset(pe_array_1_6_reset),
    .io_compute_en(pe_array_1_6_io_compute_en),
    .io_read_en(pe_array_1_6_io_read_en),
    .io_compute_mode(pe_array_1_6_io_compute_mode),
    .io_ifmap_i(pe_array_1_6_io_ifmap_i),
    .io_ifmap_o(pe_array_1_6_io_ifmap_o),
    .io_weight_i(pe_array_1_6_io_weight_i),
    .io_weight_o(pe_array_1_6_io_weight_o),
    .io_ipsum(pe_array_1_6_io_ipsum),
    .io_opsum(pe_array_1_6_io_opsum)
  );
  PE pe_array_1_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_1_7_clock),
    .reset(pe_array_1_7_reset),
    .io_compute_en(pe_array_1_7_io_compute_en),
    .io_read_en(pe_array_1_7_io_read_en),
    .io_compute_mode(pe_array_1_7_io_compute_mode),
    .io_ifmap_i(pe_array_1_7_io_ifmap_i),
    .io_ifmap_o(pe_array_1_7_io_ifmap_o),
    .io_weight_i(pe_array_1_7_io_weight_i),
    .io_weight_o(pe_array_1_7_io_weight_o),
    .io_ipsum(pe_array_1_7_io_ipsum),
    .io_opsum(pe_array_1_7_io_opsum)
  );
  PE pe_array_2_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_0_clock),
    .reset(pe_array_2_0_reset),
    .io_compute_en(pe_array_2_0_io_compute_en),
    .io_read_en(pe_array_2_0_io_read_en),
    .io_compute_mode(pe_array_2_0_io_compute_mode),
    .io_ifmap_i(pe_array_2_0_io_ifmap_i),
    .io_ifmap_o(pe_array_2_0_io_ifmap_o),
    .io_weight_i(pe_array_2_0_io_weight_i),
    .io_weight_o(pe_array_2_0_io_weight_o),
    .io_ipsum(pe_array_2_0_io_ipsum),
    .io_opsum(pe_array_2_0_io_opsum)
  );
  PE pe_array_2_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_1_clock),
    .reset(pe_array_2_1_reset),
    .io_compute_en(pe_array_2_1_io_compute_en),
    .io_read_en(pe_array_2_1_io_read_en),
    .io_compute_mode(pe_array_2_1_io_compute_mode),
    .io_ifmap_i(pe_array_2_1_io_ifmap_i),
    .io_ifmap_o(pe_array_2_1_io_ifmap_o),
    .io_weight_i(pe_array_2_1_io_weight_i),
    .io_weight_o(pe_array_2_1_io_weight_o),
    .io_ipsum(pe_array_2_1_io_ipsum),
    .io_opsum(pe_array_2_1_io_opsum)
  );
  PE pe_array_2_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_2_clock),
    .reset(pe_array_2_2_reset),
    .io_compute_en(pe_array_2_2_io_compute_en),
    .io_read_en(pe_array_2_2_io_read_en),
    .io_compute_mode(pe_array_2_2_io_compute_mode),
    .io_ifmap_i(pe_array_2_2_io_ifmap_i),
    .io_ifmap_o(pe_array_2_2_io_ifmap_o),
    .io_weight_i(pe_array_2_2_io_weight_i),
    .io_weight_o(pe_array_2_2_io_weight_o),
    .io_ipsum(pe_array_2_2_io_ipsum),
    .io_opsum(pe_array_2_2_io_opsum)
  );
  PE pe_array_2_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_3_clock),
    .reset(pe_array_2_3_reset),
    .io_compute_en(pe_array_2_3_io_compute_en),
    .io_read_en(pe_array_2_3_io_read_en),
    .io_compute_mode(pe_array_2_3_io_compute_mode),
    .io_ifmap_i(pe_array_2_3_io_ifmap_i),
    .io_ifmap_o(pe_array_2_3_io_ifmap_o),
    .io_weight_i(pe_array_2_3_io_weight_i),
    .io_weight_o(pe_array_2_3_io_weight_o),
    .io_ipsum(pe_array_2_3_io_ipsum),
    .io_opsum(pe_array_2_3_io_opsum)
  );
  PE pe_array_2_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_4_clock),
    .reset(pe_array_2_4_reset),
    .io_compute_en(pe_array_2_4_io_compute_en),
    .io_read_en(pe_array_2_4_io_read_en),
    .io_compute_mode(pe_array_2_4_io_compute_mode),
    .io_ifmap_i(pe_array_2_4_io_ifmap_i),
    .io_ifmap_o(pe_array_2_4_io_ifmap_o),
    .io_weight_i(pe_array_2_4_io_weight_i),
    .io_weight_o(pe_array_2_4_io_weight_o),
    .io_ipsum(pe_array_2_4_io_ipsum),
    .io_opsum(pe_array_2_4_io_opsum)
  );
  PE pe_array_2_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_5_clock),
    .reset(pe_array_2_5_reset),
    .io_compute_en(pe_array_2_5_io_compute_en),
    .io_read_en(pe_array_2_5_io_read_en),
    .io_compute_mode(pe_array_2_5_io_compute_mode),
    .io_ifmap_i(pe_array_2_5_io_ifmap_i),
    .io_ifmap_o(pe_array_2_5_io_ifmap_o),
    .io_weight_i(pe_array_2_5_io_weight_i),
    .io_weight_o(pe_array_2_5_io_weight_o),
    .io_ipsum(pe_array_2_5_io_ipsum),
    .io_opsum(pe_array_2_5_io_opsum)
  );
  PE pe_array_2_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_6_clock),
    .reset(pe_array_2_6_reset),
    .io_compute_en(pe_array_2_6_io_compute_en),
    .io_read_en(pe_array_2_6_io_read_en),
    .io_compute_mode(pe_array_2_6_io_compute_mode),
    .io_ifmap_i(pe_array_2_6_io_ifmap_i),
    .io_ifmap_o(pe_array_2_6_io_ifmap_o),
    .io_weight_i(pe_array_2_6_io_weight_i),
    .io_weight_o(pe_array_2_6_io_weight_o),
    .io_ipsum(pe_array_2_6_io_ipsum),
    .io_opsum(pe_array_2_6_io_opsum)
  );
  PE pe_array_2_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_2_7_clock),
    .reset(pe_array_2_7_reset),
    .io_compute_en(pe_array_2_7_io_compute_en),
    .io_read_en(pe_array_2_7_io_read_en),
    .io_compute_mode(pe_array_2_7_io_compute_mode),
    .io_ifmap_i(pe_array_2_7_io_ifmap_i),
    .io_ifmap_o(pe_array_2_7_io_ifmap_o),
    .io_weight_i(pe_array_2_7_io_weight_i),
    .io_weight_o(pe_array_2_7_io_weight_o),
    .io_ipsum(pe_array_2_7_io_ipsum),
    .io_opsum(pe_array_2_7_io_opsum)
  );
  PE pe_array_3_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_0_clock),
    .reset(pe_array_3_0_reset),
    .io_compute_en(pe_array_3_0_io_compute_en),
    .io_read_en(pe_array_3_0_io_read_en),
    .io_compute_mode(pe_array_3_0_io_compute_mode),
    .io_ifmap_i(pe_array_3_0_io_ifmap_i),
    .io_ifmap_o(pe_array_3_0_io_ifmap_o),
    .io_weight_i(pe_array_3_0_io_weight_i),
    .io_weight_o(pe_array_3_0_io_weight_o),
    .io_ipsum(pe_array_3_0_io_ipsum),
    .io_opsum(pe_array_3_0_io_opsum)
  );
  PE pe_array_3_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_1_clock),
    .reset(pe_array_3_1_reset),
    .io_compute_en(pe_array_3_1_io_compute_en),
    .io_read_en(pe_array_3_1_io_read_en),
    .io_compute_mode(pe_array_3_1_io_compute_mode),
    .io_ifmap_i(pe_array_3_1_io_ifmap_i),
    .io_ifmap_o(pe_array_3_1_io_ifmap_o),
    .io_weight_i(pe_array_3_1_io_weight_i),
    .io_weight_o(pe_array_3_1_io_weight_o),
    .io_ipsum(pe_array_3_1_io_ipsum),
    .io_opsum(pe_array_3_1_io_opsum)
  );
  PE pe_array_3_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_2_clock),
    .reset(pe_array_3_2_reset),
    .io_compute_en(pe_array_3_2_io_compute_en),
    .io_read_en(pe_array_3_2_io_read_en),
    .io_compute_mode(pe_array_3_2_io_compute_mode),
    .io_ifmap_i(pe_array_3_2_io_ifmap_i),
    .io_ifmap_o(pe_array_3_2_io_ifmap_o),
    .io_weight_i(pe_array_3_2_io_weight_i),
    .io_weight_o(pe_array_3_2_io_weight_o),
    .io_ipsum(pe_array_3_2_io_ipsum),
    .io_opsum(pe_array_3_2_io_opsum)
  );
  PE pe_array_3_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_3_clock),
    .reset(pe_array_3_3_reset),
    .io_compute_en(pe_array_3_3_io_compute_en),
    .io_read_en(pe_array_3_3_io_read_en),
    .io_compute_mode(pe_array_3_3_io_compute_mode),
    .io_ifmap_i(pe_array_3_3_io_ifmap_i),
    .io_ifmap_o(pe_array_3_3_io_ifmap_o),
    .io_weight_i(pe_array_3_3_io_weight_i),
    .io_weight_o(pe_array_3_3_io_weight_o),
    .io_ipsum(pe_array_3_3_io_ipsum),
    .io_opsum(pe_array_3_3_io_opsum)
  );
  PE pe_array_3_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_4_clock),
    .reset(pe_array_3_4_reset),
    .io_compute_en(pe_array_3_4_io_compute_en),
    .io_read_en(pe_array_3_4_io_read_en),
    .io_compute_mode(pe_array_3_4_io_compute_mode),
    .io_ifmap_i(pe_array_3_4_io_ifmap_i),
    .io_ifmap_o(pe_array_3_4_io_ifmap_o),
    .io_weight_i(pe_array_3_4_io_weight_i),
    .io_weight_o(pe_array_3_4_io_weight_o),
    .io_ipsum(pe_array_3_4_io_ipsum),
    .io_opsum(pe_array_3_4_io_opsum)
  );
  PE pe_array_3_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_5_clock),
    .reset(pe_array_3_5_reset),
    .io_compute_en(pe_array_3_5_io_compute_en),
    .io_read_en(pe_array_3_5_io_read_en),
    .io_compute_mode(pe_array_3_5_io_compute_mode),
    .io_ifmap_i(pe_array_3_5_io_ifmap_i),
    .io_ifmap_o(pe_array_3_5_io_ifmap_o),
    .io_weight_i(pe_array_3_5_io_weight_i),
    .io_weight_o(pe_array_3_5_io_weight_o),
    .io_ipsum(pe_array_3_5_io_ipsum),
    .io_opsum(pe_array_3_5_io_opsum)
  );
  PE pe_array_3_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_6_clock),
    .reset(pe_array_3_6_reset),
    .io_compute_en(pe_array_3_6_io_compute_en),
    .io_read_en(pe_array_3_6_io_read_en),
    .io_compute_mode(pe_array_3_6_io_compute_mode),
    .io_ifmap_i(pe_array_3_6_io_ifmap_i),
    .io_ifmap_o(pe_array_3_6_io_ifmap_o),
    .io_weight_i(pe_array_3_6_io_weight_i),
    .io_weight_o(pe_array_3_6_io_weight_o),
    .io_ipsum(pe_array_3_6_io_ipsum),
    .io_opsum(pe_array_3_6_io_opsum)
  );
  PE pe_array_3_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_3_7_clock),
    .reset(pe_array_3_7_reset),
    .io_compute_en(pe_array_3_7_io_compute_en),
    .io_read_en(pe_array_3_7_io_read_en),
    .io_compute_mode(pe_array_3_7_io_compute_mode),
    .io_ifmap_i(pe_array_3_7_io_ifmap_i),
    .io_ifmap_o(pe_array_3_7_io_ifmap_o),
    .io_weight_i(pe_array_3_7_io_weight_i),
    .io_weight_o(pe_array_3_7_io_weight_o),
    .io_ipsum(pe_array_3_7_io_ipsum),
    .io_opsum(pe_array_3_7_io_opsum)
  );
  PE pe_array_4_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_0_clock),
    .reset(pe_array_4_0_reset),
    .io_compute_en(pe_array_4_0_io_compute_en),
    .io_read_en(pe_array_4_0_io_read_en),
    .io_compute_mode(pe_array_4_0_io_compute_mode),
    .io_ifmap_i(pe_array_4_0_io_ifmap_i),
    .io_ifmap_o(pe_array_4_0_io_ifmap_o),
    .io_weight_i(pe_array_4_0_io_weight_i),
    .io_weight_o(pe_array_4_0_io_weight_o),
    .io_ipsum(pe_array_4_0_io_ipsum),
    .io_opsum(pe_array_4_0_io_opsum)
  );
  PE pe_array_4_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_1_clock),
    .reset(pe_array_4_1_reset),
    .io_compute_en(pe_array_4_1_io_compute_en),
    .io_read_en(pe_array_4_1_io_read_en),
    .io_compute_mode(pe_array_4_1_io_compute_mode),
    .io_ifmap_i(pe_array_4_1_io_ifmap_i),
    .io_ifmap_o(pe_array_4_1_io_ifmap_o),
    .io_weight_i(pe_array_4_1_io_weight_i),
    .io_weight_o(pe_array_4_1_io_weight_o),
    .io_ipsum(pe_array_4_1_io_ipsum),
    .io_opsum(pe_array_4_1_io_opsum)
  );
  PE pe_array_4_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_2_clock),
    .reset(pe_array_4_2_reset),
    .io_compute_en(pe_array_4_2_io_compute_en),
    .io_read_en(pe_array_4_2_io_read_en),
    .io_compute_mode(pe_array_4_2_io_compute_mode),
    .io_ifmap_i(pe_array_4_2_io_ifmap_i),
    .io_ifmap_o(pe_array_4_2_io_ifmap_o),
    .io_weight_i(pe_array_4_2_io_weight_i),
    .io_weight_o(pe_array_4_2_io_weight_o),
    .io_ipsum(pe_array_4_2_io_ipsum),
    .io_opsum(pe_array_4_2_io_opsum)
  );
  PE pe_array_4_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_3_clock),
    .reset(pe_array_4_3_reset),
    .io_compute_en(pe_array_4_3_io_compute_en),
    .io_read_en(pe_array_4_3_io_read_en),
    .io_compute_mode(pe_array_4_3_io_compute_mode),
    .io_ifmap_i(pe_array_4_3_io_ifmap_i),
    .io_ifmap_o(pe_array_4_3_io_ifmap_o),
    .io_weight_i(pe_array_4_3_io_weight_i),
    .io_weight_o(pe_array_4_3_io_weight_o),
    .io_ipsum(pe_array_4_3_io_ipsum),
    .io_opsum(pe_array_4_3_io_opsum)
  );
  PE pe_array_4_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_4_clock),
    .reset(pe_array_4_4_reset),
    .io_compute_en(pe_array_4_4_io_compute_en),
    .io_read_en(pe_array_4_4_io_read_en),
    .io_compute_mode(pe_array_4_4_io_compute_mode),
    .io_ifmap_i(pe_array_4_4_io_ifmap_i),
    .io_ifmap_o(pe_array_4_4_io_ifmap_o),
    .io_weight_i(pe_array_4_4_io_weight_i),
    .io_weight_o(pe_array_4_4_io_weight_o),
    .io_ipsum(pe_array_4_4_io_ipsum),
    .io_opsum(pe_array_4_4_io_opsum)
  );
  PE pe_array_4_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_5_clock),
    .reset(pe_array_4_5_reset),
    .io_compute_en(pe_array_4_5_io_compute_en),
    .io_read_en(pe_array_4_5_io_read_en),
    .io_compute_mode(pe_array_4_5_io_compute_mode),
    .io_ifmap_i(pe_array_4_5_io_ifmap_i),
    .io_ifmap_o(pe_array_4_5_io_ifmap_o),
    .io_weight_i(pe_array_4_5_io_weight_i),
    .io_weight_o(pe_array_4_5_io_weight_o),
    .io_ipsum(pe_array_4_5_io_ipsum),
    .io_opsum(pe_array_4_5_io_opsum)
  );
  PE pe_array_4_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_6_clock),
    .reset(pe_array_4_6_reset),
    .io_compute_en(pe_array_4_6_io_compute_en),
    .io_read_en(pe_array_4_6_io_read_en),
    .io_compute_mode(pe_array_4_6_io_compute_mode),
    .io_ifmap_i(pe_array_4_6_io_ifmap_i),
    .io_ifmap_o(pe_array_4_6_io_ifmap_o),
    .io_weight_i(pe_array_4_6_io_weight_i),
    .io_weight_o(pe_array_4_6_io_weight_o),
    .io_ipsum(pe_array_4_6_io_ipsum),
    .io_opsum(pe_array_4_6_io_opsum)
  );
  PE pe_array_4_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_4_7_clock),
    .reset(pe_array_4_7_reset),
    .io_compute_en(pe_array_4_7_io_compute_en),
    .io_read_en(pe_array_4_7_io_read_en),
    .io_compute_mode(pe_array_4_7_io_compute_mode),
    .io_ifmap_i(pe_array_4_7_io_ifmap_i),
    .io_ifmap_o(pe_array_4_7_io_ifmap_o),
    .io_weight_i(pe_array_4_7_io_weight_i),
    .io_weight_o(pe_array_4_7_io_weight_o),
    .io_ipsum(pe_array_4_7_io_ipsum),
    .io_opsum(pe_array_4_7_io_opsum)
  );
  PE pe_array_5_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_0_clock),
    .reset(pe_array_5_0_reset),
    .io_compute_en(pe_array_5_0_io_compute_en),
    .io_read_en(pe_array_5_0_io_read_en),
    .io_compute_mode(pe_array_5_0_io_compute_mode),
    .io_ifmap_i(pe_array_5_0_io_ifmap_i),
    .io_ifmap_o(pe_array_5_0_io_ifmap_o),
    .io_weight_i(pe_array_5_0_io_weight_i),
    .io_weight_o(pe_array_5_0_io_weight_o),
    .io_ipsum(pe_array_5_0_io_ipsum),
    .io_opsum(pe_array_5_0_io_opsum)
  );
  PE pe_array_5_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_1_clock),
    .reset(pe_array_5_1_reset),
    .io_compute_en(pe_array_5_1_io_compute_en),
    .io_read_en(pe_array_5_1_io_read_en),
    .io_compute_mode(pe_array_5_1_io_compute_mode),
    .io_ifmap_i(pe_array_5_1_io_ifmap_i),
    .io_ifmap_o(pe_array_5_1_io_ifmap_o),
    .io_weight_i(pe_array_5_1_io_weight_i),
    .io_weight_o(pe_array_5_1_io_weight_o),
    .io_ipsum(pe_array_5_1_io_ipsum),
    .io_opsum(pe_array_5_1_io_opsum)
  );
  PE pe_array_5_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_2_clock),
    .reset(pe_array_5_2_reset),
    .io_compute_en(pe_array_5_2_io_compute_en),
    .io_read_en(pe_array_5_2_io_read_en),
    .io_compute_mode(pe_array_5_2_io_compute_mode),
    .io_ifmap_i(pe_array_5_2_io_ifmap_i),
    .io_ifmap_o(pe_array_5_2_io_ifmap_o),
    .io_weight_i(pe_array_5_2_io_weight_i),
    .io_weight_o(pe_array_5_2_io_weight_o),
    .io_ipsum(pe_array_5_2_io_ipsum),
    .io_opsum(pe_array_5_2_io_opsum)
  );
  PE pe_array_5_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_3_clock),
    .reset(pe_array_5_3_reset),
    .io_compute_en(pe_array_5_3_io_compute_en),
    .io_read_en(pe_array_5_3_io_read_en),
    .io_compute_mode(pe_array_5_3_io_compute_mode),
    .io_ifmap_i(pe_array_5_3_io_ifmap_i),
    .io_ifmap_o(pe_array_5_3_io_ifmap_o),
    .io_weight_i(pe_array_5_3_io_weight_i),
    .io_weight_o(pe_array_5_3_io_weight_o),
    .io_ipsum(pe_array_5_3_io_ipsum),
    .io_opsum(pe_array_5_3_io_opsum)
  );
  PE pe_array_5_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_4_clock),
    .reset(pe_array_5_4_reset),
    .io_compute_en(pe_array_5_4_io_compute_en),
    .io_read_en(pe_array_5_4_io_read_en),
    .io_compute_mode(pe_array_5_4_io_compute_mode),
    .io_ifmap_i(pe_array_5_4_io_ifmap_i),
    .io_ifmap_o(pe_array_5_4_io_ifmap_o),
    .io_weight_i(pe_array_5_4_io_weight_i),
    .io_weight_o(pe_array_5_4_io_weight_o),
    .io_ipsum(pe_array_5_4_io_ipsum),
    .io_opsum(pe_array_5_4_io_opsum)
  );
  PE pe_array_5_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_5_clock),
    .reset(pe_array_5_5_reset),
    .io_compute_en(pe_array_5_5_io_compute_en),
    .io_read_en(pe_array_5_5_io_read_en),
    .io_compute_mode(pe_array_5_5_io_compute_mode),
    .io_ifmap_i(pe_array_5_5_io_ifmap_i),
    .io_ifmap_o(pe_array_5_5_io_ifmap_o),
    .io_weight_i(pe_array_5_5_io_weight_i),
    .io_weight_o(pe_array_5_5_io_weight_o),
    .io_ipsum(pe_array_5_5_io_ipsum),
    .io_opsum(pe_array_5_5_io_opsum)
  );
  PE pe_array_5_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_6_clock),
    .reset(pe_array_5_6_reset),
    .io_compute_en(pe_array_5_6_io_compute_en),
    .io_read_en(pe_array_5_6_io_read_en),
    .io_compute_mode(pe_array_5_6_io_compute_mode),
    .io_ifmap_i(pe_array_5_6_io_ifmap_i),
    .io_ifmap_o(pe_array_5_6_io_ifmap_o),
    .io_weight_i(pe_array_5_6_io_weight_i),
    .io_weight_o(pe_array_5_6_io_weight_o),
    .io_ipsum(pe_array_5_6_io_ipsum),
    .io_opsum(pe_array_5_6_io_opsum)
  );
  PE pe_array_5_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_5_7_clock),
    .reset(pe_array_5_7_reset),
    .io_compute_en(pe_array_5_7_io_compute_en),
    .io_read_en(pe_array_5_7_io_read_en),
    .io_compute_mode(pe_array_5_7_io_compute_mode),
    .io_ifmap_i(pe_array_5_7_io_ifmap_i),
    .io_ifmap_o(pe_array_5_7_io_ifmap_o),
    .io_weight_i(pe_array_5_7_io_weight_i),
    .io_weight_o(pe_array_5_7_io_weight_o),
    .io_ipsum(pe_array_5_7_io_ipsum),
    .io_opsum(pe_array_5_7_io_opsum)
  );
  PE pe_array_6_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_0_clock),
    .reset(pe_array_6_0_reset),
    .io_compute_en(pe_array_6_0_io_compute_en),
    .io_read_en(pe_array_6_0_io_read_en),
    .io_compute_mode(pe_array_6_0_io_compute_mode),
    .io_ifmap_i(pe_array_6_0_io_ifmap_i),
    .io_ifmap_o(pe_array_6_0_io_ifmap_o),
    .io_weight_i(pe_array_6_0_io_weight_i),
    .io_weight_o(pe_array_6_0_io_weight_o),
    .io_ipsum(pe_array_6_0_io_ipsum),
    .io_opsum(pe_array_6_0_io_opsum)
  );
  PE pe_array_6_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_1_clock),
    .reset(pe_array_6_1_reset),
    .io_compute_en(pe_array_6_1_io_compute_en),
    .io_read_en(pe_array_6_1_io_read_en),
    .io_compute_mode(pe_array_6_1_io_compute_mode),
    .io_ifmap_i(pe_array_6_1_io_ifmap_i),
    .io_ifmap_o(pe_array_6_1_io_ifmap_o),
    .io_weight_i(pe_array_6_1_io_weight_i),
    .io_weight_o(pe_array_6_1_io_weight_o),
    .io_ipsum(pe_array_6_1_io_ipsum),
    .io_opsum(pe_array_6_1_io_opsum)
  );
  PE pe_array_6_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_2_clock),
    .reset(pe_array_6_2_reset),
    .io_compute_en(pe_array_6_2_io_compute_en),
    .io_read_en(pe_array_6_2_io_read_en),
    .io_compute_mode(pe_array_6_2_io_compute_mode),
    .io_ifmap_i(pe_array_6_2_io_ifmap_i),
    .io_ifmap_o(pe_array_6_2_io_ifmap_o),
    .io_weight_i(pe_array_6_2_io_weight_i),
    .io_weight_o(pe_array_6_2_io_weight_o),
    .io_ipsum(pe_array_6_2_io_ipsum),
    .io_opsum(pe_array_6_2_io_opsum)
  );
  PE pe_array_6_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_3_clock),
    .reset(pe_array_6_3_reset),
    .io_compute_en(pe_array_6_3_io_compute_en),
    .io_read_en(pe_array_6_3_io_read_en),
    .io_compute_mode(pe_array_6_3_io_compute_mode),
    .io_ifmap_i(pe_array_6_3_io_ifmap_i),
    .io_ifmap_o(pe_array_6_3_io_ifmap_o),
    .io_weight_i(pe_array_6_3_io_weight_i),
    .io_weight_o(pe_array_6_3_io_weight_o),
    .io_ipsum(pe_array_6_3_io_ipsum),
    .io_opsum(pe_array_6_3_io_opsum)
  );
  PE pe_array_6_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_4_clock),
    .reset(pe_array_6_4_reset),
    .io_compute_en(pe_array_6_4_io_compute_en),
    .io_read_en(pe_array_6_4_io_read_en),
    .io_compute_mode(pe_array_6_4_io_compute_mode),
    .io_ifmap_i(pe_array_6_4_io_ifmap_i),
    .io_ifmap_o(pe_array_6_4_io_ifmap_o),
    .io_weight_i(pe_array_6_4_io_weight_i),
    .io_weight_o(pe_array_6_4_io_weight_o),
    .io_ipsum(pe_array_6_4_io_ipsum),
    .io_opsum(pe_array_6_4_io_opsum)
  );
  PE pe_array_6_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_5_clock),
    .reset(pe_array_6_5_reset),
    .io_compute_en(pe_array_6_5_io_compute_en),
    .io_read_en(pe_array_6_5_io_read_en),
    .io_compute_mode(pe_array_6_5_io_compute_mode),
    .io_ifmap_i(pe_array_6_5_io_ifmap_i),
    .io_ifmap_o(pe_array_6_5_io_ifmap_o),
    .io_weight_i(pe_array_6_5_io_weight_i),
    .io_weight_o(pe_array_6_5_io_weight_o),
    .io_ipsum(pe_array_6_5_io_ipsum),
    .io_opsum(pe_array_6_5_io_opsum)
  );
  PE pe_array_6_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_6_clock),
    .reset(pe_array_6_6_reset),
    .io_compute_en(pe_array_6_6_io_compute_en),
    .io_read_en(pe_array_6_6_io_read_en),
    .io_compute_mode(pe_array_6_6_io_compute_mode),
    .io_ifmap_i(pe_array_6_6_io_ifmap_i),
    .io_ifmap_o(pe_array_6_6_io_ifmap_o),
    .io_weight_i(pe_array_6_6_io_weight_i),
    .io_weight_o(pe_array_6_6_io_weight_o),
    .io_ipsum(pe_array_6_6_io_ipsum),
    .io_opsum(pe_array_6_6_io_opsum)
  );
  PE pe_array_6_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_6_7_clock),
    .reset(pe_array_6_7_reset),
    .io_compute_en(pe_array_6_7_io_compute_en),
    .io_read_en(pe_array_6_7_io_read_en),
    .io_compute_mode(pe_array_6_7_io_compute_mode),
    .io_ifmap_i(pe_array_6_7_io_ifmap_i),
    .io_ifmap_o(pe_array_6_7_io_ifmap_o),
    .io_weight_i(pe_array_6_7_io_weight_i),
    .io_weight_o(pe_array_6_7_io_weight_o),
    .io_ipsum(pe_array_6_7_io_ipsum),
    .io_opsum(pe_array_6_7_io_opsum)
  );
  PE pe_array_7_0 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_0_clock),
    .reset(pe_array_7_0_reset),
    .io_compute_en(pe_array_7_0_io_compute_en),
    .io_read_en(pe_array_7_0_io_read_en),
    .io_compute_mode(pe_array_7_0_io_compute_mode),
    .io_ifmap_i(pe_array_7_0_io_ifmap_i),
    .io_ifmap_o(pe_array_7_0_io_ifmap_o),
    .io_weight_i(pe_array_7_0_io_weight_i),
    .io_weight_o(pe_array_7_0_io_weight_o),
    .io_ipsum(pe_array_7_0_io_ipsum),
    .io_opsum(pe_array_7_0_io_opsum)
  );
  PE pe_array_7_1 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_1_clock),
    .reset(pe_array_7_1_reset),
    .io_compute_en(pe_array_7_1_io_compute_en),
    .io_read_en(pe_array_7_1_io_read_en),
    .io_compute_mode(pe_array_7_1_io_compute_mode),
    .io_ifmap_i(pe_array_7_1_io_ifmap_i),
    .io_ifmap_o(pe_array_7_1_io_ifmap_o),
    .io_weight_i(pe_array_7_1_io_weight_i),
    .io_weight_o(pe_array_7_1_io_weight_o),
    .io_ipsum(pe_array_7_1_io_ipsum),
    .io_opsum(pe_array_7_1_io_opsum)
  );
  PE pe_array_7_2 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_2_clock),
    .reset(pe_array_7_2_reset),
    .io_compute_en(pe_array_7_2_io_compute_en),
    .io_read_en(pe_array_7_2_io_read_en),
    .io_compute_mode(pe_array_7_2_io_compute_mode),
    .io_ifmap_i(pe_array_7_2_io_ifmap_i),
    .io_ifmap_o(pe_array_7_2_io_ifmap_o),
    .io_weight_i(pe_array_7_2_io_weight_i),
    .io_weight_o(pe_array_7_2_io_weight_o),
    .io_ipsum(pe_array_7_2_io_ipsum),
    .io_opsum(pe_array_7_2_io_opsum)
  );
  PE pe_array_7_3 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_3_clock),
    .reset(pe_array_7_3_reset),
    .io_compute_en(pe_array_7_3_io_compute_en),
    .io_read_en(pe_array_7_3_io_read_en),
    .io_compute_mode(pe_array_7_3_io_compute_mode),
    .io_ifmap_i(pe_array_7_3_io_ifmap_i),
    .io_ifmap_o(pe_array_7_3_io_ifmap_o),
    .io_weight_i(pe_array_7_3_io_weight_i),
    .io_weight_o(pe_array_7_3_io_weight_o),
    .io_ipsum(pe_array_7_3_io_ipsum),
    .io_opsum(pe_array_7_3_io_opsum)
  );
  PE pe_array_7_4 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_4_clock),
    .reset(pe_array_7_4_reset),
    .io_compute_en(pe_array_7_4_io_compute_en),
    .io_read_en(pe_array_7_4_io_read_en),
    .io_compute_mode(pe_array_7_4_io_compute_mode),
    .io_ifmap_i(pe_array_7_4_io_ifmap_i),
    .io_ifmap_o(pe_array_7_4_io_ifmap_o),
    .io_weight_i(pe_array_7_4_io_weight_i),
    .io_weight_o(pe_array_7_4_io_weight_o),
    .io_ipsum(pe_array_7_4_io_ipsum),
    .io_opsum(pe_array_7_4_io_opsum)
  );
  PE pe_array_7_5 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_5_clock),
    .reset(pe_array_7_5_reset),
    .io_compute_en(pe_array_7_5_io_compute_en),
    .io_read_en(pe_array_7_5_io_read_en),
    .io_compute_mode(pe_array_7_5_io_compute_mode),
    .io_ifmap_i(pe_array_7_5_io_ifmap_i),
    .io_ifmap_o(pe_array_7_5_io_ifmap_o),
    .io_weight_i(pe_array_7_5_io_weight_i),
    .io_weight_o(pe_array_7_5_io_weight_o),
    .io_ipsum(pe_array_7_5_io_ipsum),
    .io_opsum(pe_array_7_5_io_opsum)
  );
  PE pe_array_7_6 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_6_clock),
    .reset(pe_array_7_6_reset),
    .io_compute_en(pe_array_7_6_io_compute_en),
    .io_read_en(pe_array_7_6_io_read_en),
    .io_compute_mode(pe_array_7_6_io_compute_mode),
    .io_ifmap_i(pe_array_7_6_io_ifmap_i),
    .io_ifmap_o(pe_array_7_6_io_ifmap_o),
    .io_weight_i(pe_array_7_6_io_weight_i),
    .io_weight_o(pe_array_7_6_io_weight_o),
    .io_ipsum(pe_array_7_6_io_ipsum),
    .io_opsum(pe_array_7_6_io_opsum)
  );
  PE pe_array_7_7 ( // @[Systolic_array.scala 16:47]
    .clock(pe_array_7_7_clock),
    .reset(pe_array_7_7_reset),
    .io_compute_en(pe_array_7_7_io_compute_en),
    .io_read_en(pe_array_7_7_io_read_en),
    .io_compute_mode(pe_array_7_7_io_compute_mode),
    .io_ifmap_i(pe_array_7_7_io_ifmap_i),
    .io_ifmap_o(pe_array_7_7_io_ifmap_o),
    .io_weight_i(pe_array_7_7_io_weight_i),
    .io_weight_o(pe_array_7_7_io_weight_o),
    .io_ipsum(pe_array_7_7_io_ipsum),
    .io_opsum(pe_array_7_7_io_opsum)
  );
  assign io_opsum = {io_opsum_hi,io_opsum_lo}; // @[Systolic_array.scala 41:28]
  assign pe_array_0_0_clock = clock;
  assign pe_array_0_0_reset = reset;
  assign pe_array_0_0_io_compute_en = io_compute_en[0]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_0_io_read_en = io_read_en[0]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_0_io_compute_mode = io_compute_mode[0]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_0_io_ifmap_i = {_pe_array_0_0_io_ifmap_i_T_1,io_ifmap[6:0]}; // @[Systolic_array.scala 27:97]
  assign pe_array_0_0_io_weight_i = io_weight[7:0]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_0_io_ipsum = io_ipsum[31:0]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_1_clock = clock;
  assign pe_array_0_1_reset = reset;
  assign pe_array_0_1_io_compute_en = io_compute_en[1]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_1_io_read_en = io_read_en[1]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_1_io_compute_mode = io_compute_mode[1]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_1_io_ifmap_i = pe_array_0_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_1_io_weight_i = io_weight[15:8]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_1_io_ipsum = io_ipsum[63:32]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_2_clock = clock;
  assign pe_array_0_2_reset = reset;
  assign pe_array_0_2_io_compute_en = io_compute_en[2]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_2_io_read_en = io_read_en[2]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_2_io_compute_mode = io_compute_mode[2]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_2_io_ifmap_i = pe_array_0_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_2_io_weight_i = io_weight[23:16]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_2_io_ipsum = io_ipsum[95:64]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_3_clock = clock;
  assign pe_array_0_3_reset = reset;
  assign pe_array_0_3_io_compute_en = io_compute_en[3]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_3_io_read_en = io_read_en[3]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_3_io_compute_mode = io_compute_mode[3]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_3_io_ifmap_i = pe_array_0_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_3_io_weight_i = io_weight[31:24]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_3_io_ipsum = io_ipsum[127:96]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_4_clock = clock;
  assign pe_array_0_4_reset = reset;
  assign pe_array_0_4_io_compute_en = io_compute_en[4]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_4_io_read_en = io_read_en[4]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_4_io_compute_mode = io_compute_mode[4]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_4_io_ifmap_i = pe_array_0_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_4_io_weight_i = io_weight[39:32]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_4_io_ipsum = io_ipsum[159:128]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_5_clock = clock;
  assign pe_array_0_5_reset = reset;
  assign pe_array_0_5_io_compute_en = io_compute_en[5]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_5_io_read_en = io_read_en[5]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_5_io_compute_mode = io_compute_mode[5]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_5_io_ifmap_i = pe_array_0_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_5_io_weight_i = io_weight[47:40]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_5_io_ipsum = io_ipsum[191:160]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_6_clock = clock;
  assign pe_array_0_6_reset = reset;
  assign pe_array_0_6_io_compute_en = io_compute_en[6]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_6_io_read_en = io_read_en[6]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_6_io_compute_mode = io_compute_mode[6]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_6_io_ifmap_i = pe_array_0_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_6_io_weight_i = io_weight[55:48]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_6_io_ipsum = io_ipsum[223:192]; // @[Systolic_array.scala 36:71]
  assign pe_array_0_7_clock = clock;
  assign pe_array_0_7_reset = reset;
  assign pe_array_0_7_io_compute_en = io_compute_en[7]; // @[Systolic_array.scala 23:58]
  assign pe_array_0_7_io_read_en = io_read_en[7]; // @[Systolic_array.scala 24:52]
  assign pe_array_0_7_io_compute_mode = io_compute_mode[7]; // @[Systolic_array.scala 25:62]
  assign pe_array_0_7_io_ifmap_i = pe_array_0_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_0_7_io_weight_i = io_weight[63:56]; // @[Systolic_array.scala 32:73]
  assign pe_array_0_7_io_ipsum = io_ipsum[255:224]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_0_clock = clock;
  assign pe_array_1_0_reset = reset;
  assign pe_array_1_0_io_compute_en = io_compute_en[8]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_0_io_read_en = io_read_en[8]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_0_io_compute_mode = io_compute_mode[8]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_0_io_ifmap_i = {_pe_array_1_0_io_ifmap_i_T_1,io_ifmap[14:8]}; // @[Systolic_array.scala 27:97]
  assign pe_array_1_0_io_weight_i = pe_array_0_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_0_io_ipsum = io_ipsum[287:256]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_1_clock = clock;
  assign pe_array_1_1_reset = reset;
  assign pe_array_1_1_io_compute_en = io_compute_en[9]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_1_io_read_en = io_read_en[9]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_1_io_compute_mode = io_compute_mode[9]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_1_io_ifmap_i = pe_array_1_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_1_io_weight_i = pe_array_0_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_1_io_ipsum = io_ipsum[319:288]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_2_clock = clock;
  assign pe_array_1_2_reset = reset;
  assign pe_array_1_2_io_compute_en = io_compute_en[10]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_2_io_read_en = io_read_en[10]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_2_io_compute_mode = io_compute_mode[10]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_2_io_ifmap_i = pe_array_1_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_2_io_weight_i = pe_array_0_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_2_io_ipsum = io_ipsum[351:320]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_3_clock = clock;
  assign pe_array_1_3_reset = reset;
  assign pe_array_1_3_io_compute_en = io_compute_en[11]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_3_io_read_en = io_read_en[11]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_3_io_compute_mode = io_compute_mode[11]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_3_io_ifmap_i = pe_array_1_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_3_io_weight_i = pe_array_0_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_3_io_ipsum = io_ipsum[383:352]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_4_clock = clock;
  assign pe_array_1_4_reset = reset;
  assign pe_array_1_4_io_compute_en = io_compute_en[12]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_4_io_read_en = io_read_en[12]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_4_io_compute_mode = io_compute_mode[12]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_4_io_ifmap_i = pe_array_1_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_4_io_weight_i = pe_array_0_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_4_io_ipsum = io_ipsum[415:384]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_5_clock = clock;
  assign pe_array_1_5_reset = reset;
  assign pe_array_1_5_io_compute_en = io_compute_en[13]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_5_io_read_en = io_read_en[13]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_5_io_compute_mode = io_compute_mode[13]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_5_io_ifmap_i = pe_array_1_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_5_io_weight_i = pe_array_0_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_5_io_ipsum = io_ipsum[447:416]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_6_clock = clock;
  assign pe_array_1_6_reset = reset;
  assign pe_array_1_6_io_compute_en = io_compute_en[14]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_6_io_read_en = io_read_en[14]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_6_io_compute_mode = io_compute_mode[14]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_6_io_ifmap_i = pe_array_1_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_6_io_weight_i = pe_array_0_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_6_io_ipsum = io_ipsum[479:448]; // @[Systolic_array.scala 36:71]
  assign pe_array_1_7_clock = clock;
  assign pe_array_1_7_reset = reset;
  assign pe_array_1_7_io_compute_en = io_compute_en[15]; // @[Systolic_array.scala 23:58]
  assign pe_array_1_7_io_read_en = io_read_en[15]; // @[Systolic_array.scala 24:52]
  assign pe_array_1_7_io_compute_mode = io_compute_mode[15]; // @[Systolic_array.scala 25:62]
  assign pe_array_1_7_io_ifmap_i = pe_array_1_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_1_7_io_weight_i = pe_array_0_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_1_7_io_ipsum = io_ipsum[511:480]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_0_clock = clock;
  assign pe_array_2_0_reset = reset;
  assign pe_array_2_0_io_compute_en = io_compute_en[16]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_0_io_read_en = io_read_en[16]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_0_io_compute_mode = io_compute_mode[16]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_0_io_ifmap_i = {_pe_array_2_0_io_ifmap_i_T_1,io_ifmap[22:16]}; // @[Systolic_array.scala 27:97]
  assign pe_array_2_0_io_weight_i = pe_array_1_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_0_io_ipsum = io_ipsum[543:512]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_1_clock = clock;
  assign pe_array_2_1_reset = reset;
  assign pe_array_2_1_io_compute_en = io_compute_en[17]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_1_io_read_en = io_read_en[17]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_1_io_compute_mode = io_compute_mode[17]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_1_io_ifmap_i = pe_array_2_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_1_io_weight_i = pe_array_1_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_1_io_ipsum = io_ipsum[575:544]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_2_clock = clock;
  assign pe_array_2_2_reset = reset;
  assign pe_array_2_2_io_compute_en = io_compute_en[18]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_2_io_read_en = io_read_en[18]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_2_io_compute_mode = io_compute_mode[18]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_2_io_ifmap_i = pe_array_2_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_2_io_weight_i = pe_array_1_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_2_io_ipsum = io_ipsum[607:576]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_3_clock = clock;
  assign pe_array_2_3_reset = reset;
  assign pe_array_2_3_io_compute_en = io_compute_en[19]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_3_io_read_en = io_read_en[19]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_3_io_compute_mode = io_compute_mode[19]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_3_io_ifmap_i = pe_array_2_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_3_io_weight_i = pe_array_1_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_3_io_ipsum = io_ipsum[639:608]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_4_clock = clock;
  assign pe_array_2_4_reset = reset;
  assign pe_array_2_4_io_compute_en = io_compute_en[20]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_4_io_read_en = io_read_en[20]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_4_io_compute_mode = io_compute_mode[20]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_4_io_ifmap_i = pe_array_2_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_4_io_weight_i = pe_array_1_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_4_io_ipsum = io_ipsum[671:640]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_5_clock = clock;
  assign pe_array_2_5_reset = reset;
  assign pe_array_2_5_io_compute_en = io_compute_en[21]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_5_io_read_en = io_read_en[21]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_5_io_compute_mode = io_compute_mode[21]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_5_io_ifmap_i = pe_array_2_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_5_io_weight_i = pe_array_1_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_5_io_ipsum = io_ipsum[703:672]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_6_clock = clock;
  assign pe_array_2_6_reset = reset;
  assign pe_array_2_6_io_compute_en = io_compute_en[22]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_6_io_read_en = io_read_en[22]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_6_io_compute_mode = io_compute_mode[22]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_6_io_ifmap_i = pe_array_2_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_6_io_weight_i = pe_array_1_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_6_io_ipsum = io_ipsum[735:704]; // @[Systolic_array.scala 36:71]
  assign pe_array_2_7_clock = clock;
  assign pe_array_2_7_reset = reset;
  assign pe_array_2_7_io_compute_en = io_compute_en[23]; // @[Systolic_array.scala 23:58]
  assign pe_array_2_7_io_read_en = io_read_en[23]; // @[Systolic_array.scala 24:52]
  assign pe_array_2_7_io_compute_mode = io_compute_mode[23]; // @[Systolic_array.scala 25:62]
  assign pe_array_2_7_io_ifmap_i = pe_array_2_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_2_7_io_weight_i = pe_array_1_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_2_7_io_ipsum = io_ipsum[767:736]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_0_clock = clock;
  assign pe_array_3_0_reset = reset;
  assign pe_array_3_0_io_compute_en = io_compute_en[24]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_0_io_read_en = io_read_en[24]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_0_io_compute_mode = io_compute_mode[24]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_0_io_ifmap_i = {_pe_array_3_0_io_ifmap_i_T_1,io_ifmap[30:24]}; // @[Systolic_array.scala 27:97]
  assign pe_array_3_0_io_weight_i = pe_array_2_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_0_io_ipsum = io_ipsum[799:768]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_1_clock = clock;
  assign pe_array_3_1_reset = reset;
  assign pe_array_3_1_io_compute_en = io_compute_en[25]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_1_io_read_en = io_read_en[25]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_1_io_compute_mode = io_compute_mode[25]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_1_io_ifmap_i = pe_array_3_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_1_io_weight_i = pe_array_2_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_1_io_ipsum = io_ipsum[831:800]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_2_clock = clock;
  assign pe_array_3_2_reset = reset;
  assign pe_array_3_2_io_compute_en = io_compute_en[26]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_2_io_read_en = io_read_en[26]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_2_io_compute_mode = io_compute_mode[26]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_2_io_ifmap_i = pe_array_3_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_2_io_weight_i = pe_array_2_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_2_io_ipsum = io_ipsum[863:832]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_3_clock = clock;
  assign pe_array_3_3_reset = reset;
  assign pe_array_3_3_io_compute_en = io_compute_en[27]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_3_io_read_en = io_read_en[27]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_3_io_compute_mode = io_compute_mode[27]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_3_io_ifmap_i = pe_array_3_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_3_io_weight_i = pe_array_2_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_3_io_ipsum = io_ipsum[895:864]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_4_clock = clock;
  assign pe_array_3_4_reset = reset;
  assign pe_array_3_4_io_compute_en = io_compute_en[28]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_4_io_read_en = io_read_en[28]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_4_io_compute_mode = io_compute_mode[28]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_4_io_ifmap_i = pe_array_3_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_4_io_weight_i = pe_array_2_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_4_io_ipsum = io_ipsum[927:896]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_5_clock = clock;
  assign pe_array_3_5_reset = reset;
  assign pe_array_3_5_io_compute_en = io_compute_en[29]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_5_io_read_en = io_read_en[29]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_5_io_compute_mode = io_compute_mode[29]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_5_io_ifmap_i = pe_array_3_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_5_io_weight_i = pe_array_2_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_5_io_ipsum = io_ipsum[959:928]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_6_clock = clock;
  assign pe_array_3_6_reset = reset;
  assign pe_array_3_6_io_compute_en = io_compute_en[30]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_6_io_read_en = io_read_en[30]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_6_io_compute_mode = io_compute_mode[30]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_6_io_ifmap_i = pe_array_3_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_6_io_weight_i = pe_array_2_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_6_io_ipsum = io_ipsum[991:960]; // @[Systolic_array.scala 36:71]
  assign pe_array_3_7_clock = clock;
  assign pe_array_3_7_reset = reset;
  assign pe_array_3_7_io_compute_en = io_compute_en[31]; // @[Systolic_array.scala 23:58]
  assign pe_array_3_7_io_read_en = io_read_en[31]; // @[Systolic_array.scala 24:52]
  assign pe_array_3_7_io_compute_mode = io_compute_mode[31]; // @[Systolic_array.scala 25:62]
  assign pe_array_3_7_io_ifmap_i = pe_array_3_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_3_7_io_weight_i = pe_array_2_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_3_7_io_ipsum = io_ipsum[1023:992]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_0_clock = clock;
  assign pe_array_4_0_reset = reset;
  assign pe_array_4_0_io_compute_en = io_compute_en[32]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_0_io_read_en = io_read_en[32]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_0_io_compute_mode = io_compute_mode[32]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_0_io_ifmap_i = {_pe_array_4_0_io_ifmap_i_T_1,io_ifmap[38:32]}; // @[Systolic_array.scala 27:97]
  assign pe_array_4_0_io_weight_i = pe_array_3_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_0_io_ipsum = io_ipsum[1055:1024]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_1_clock = clock;
  assign pe_array_4_1_reset = reset;
  assign pe_array_4_1_io_compute_en = io_compute_en[33]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_1_io_read_en = io_read_en[33]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_1_io_compute_mode = io_compute_mode[33]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_1_io_ifmap_i = pe_array_4_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_1_io_weight_i = pe_array_3_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_1_io_ipsum = io_ipsum[1087:1056]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_2_clock = clock;
  assign pe_array_4_2_reset = reset;
  assign pe_array_4_2_io_compute_en = io_compute_en[34]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_2_io_read_en = io_read_en[34]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_2_io_compute_mode = io_compute_mode[34]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_2_io_ifmap_i = pe_array_4_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_2_io_weight_i = pe_array_3_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_2_io_ipsum = io_ipsum[1119:1088]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_3_clock = clock;
  assign pe_array_4_3_reset = reset;
  assign pe_array_4_3_io_compute_en = io_compute_en[35]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_3_io_read_en = io_read_en[35]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_3_io_compute_mode = io_compute_mode[35]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_3_io_ifmap_i = pe_array_4_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_3_io_weight_i = pe_array_3_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_3_io_ipsum = io_ipsum[1151:1120]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_4_clock = clock;
  assign pe_array_4_4_reset = reset;
  assign pe_array_4_4_io_compute_en = io_compute_en[36]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_4_io_read_en = io_read_en[36]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_4_io_compute_mode = io_compute_mode[36]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_4_io_ifmap_i = pe_array_4_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_4_io_weight_i = pe_array_3_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_4_io_ipsum = io_ipsum[1183:1152]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_5_clock = clock;
  assign pe_array_4_5_reset = reset;
  assign pe_array_4_5_io_compute_en = io_compute_en[37]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_5_io_read_en = io_read_en[37]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_5_io_compute_mode = io_compute_mode[37]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_5_io_ifmap_i = pe_array_4_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_5_io_weight_i = pe_array_3_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_5_io_ipsum = io_ipsum[1215:1184]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_6_clock = clock;
  assign pe_array_4_6_reset = reset;
  assign pe_array_4_6_io_compute_en = io_compute_en[38]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_6_io_read_en = io_read_en[38]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_6_io_compute_mode = io_compute_mode[38]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_6_io_ifmap_i = pe_array_4_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_6_io_weight_i = pe_array_3_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_6_io_ipsum = io_ipsum[1247:1216]; // @[Systolic_array.scala 36:71]
  assign pe_array_4_7_clock = clock;
  assign pe_array_4_7_reset = reset;
  assign pe_array_4_7_io_compute_en = io_compute_en[39]; // @[Systolic_array.scala 23:58]
  assign pe_array_4_7_io_read_en = io_read_en[39]; // @[Systolic_array.scala 24:52]
  assign pe_array_4_7_io_compute_mode = io_compute_mode[39]; // @[Systolic_array.scala 25:62]
  assign pe_array_4_7_io_ifmap_i = pe_array_4_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_4_7_io_weight_i = pe_array_3_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_4_7_io_ipsum = io_ipsum[1279:1248]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_0_clock = clock;
  assign pe_array_5_0_reset = reset;
  assign pe_array_5_0_io_compute_en = io_compute_en[40]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_0_io_read_en = io_read_en[40]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_0_io_compute_mode = io_compute_mode[40]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_0_io_ifmap_i = {_pe_array_5_0_io_ifmap_i_T_1,io_ifmap[46:40]}; // @[Systolic_array.scala 27:97]
  assign pe_array_5_0_io_weight_i = pe_array_4_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_0_io_ipsum = io_ipsum[1311:1280]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_1_clock = clock;
  assign pe_array_5_1_reset = reset;
  assign pe_array_5_1_io_compute_en = io_compute_en[41]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_1_io_read_en = io_read_en[41]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_1_io_compute_mode = io_compute_mode[41]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_1_io_ifmap_i = pe_array_5_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_1_io_weight_i = pe_array_4_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_1_io_ipsum = io_ipsum[1343:1312]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_2_clock = clock;
  assign pe_array_5_2_reset = reset;
  assign pe_array_5_2_io_compute_en = io_compute_en[42]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_2_io_read_en = io_read_en[42]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_2_io_compute_mode = io_compute_mode[42]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_2_io_ifmap_i = pe_array_5_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_2_io_weight_i = pe_array_4_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_2_io_ipsum = io_ipsum[1375:1344]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_3_clock = clock;
  assign pe_array_5_3_reset = reset;
  assign pe_array_5_3_io_compute_en = io_compute_en[43]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_3_io_read_en = io_read_en[43]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_3_io_compute_mode = io_compute_mode[43]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_3_io_ifmap_i = pe_array_5_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_3_io_weight_i = pe_array_4_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_3_io_ipsum = io_ipsum[1407:1376]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_4_clock = clock;
  assign pe_array_5_4_reset = reset;
  assign pe_array_5_4_io_compute_en = io_compute_en[44]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_4_io_read_en = io_read_en[44]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_4_io_compute_mode = io_compute_mode[44]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_4_io_ifmap_i = pe_array_5_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_4_io_weight_i = pe_array_4_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_4_io_ipsum = io_ipsum[1439:1408]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_5_clock = clock;
  assign pe_array_5_5_reset = reset;
  assign pe_array_5_5_io_compute_en = io_compute_en[45]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_5_io_read_en = io_read_en[45]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_5_io_compute_mode = io_compute_mode[45]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_5_io_ifmap_i = pe_array_5_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_5_io_weight_i = pe_array_4_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_5_io_ipsum = io_ipsum[1471:1440]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_6_clock = clock;
  assign pe_array_5_6_reset = reset;
  assign pe_array_5_6_io_compute_en = io_compute_en[46]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_6_io_read_en = io_read_en[46]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_6_io_compute_mode = io_compute_mode[46]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_6_io_ifmap_i = pe_array_5_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_6_io_weight_i = pe_array_4_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_6_io_ipsum = io_ipsum[1503:1472]; // @[Systolic_array.scala 36:71]
  assign pe_array_5_7_clock = clock;
  assign pe_array_5_7_reset = reset;
  assign pe_array_5_7_io_compute_en = io_compute_en[47]; // @[Systolic_array.scala 23:58]
  assign pe_array_5_7_io_read_en = io_read_en[47]; // @[Systolic_array.scala 24:52]
  assign pe_array_5_7_io_compute_mode = io_compute_mode[47]; // @[Systolic_array.scala 25:62]
  assign pe_array_5_7_io_ifmap_i = pe_array_5_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_5_7_io_weight_i = pe_array_4_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_5_7_io_ipsum = io_ipsum[1535:1504]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_0_clock = clock;
  assign pe_array_6_0_reset = reset;
  assign pe_array_6_0_io_compute_en = io_compute_en[48]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_0_io_read_en = io_read_en[48]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_0_io_compute_mode = io_compute_mode[48]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_0_io_ifmap_i = {_pe_array_6_0_io_ifmap_i_T_1,io_ifmap[54:48]}; // @[Systolic_array.scala 27:97]
  assign pe_array_6_0_io_weight_i = pe_array_5_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_0_io_ipsum = io_ipsum[1567:1536]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_1_clock = clock;
  assign pe_array_6_1_reset = reset;
  assign pe_array_6_1_io_compute_en = io_compute_en[49]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_1_io_read_en = io_read_en[49]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_1_io_compute_mode = io_compute_mode[49]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_1_io_ifmap_i = pe_array_6_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_1_io_weight_i = pe_array_5_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_1_io_ipsum = io_ipsum[1599:1568]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_2_clock = clock;
  assign pe_array_6_2_reset = reset;
  assign pe_array_6_2_io_compute_en = io_compute_en[50]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_2_io_read_en = io_read_en[50]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_2_io_compute_mode = io_compute_mode[50]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_2_io_ifmap_i = pe_array_6_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_2_io_weight_i = pe_array_5_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_2_io_ipsum = io_ipsum[1631:1600]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_3_clock = clock;
  assign pe_array_6_3_reset = reset;
  assign pe_array_6_3_io_compute_en = io_compute_en[51]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_3_io_read_en = io_read_en[51]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_3_io_compute_mode = io_compute_mode[51]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_3_io_ifmap_i = pe_array_6_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_3_io_weight_i = pe_array_5_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_3_io_ipsum = io_ipsum[1663:1632]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_4_clock = clock;
  assign pe_array_6_4_reset = reset;
  assign pe_array_6_4_io_compute_en = io_compute_en[52]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_4_io_read_en = io_read_en[52]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_4_io_compute_mode = io_compute_mode[52]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_4_io_ifmap_i = pe_array_6_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_4_io_weight_i = pe_array_5_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_4_io_ipsum = io_ipsum[1695:1664]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_5_clock = clock;
  assign pe_array_6_5_reset = reset;
  assign pe_array_6_5_io_compute_en = io_compute_en[53]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_5_io_read_en = io_read_en[53]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_5_io_compute_mode = io_compute_mode[53]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_5_io_ifmap_i = pe_array_6_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_5_io_weight_i = pe_array_5_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_5_io_ipsum = io_ipsum[1727:1696]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_6_clock = clock;
  assign pe_array_6_6_reset = reset;
  assign pe_array_6_6_io_compute_en = io_compute_en[54]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_6_io_read_en = io_read_en[54]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_6_io_compute_mode = io_compute_mode[54]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_6_io_ifmap_i = pe_array_6_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_6_io_weight_i = pe_array_5_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_6_io_ipsum = io_ipsum[1759:1728]; // @[Systolic_array.scala 36:71]
  assign pe_array_6_7_clock = clock;
  assign pe_array_6_7_reset = reset;
  assign pe_array_6_7_io_compute_en = io_compute_en[55]; // @[Systolic_array.scala 23:58]
  assign pe_array_6_7_io_read_en = io_read_en[55]; // @[Systolic_array.scala 24:52]
  assign pe_array_6_7_io_compute_mode = io_compute_mode[55]; // @[Systolic_array.scala 25:62]
  assign pe_array_6_7_io_ifmap_i = pe_array_6_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_6_7_io_weight_i = pe_array_5_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_6_7_io_ipsum = io_ipsum[1791:1760]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_0_clock = clock;
  assign pe_array_7_0_reset = reset;
  assign pe_array_7_0_io_compute_en = io_compute_en[56]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_0_io_read_en = io_read_en[56]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_0_io_compute_mode = io_compute_mode[56]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_0_io_ifmap_i = {_pe_array_7_0_io_ifmap_i_T_1,io_ifmap[62:56]}; // @[Systolic_array.scala 27:97]
  assign pe_array_7_0_io_weight_i = pe_array_6_0_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_0_io_ipsum = io_ipsum[1823:1792]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_1_clock = clock;
  assign pe_array_7_1_reset = reset;
  assign pe_array_7_1_io_compute_en = io_compute_en[57]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_1_io_read_en = io_read_en[57]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_1_io_compute_mode = io_compute_mode[57]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_1_io_ifmap_i = pe_array_7_0_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_1_io_weight_i = pe_array_6_1_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_1_io_ipsum = io_ipsum[1855:1824]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_2_clock = clock;
  assign pe_array_7_2_reset = reset;
  assign pe_array_7_2_io_compute_en = io_compute_en[58]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_2_io_read_en = io_read_en[58]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_2_io_compute_mode = io_compute_mode[58]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_2_io_ifmap_i = pe_array_7_1_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_2_io_weight_i = pe_array_6_2_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_2_io_ipsum = io_ipsum[1887:1856]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_3_clock = clock;
  assign pe_array_7_3_reset = reset;
  assign pe_array_7_3_io_compute_en = io_compute_en[59]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_3_io_read_en = io_read_en[59]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_3_io_compute_mode = io_compute_mode[59]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_3_io_ifmap_i = pe_array_7_2_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_3_io_weight_i = pe_array_6_3_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_3_io_ipsum = io_ipsum[1919:1888]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_4_clock = clock;
  assign pe_array_7_4_reset = reset;
  assign pe_array_7_4_io_compute_en = io_compute_en[60]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_4_io_read_en = io_read_en[60]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_4_io_compute_mode = io_compute_mode[60]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_4_io_ifmap_i = pe_array_7_3_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_4_io_weight_i = pe_array_6_4_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_4_io_ipsum = io_ipsum[1951:1920]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_5_clock = clock;
  assign pe_array_7_5_reset = reset;
  assign pe_array_7_5_io_compute_en = io_compute_en[61]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_5_io_read_en = io_read_en[61]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_5_io_compute_mode = io_compute_mode[61]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_5_io_ifmap_i = pe_array_7_4_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_5_io_weight_i = pe_array_6_5_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_5_io_ipsum = io_ipsum[1983:1952]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_6_clock = clock;
  assign pe_array_7_6_reset = reset;
  assign pe_array_7_6_io_compute_en = io_compute_en[62]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_6_io_read_en = io_read_en[62]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_6_io_compute_mode = io_compute_mode[62]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_6_io_ifmap_i = pe_array_7_5_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_6_io_weight_i = pe_array_6_6_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_6_io_ipsum = io_ipsum[2015:1984]; // @[Systolic_array.scala 36:71]
  assign pe_array_7_7_clock = clock;
  assign pe_array_7_7_reset = reset;
  assign pe_array_7_7_io_compute_en = io_compute_en[63]; // @[Systolic_array.scala 23:58]
  assign pe_array_7_7_io_read_en = io_read_en[63]; // @[Systolic_array.scala 24:52]
  assign pe_array_7_7_io_compute_mode = io_compute_mode[63]; // @[Systolic_array.scala 25:62]
  assign pe_array_7_7_io_ifmap_i = pe_array_7_6_io_ifmap_o; // @[Systolic_array.scala 29:43]
  assign pe_array_7_7_io_weight_i = pe_array_6_7_io_weight_o; // @[Systolic_array.scala 34:44]
  assign pe_array_7_7_io_ipsum = io_ipsum[2047:2016]; // @[Systolic_array.scala 36:71]
endmodule
