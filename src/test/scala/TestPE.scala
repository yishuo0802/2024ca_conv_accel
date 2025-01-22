import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class TestPE extends AnyFlatSpec with ChiselScalatestTester {
  "PE" should "perform ADD and MUL operations correctly" in {
    test(new PE) { dut =>
      // Initialize inputs
      dut.io.reset.poke(true.B)
      dut.io.compute_en.poke(false.B)
      dut.io.read_en.poke(false.B)
      dut.io.compute_mode.poke(OperationMode.ADD)
      dut.io.ifmap_i.poke(0.S)
      dut.io.weight_i.poke(0.S)
      dut.io.ipsum.poke(0.S)

      dut.clock.step(5)

      // Apply reset
      dut.clock.step(1)
      dut.io.reset.poke(false.B)

      dut.clock.step(5)

      // Test ADD operation
      dut.io.compute_en.poke(true.B)
      dut.io.compute_mode.poke(OperationMode.ADD)
      dut.io.ipsum.poke(10.S)
      dut.clock.step(1)
      dut.io.read_en.poke(true.B)
      dut.io.opsum.expect(10.S)

      dut.clock.step(5)

      // Test MUL operation
      dut.io.compute_mode.poke(OperationMode.MUL)
      dut.io.ifmap_i.poke(3.S)
      dut.io.weight_i.poke(4.S)
      dut.clock.step(1)
      dut.io.read_en.poke(true.B)
      dut.io.opsum.expect(22.S) // psum = 3 * 4 + 10 = 22

      dut.clock.step(5)

      // Test reset
      dut.io.reset.poke(true.B)
      dut.clock.step(1)
      dut.io.reset.poke(false.B)
      dut.io.opsum.expect(0.S)
    }
  }
}