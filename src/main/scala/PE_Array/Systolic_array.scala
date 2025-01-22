import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class SystolicArray(val rows: Int, val cols: Int) extends Module {
    val io = IO(new Bundle {
        val compute_en = Input(Vec(rows*cols, Bool()))
        val read_en = Input(Vec(rows*cols, Bool()))
        val compute_mode = Input(Vec(rows*cols, Bool()))
        val ifmap = Input(Vec(rows, UInt(8.W)))
        val weight = Input(Vec(cols, SInt(8.W)))
        val ipsum = Input(Vec(rows*cols, SInt(32.W)))
        val opsum = Output(Vec(rows*cols, SInt(32.W)))
    })

    val pe_array = Seq.fill(rows, cols)(Module(new PE))

    for (i <- 0 until rows) {
        for (j <- 0 until cols) {
            pe_array(i)(j).io.compute_en := io.compute_en(i)(j)
            pe_array(i)(j).io.read_en := io.read_en(i)(j)
            pe_array(i)(j).io.compute_mode := io.compute_mode(i)(j)
            when (j.U === 0.U) {
                pe_array(i)(j).io.ifmap_i := Cat(~io.ifmap(i)(7), io.ifmap(i))(6,0).asSInt
            } .otherwise {
                pe_array(i)(j).io.ifmap_i := pe_array(i)(j-1).io.ifmap_o
            }
            when (i.U === 0.U) {
                pe_array(i)(j).io.weight_i := io.weight(j)
            } .otherwise {
                pe_array(i)(j).io.weight_i := pe_array(i-1)(j).io.weight_o
            }
            pe_array(i)(j).io.ipsum := io.ipsum(i*cols+j)
            io.opsum(i)(j) := pe_array(i)(j).io.opsum
        }
    }
}

// Generate the Verilog code
object SystolicArray extends App {
  (new ChiselStage).emitVerilog(new SystolicArray(8, 8))
}
