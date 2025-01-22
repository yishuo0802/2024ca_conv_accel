import mill._, scalalib._

object conv_accelerator extends ScalaModule with TestModule {
  def scalaVersion = "2.13.8" // 指定 Scala 版本

  // Chisel 和測試框架的依賴
  def ivyDeps = Agg(
    ivy"edu.berkeley.cs::chisel3:3.5.0",       // Chisel 主程式
    ivy"edu.berkeley.cs::chiseltest:0.5.4"    // ChiselTest 測試框架
  )

  // 定義測試檔案來源
  def testSources = T.sources {
    millSourcePath / "src" / "test" / "scala"
  }

  // 指定測試框架
  def testFramework = T { "org.scalatest.tools.Framework" }
}
