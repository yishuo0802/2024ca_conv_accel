import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class SystolicArray(val rows: Int, val cols: Int) extends Module {
    val io = IO(new Bundle {
        val compute_en = Input(UInt((rows*cols).W))
        val read_en = Input(UInt((rows*cols).W))
        val compute_mode = Input(UInt((rows*cols).W))
        val ifmap = Input(UInt((8*rows).W))
        val weight = Input(UInt((8*cols).W))
        val ipsum = Input(UInt((32*rows*cols).W))
        val opsum = Output(UInt((32*rows*cols).W))
    })

    val pe_array = Seq.fill(rows, cols)(Module(new PE))

    val opsum_flat = Wire(Vec(rows * cols, UInt(32.W)))

    for (i <- 0 until rows) {
        for (j <- 0 until cols) {
            val idx = i * cols + j
            pe_array(i)(j).io.compute_en := io.compute_en(idx)
            pe_array(i)(j).io.read_en := io.read_en(idx)
            pe_array(i)(j).io.compute_mode := io.compute_mode(idx)
            if (j == 0) {
                pe_array(i)(j).io.ifmap_i := Cat(~io.ifmap(8*(i+1)-1), io.ifmap(8*(i+1)-2,8*i)).asSInt
            } else {
                pe_array(i)(j).io.ifmap_i := pe_array(i)(j-1).io.ifmap_o
            }
            if (i == 0) {
                pe_array(i)(j).io.weight_i := io.weight(8*(j+1)-1, 8*j).asSInt
            } else {
                pe_array(i)(j).io.weight_i := pe_array(i-1)(j).io.weight_o
            }
            pe_array(i)(j).io.ipsum := io.ipsum((idx+1)*32-1, idx*32).asSInt
            opsum_flat(idx) := pe_array(i)(j).io.opsum.asUInt
        }
    }

    io.opsum := opsum_flat.asUInt
}

// Generate the Verilog code
object SystolicArray extends App {
  (new ChiselStage).emitVerilog(new SystolicArray(8, 8))
}
