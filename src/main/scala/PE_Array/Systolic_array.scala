import chisel3._
import chisel3.util._

class SystolicArray(val rows: Int, val cols: Int) extends Module {
    val io = IO(new Bundle {
        val clk = Input(Clock())
        val reset = Input(Bool())
        val compute_en = Input(Vec(rows*col, Bool()))
        val read_en = Input(Vec(rows*col, Bool()))
        val compute_mode = Input(Vec(rows*col, Bool()))
        val ifmap = Input(Vec(rows, UInt(8.W)))
        val weight = Input(Vec(cols, SInt(8.W)))
        val ipsum = Input(Vec(rows*cols, SInt(32.W)))
        val opsum = Output(Vec(rows*cols, SInt(32.W)))
    })

    val pe_array = Seq.fill(rows, cols)(Module(new PE))

    for (i <- 0 until rows) {
        for (j <- 0 until cols) {
            pe_array(i)(j).io.clk := io.clk
            pe_array(i)(j).io.reset := io.reset
            pe_array(i)(j).io.compute_en := io.compute_en(i)(j)
            pe_array(i)(j).io.read_en := io.read_en(i)(j)
            pe_array(i)(j).io.compute_mode := io.compute_mode(i)(j)
            when (j == 0) {
                pe_array(i)(j).io.ifmap_i := Cat(~io.ifmap(i)(7), io.ifmap(i))(6,0).asSInt
            } else {
                pe_array(i)(j).io.ifmap_i := pe_array(i)(j-1).io.ifmap_o
            }
            when (i == 0) {
                pe_array(i)(j).io.weight_i := io.weight(j)
            } else {
                pe_array(i)(j).io.weight_i := pe_array(i-1)(j).io.weight_o
            }
            pe_array(i)(j).io.ipsum := io.ipsum(i*cols+j)
            io.opsum(i)(j) := pe_array(i)(j).io.opsum
        }
    }
}

object SystolicArrayDriver extends App {
    chisel3.Driver.execute(args, () => new SystolicArray(4, 4))
}