import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import org.scalatest.matchers.should.Matchers

class TestPE extends AnyFreeSpec with ChiselScalatestTester with Matchers {
  "PE should perform ADD and MUL operations correctly" in {
    test(new PE) { dut =>
      println("Starting test...")

      // Initialize inputs
      dut.io.compute_en.poke(false.B)
      dut.io.read_en.poke(false.B)
      dut.io.compute_mode.poke(false.B)
      dut.io.ifmap_i.poke(0.S)
      dut.io.weight_i.poke(0.S)
      dut.io.ipsum.poke(0.S)

      dut.clock.step(1)
      println("Reset completed")

      // Test ADD operation
      dut.io.compute_en.poke(true.B)
      dut.io.compute_mode.poke(false.B)
      dut.io.ipsum.poke(10.S)
      dut.io.read_en.poke(true.B)
      dut.clock.step(1)
      dut.io.opsum.expect(10.S)
      println("ADD test passed")

      // Test MUL operation
      dut.io.compute_mode.poke(true.B)
      dut.io.ifmap_i.poke(3.S)
      dut.io.weight_i.poke(4.S)
      dut.clock.step(1)
      dut.io.opsum.expect(22.S)
      println("MUL test passed")
    }
  }
}