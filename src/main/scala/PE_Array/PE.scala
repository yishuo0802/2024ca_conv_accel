import chisel3._
import chisel3.util._

// Define parameters for ADD and MUL operations
object OperationMode {
  val ADD = 0.U(1.W)
  val MUL = 1.U(1.W)
}


// Define the PE Accumulator module
class PE extends Module {
  val io = IO(new Bundle {
    val clk = Input(Clock())
    val reset = Input(Bool())
    val compute_en = Input(Bool())
    val read_en = Input(Bool())
    val compute_mode = Input(Bool())
    val ifmap_i = Input(SInt(8.W))
    val ifmap_o = Output(SInt(8.W))
    val weight_i = Input(SInt(8.W))
    val weight_o = Output(SInt(8.W))
    val ipsum = Input(SInt(32.W))
    val opsum = Output(SInt(32.W))
  })

  val ifmap = RegInit(0.S(8.W))
  val weight = RegInit(0.S(8.W))
  val psum = RegInit(0.S(32.W))

  when (io.reset) {
    psum := 0.S
  } .elsewhen (io.compute_en) {
    when (io.compute_mode === OperationMode.ADD) {
      psum := io.ipsum
    } .elsewhen (io.compute_mode === OperationMode.MUL) {
      psum := psum + (io.ifmap_i * io.weight_i)
    }
  }

  io.ifmap_o := ifmap
  io.weight_o := weight
  io.opsum := if (read_en) psum else 0.S
}

// Generate the Verilog code
object PEAccumulatorMain extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new PE)
}
