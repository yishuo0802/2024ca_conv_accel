circuit SystolicArray :
  module PE :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_56 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_57 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_58 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_59 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_60 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_61 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_62 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module PE_63 :
    input clock : Clock
    input reset : Reset
    output io : { flip compute_en : UInt<1>, flip read_en : UInt<1>, flip compute_mode : UInt<1>, flip ifmap_i : SInt<8>, ifmap_o : SInt<8>, flip weight_i : SInt<8>, weight_o : SInt<8>, flip ipsum : SInt<32>, opsum : SInt<32>}

    reg ifmap : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 25:22]
    reg weight : SInt<8>, clock with :
      reset => (reset, asSInt(UInt<8>("h0"))) @[PE.scala 26:23]
    reg psum : SInt<32>, clock with :
      reset => (reset, asSInt(UInt<32>("h0"))) @[PE.scala 27:21]
    node _T = asUInt(reset) @[PE.scala 29:15]
    when _T : @[PE.scala 29:23]
      psum <= asSInt(UInt<1>("h0")) @[PE.scala 30:10]
    else :
      when io.compute_en : @[PE.scala 31:31]
        ifmap <= io.ifmap_i @[PE.scala 32:11]
        weight <= io.weight_i @[PE.scala 33:12]
        node _T_1 = eq(io.compute_mode, UInt<1>("h0")) @[PE.scala 34:27]
        when _T_1 : @[PE.scala 34:50]
          psum <= io.ipsum @[PE.scala 35:12]
        else :
          node _T_2 = eq(io.compute_mode, UInt<1>("h1")) @[PE.scala 36:34]
          when _T_2 : @[PE.scala 36:57]
            node _psum_T = mul(io.ifmap_i, io.weight_i) @[PE.scala 37:34]
            node _psum_T_1 = add(psum, _psum_T) @[PE.scala 37:20]
            node _psum_T_2 = tail(_psum_T_1, 1) @[PE.scala 37:20]
            node _psum_T_3 = asSInt(_psum_T_2) @[PE.scala 37:20]
            psum <= _psum_T_3 @[PE.scala 37:12]
    io.ifmap_o <= ifmap @[PE.scala 41:14]
    io.weight_o <= weight @[PE.scala 42:15]
    node _io_opsum_T = mux(io.read_en, psum, asSInt(UInt<1>("h0"))) @[PE.scala 43:18]
    io.opsum <= _io_opsum_T @[PE.scala 43:12]

  module SystolicArray :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip compute_en : UInt<64>, flip read_en : UInt<64>, flip compute_mode : UInt<64>, flip ifmap : UInt<64>, flip weight : UInt<64>, flip ipsum : UInt<2048>, opsum : UInt<2048>}

    inst pe_array_0_0 of PE @[Systolic_array.scala 16:47]
    pe_array_0_0.clock <= clock
    pe_array_0_0.reset <= reset
    inst pe_array_0_1 of PE_1 @[Systolic_array.scala 16:47]
    pe_array_0_1.clock <= clock
    pe_array_0_1.reset <= reset
    inst pe_array_0_2 of PE_2 @[Systolic_array.scala 16:47]
    pe_array_0_2.clock <= clock
    pe_array_0_2.reset <= reset
    inst pe_array_0_3 of PE_3 @[Systolic_array.scala 16:47]
    pe_array_0_3.clock <= clock
    pe_array_0_3.reset <= reset
    inst pe_array_0_4 of PE_4 @[Systolic_array.scala 16:47]
    pe_array_0_4.clock <= clock
    pe_array_0_4.reset <= reset
    inst pe_array_0_5 of PE_5 @[Systolic_array.scala 16:47]
    pe_array_0_5.clock <= clock
    pe_array_0_5.reset <= reset
    inst pe_array_0_6 of PE_6 @[Systolic_array.scala 16:47]
    pe_array_0_6.clock <= clock
    pe_array_0_6.reset <= reset
    inst pe_array_0_7 of PE_7 @[Systolic_array.scala 16:47]
    pe_array_0_7.clock <= clock
    pe_array_0_7.reset <= reset
    inst pe_array_1_0 of PE_8 @[Systolic_array.scala 16:47]
    pe_array_1_0.clock <= clock
    pe_array_1_0.reset <= reset
    inst pe_array_1_1 of PE_9 @[Systolic_array.scala 16:47]
    pe_array_1_1.clock <= clock
    pe_array_1_1.reset <= reset
    inst pe_array_1_2 of PE_10 @[Systolic_array.scala 16:47]
    pe_array_1_2.clock <= clock
    pe_array_1_2.reset <= reset
    inst pe_array_1_3 of PE_11 @[Systolic_array.scala 16:47]
    pe_array_1_3.clock <= clock
    pe_array_1_3.reset <= reset
    inst pe_array_1_4 of PE_12 @[Systolic_array.scala 16:47]
    pe_array_1_4.clock <= clock
    pe_array_1_4.reset <= reset
    inst pe_array_1_5 of PE_13 @[Systolic_array.scala 16:47]
    pe_array_1_5.clock <= clock
    pe_array_1_5.reset <= reset
    inst pe_array_1_6 of PE_14 @[Systolic_array.scala 16:47]
    pe_array_1_6.clock <= clock
    pe_array_1_6.reset <= reset
    inst pe_array_1_7 of PE_15 @[Systolic_array.scala 16:47]
    pe_array_1_7.clock <= clock
    pe_array_1_7.reset <= reset
    inst pe_array_2_0 of PE_16 @[Systolic_array.scala 16:47]
    pe_array_2_0.clock <= clock
    pe_array_2_0.reset <= reset
    inst pe_array_2_1 of PE_17 @[Systolic_array.scala 16:47]
    pe_array_2_1.clock <= clock
    pe_array_2_1.reset <= reset
    inst pe_array_2_2 of PE_18 @[Systolic_array.scala 16:47]
    pe_array_2_2.clock <= clock
    pe_array_2_2.reset <= reset
    inst pe_array_2_3 of PE_19 @[Systolic_array.scala 16:47]
    pe_array_2_3.clock <= clock
    pe_array_2_3.reset <= reset
    inst pe_array_2_4 of PE_20 @[Systolic_array.scala 16:47]
    pe_array_2_4.clock <= clock
    pe_array_2_4.reset <= reset
    inst pe_array_2_5 of PE_21 @[Systolic_array.scala 16:47]
    pe_array_2_5.clock <= clock
    pe_array_2_5.reset <= reset
    inst pe_array_2_6 of PE_22 @[Systolic_array.scala 16:47]
    pe_array_2_6.clock <= clock
    pe_array_2_6.reset <= reset
    inst pe_array_2_7 of PE_23 @[Systolic_array.scala 16:47]
    pe_array_2_7.clock <= clock
    pe_array_2_7.reset <= reset
    inst pe_array_3_0 of PE_24 @[Systolic_array.scala 16:47]
    pe_array_3_0.clock <= clock
    pe_array_3_0.reset <= reset
    inst pe_array_3_1 of PE_25 @[Systolic_array.scala 16:47]
    pe_array_3_1.clock <= clock
    pe_array_3_1.reset <= reset
    inst pe_array_3_2 of PE_26 @[Systolic_array.scala 16:47]
    pe_array_3_2.clock <= clock
    pe_array_3_2.reset <= reset
    inst pe_array_3_3 of PE_27 @[Systolic_array.scala 16:47]
    pe_array_3_3.clock <= clock
    pe_array_3_3.reset <= reset
    inst pe_array_3_4 of PE_28 @[Systolic_array.scala 16:47]
    pe_array_3_4.clock <= clock
    pe_array_3_4.reset <= reset
    inst pe_array_3_5 of PE_29 @[Systolic_array.scala 16:47]
    pe_array_3_5.clock <= clock
    pe_array_3_5.reset <= reset
    inst pe_array_3_6 of PE_30 @[Systolic_array.scala 16:47]
    pe_array_3_6.clock <= clock
    pe_array_3_6.reset <= reset
    inst pe_array_3_7 of PE_31 @[Systolic_array.scala 16:47]
    pe_array_3_7.clock <= clock
    pe_array_3_7.reset <= reset
    inst pe_array_4_0 of PE_32 @[Systolic_array.scala 16:47]
    pe_array_4_0.clock <= clock
    pe_array_4_0.reset <= reset
    inst pe_array_4_1 of PE_33 @[Systolic_array.scala 16:47]
    pe_array_4_1.clock <= clock
    pe_array_4_1.reset <= reset
    inst pe_array_4_2 of PE_34 @[Systolic_array.scala 16:47]
    pe_array_4_2.clock <= clock
    pe_array_4_2.reset <= reset
    inst pe_array_4_3 of PE_35 @[Systolic_array.scala 16:47]
    pe_array_4_3.clock <= clock
    pe_array_4_3.reset <= reset
    inst pe_array_4_4 of PE_36 @[Systolic_array.scala 16:47]
    pe_array_4_4.clock <= clock
    pe_array_4_4.reset <= reset
    inst pe_array_4_5 of PE_37 @[Systolic_array.scala 16:47]
    pe_array_4_5.clock <= clock
    pe_array_4_5.reset <= reset
    inst pe_array_4_6 of PE_38 @[Systolic_array.scala 16:47]
    pe_array_4_6.clock <= clock
    pe_array_4_6.reset <= reset
    inst pe_array_4_7 of PE_39 @[Systolic_array.scala 16:47]
    pe_array_4_7.clock <= clock
    pe_array_4_7.reset <= reset
    inst pe_array_5_0 of PE_40 @[Systolic_array.scala 16:47]
    pe_array_5_0.clock <= clock
    pe_array_5_0.reset <= reset
    inst pe_array_5_1 of PE_41 @[Systolic_array.scala 16:47]
    pe_array_5_1.clock <= clock
    pe_array_5_1.reset <= reset
    inst pe_array_5_2 of PE_42 @[Systolic_array.scala 16:47]
    pe_array_5_2.clock <= clock
    pe_array_5_2.reset <= reset
    inst pe_array_5_3 of PE_43 @[Systolic_array.scala 16:47]
    pe_array_5_3.clock <= clock
    pe_array_5_3.reset <= reset
    inst pe_array_5_4 of PE_44 @[Systolic_array.scala 16:47]
    pe_array_5_4.clock <= clock
    pe_array_5_4.reset <= reset
    inst pe_array_5_5 of PE_45 @[Systolic_array.scala 16:47]
    pe_array_5_5.clock <= clock
    pe_array_5_5.reset <= reset
    inst pe_array_5_6 of PE_46 @[Systolic_array.scala 16:47]
    pe_array_5_6.clock <= clock
    pe_array_5_6.reset <= reset
    inst pe_array_5_7 of PE_47 @[Systolic_array.scala 16:47]
    pe_array_5_7.clock <= clock
    pe_array_5_7.reset <= reset
    inst pe_array_6_0 of PE_48 @[Systolic_array.scala 16:47]
    pe_array_6_0.clock <= clock
    pe_array_6_0.reset <= reset
    inst pe_array_6_1 of PE_49 @[Systolic_array.scala 16:47]
    pe_array_6_1.clock <= clock
    pe_array_6_1.reset <= reset
    inst pe_array_6_2 of PE_50 @[Systolic_array.scala 16:47]
    pe_array_6_2.clock <= clock
    pe_array_6_2.reset <= reset
    inst pe_array_6_3 of PE_51 @[Systolic_array.scala 16:47]
    pe_array_6_3.clock <= clock
    pe_array_6_3.reset <= reset
    inst pe_array_6_4 of PE_52 @[Systolic_array.scala 16:47]
    pe_array_6_4.clock <= clock
    pe_array_6_4.reset <= reset
    inst pe_array_6_5 of PE_53 @[Systolic_array.scala 16:47]
    pe_array_6_5.clock <= clock
    pe_array_6_5.reset <= reset
    inst pe_array_6_6 of PE_54 @[Systolic_array.scala 16:47]
    pe_array_6_6.clock <= clock
    pe_array_6_6.reset <= reset
    inst pe_array_6_7 of PE_55 @[Systolic_array.scala 16:47]
    pe_array_6_7.clock <= clock
    pe_array_6_7.reset <= reset
    inst pe_array_7_0 of PE_56 @[Systolic_array.scala 16:47]
    pe_array_7_0.clock <= clock
    pe_array_7_0.reset <= reset
    inst pe_array_7_1 of PE_57 @[Systolic_array.scala 16:47]
    pe_array_7_1.clock <= clock
    pe_array_7_1.reset <= reset
    inst pe_array_7_2 of PE_58 @[Systolic_array.scala 16:47]
    pe_array_7_2.clock <= clock
    pe_array_7_2.reset <= reset
    inst pe_array_7_3 of PE_59 @[Systolic_array.scala 16:47]
    pe_array_7_3.clock <= clock
    pe_array_7_3.reset <= reset
    inst pe_array_7_4 of PE_60 @[Systolic_array.scala 16:47]
    pe_array_7_4.clock <= clock
    pe_array_7_4.reset <= reset
    inst pe_array_7_5 of PE_61 @[Systolic_array.scala 16:47]
    pe_array_7_5.clock <= clock
    pe_array_7_5.reset <= reset
    inst pe_array_7_6 of PE_62 @[Systolic_array.scala 16:47]
    pe_array_7_6.clock <= clock
    pe_array_7_6.reset <= reset
    inst pe_array_7_7 of PE_63 @[Systolic_array.scala 16:47]
    pe_array_7_7.clock <= clock
    pe_array_7_7.reset <= reset
    wire opsum_flat : UInt<32>[64] @[Systolic_array.scala 18:26]
    node _pe_array_0_0_io_compute_en_T = bits(io.compute_en, 0, 0) @[Systolic_array.scala 23:58]
    pe_array_0_0.io.compute_en <= _pe_array_0_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_0_io_read_en_T = bits(io.read_en, 0, 0) @[Systolic_array.scala 24:52]
    pe_array_0_0.io.read_en <= _pe_array_0_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_0_io_compute_mode_T = bits(io.compute_mode, 0, 0) @[Systolic_array.scala 25:62]
    pe_array_0_0.io.compute_mode <= _pe_array_0_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_0_0_io_ifmap_i_T = bits(io.ifmap, 7, 7) @[Systolic_array.scala 27:59]
    node _pe_array_0_0_io_ifmap_i_T_1 = not(_pe_array_0_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_0_0_io_ifmap_i_T_2 = bits(io.ifmap, 6, 0) @[Systolic_array.scala 27:80]
    node _pe_array_0_0_io_ifmap_i_T_3 = cat(_pe_array_0_0_io_ifmap_i_T_1, _pe_array_0_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_0_0_io_ifmap_i_T_4 = asSInt(_pe_array_0_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_0_0.io.ifmap_i <= _pe_array_0_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    node _pe_array_0_0_io_weight_i_T = bits(io.weight, 7, 0) @[Systolic_array.scala 32:56]
    node _pe_array_0_0_io_weight_i_T_1 = asSInt(_pe_array_0_0_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_0.io.weight_i <= _pe_array_0_0_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_0_io_ipsum_T = bits(io.ipsum, 31, 0) @[Systolic_array.scala 36:48]
    node _pe_array_0_0_io_ipsum_T_1 = asSInt(_pe_array_0_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_0.io.ipsum <= _pe_array_0_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_0_T = asUInt(pe_array_0_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[0] <= _opsum_flat_0_T @[Systolic_array.scala 37:29]
    node _pe_array_0_1_io_compute_en_T = bits(io.compute_en, 1, 1) @[Systolic_array.scala 23:58]
    pe_array_0_1.io.compute_en <= _pe_array_0_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_1_io_read_en_T = bits(io.read_en, 1, 1) @[Systolic_array.scala 24:52]
    pe_array_0_1.io.read_en <= _pe_array_0_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_1_io_compute_mode_T = bits(io.compute_mode, 1, 1) @[Systolic_array.scala 25:62]
    pe_array_0_1.io.compute_mode <= _pe_array_0_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_1.io.ifmap_i <= pe_array_0_0.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_1_io_weight_i_T = bits(io.weight, 15, 8) @[Systolic_array.scala 32:56]
    node _pe_array_0_1_io_weight_i_T_1 = asSInt(_pe_array_0_1_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_1.io.weight_i <= _pe_array_0_1_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_1_io_ipsum_T = bits(io.ipsum, 63, 32) @[Systolic_array.scala 36:48]
    node _pe_array_0_1_io_ipsum_T_1 = asSInt(_pe_array_0_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_1.io.ipsum <= _pe_array_0_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_1_T = asUInt(pe_array_0_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[1] <= _opsum_flat_1_T @[Systolic_array.scala 37:29]
    node _pe_array_0_2_io_compute_en_T = bits(io.compute_en, 2, 2) @[Systolic_array.scala 23:58]
    pe_array_0_2.io.compute_en <= _pe_array_0_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_2_io_read_en_T = bits(io.read_en, 2, 2) @[Systolic_array.scala 24:52]
    pe_array_0_2.io.read_en <= _pe_array_0_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_2_io_compute_mode_T = bits(io.compute_mode, 2, 2) @[Systolic_array.scala 25:62]
    pe_array_0_2.io.compute_mode <= _pe_array_0_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_2.io.ifmap_i <= pe_array_0_1.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_2_io_weight_i_T = bits(io.weight, 23, 16) @[Systolic_array.scala 32:56]
    node _pe_array_0_2_io_weight_i_T_1 = asSInt(_pe_array_0_2_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_2.io.weight_i <= _pe_array_0_2_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_2_io_ipsum_T = bits(io.ipsum, 95, 64) @[Systolic_array.scala 36:48]
    node _pe_array_0_2_io_ipsum_T_1 = asSInt(_pe_array_0_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_2.io.ipsum <= _pe_array_0_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_2_T = asUInt(pe_array_0_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[2] <= _opsum_flat_2_T @[Systolic_array.scala 37:29]
    node _pe_array_0_3_io_compute_en_T = bits(io.compute_en, 3, 3) @[Systolic_array.scala 23:58]
    pe_array_0_3.io.compute_en <= _pe_array_0_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_3_io_read_en_T = bits(io.read_en, 3, 3) @[Systolic_array.scala 24:52]
    pe_array_0_3.io.read_en <= _pe_array_0_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_3_io_compute_mode_T = bits(io.compute_mode, 3, 3) @[Systolic_array.scala 25:62]
    pe_array_0_3.io.compute_mode <= _pe_array_0_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_3.io.ifmap_i <= pe_array_0_2.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_3_io_weight_i_T = bits(io.weight, 31, 24) @[Systolic_array.scala 32:56]
    node _pe_array_0_3_io_weight_i_T_1 = asSInt(_pe_array_0_3_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_3.io.weight_i <= _pe_array_0_3_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_3_io_ipsum_T = bits(io.ipsum, 127, 96) @[Systolic_array.scala 36:48]
    node _pe_array_0_3_io_ipsum_T_1 = asSInt(_pe_array_0_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_3.io.ipsum <= _pe_array_0_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_3_T = asUInt(pe_array_0_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[3] <= _opsum_flat_3_T @[Systolic_array.scala 37:29]
    node _pe_array_0_4_io_compute_en_T = bits(io.compute_en, 4, 4) @[Systolic_array.scala 23:58]
    pe_array_0_4.io.compute_en <= _pe_array_0_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_4_io_read_en_T = bits(io.read_en, 4, 4) @[Systolic_array.scala 24:52]
    pe_array_0_4.io.read_en <= _pe_array_0_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_4_io_compute_mode_T = bits(io.compute_mode, 4, 4) @[Systolic_array.scala 25:62]
    pe_array_0_4.io.compute_mode <= _pe_array_0_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_4.io.ifmap_i <= pe_array_0_3.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_4_io_weight_i_T = bits(io.weight, 39, 32) @[Systolic_array.scala 32:56]
    node _pe_array_0_4_io_weight_i_T_1 = asSInt(_pe_array_0_4_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_4.io.weight_i <= _pe_array_0_4_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_4_io_ipsum_T = bits(io.ipsum, 159, 128) @[Systolic_array.scala 36:48]
    node _pe_array_0_4_io_ipsum_T_1 = asSInt(_pe_array_0_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_4.io.ipsum <= _pe_array_0_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_4_T = asUInt(pe_array_0_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[4] <= _opsum_flat_4_T @[Systolic_array.scala 37:29]
    node _pe_array_0_5_io_compute_en_T = bits(io.compute_en, 5, 5) @[Systolic_array.scala 23:58]
    pe_array_0_5.io.compute_en <= _pe_array_0_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_5_io_read_en_T = bits(io.read_en, 5, 5) @[Systolic_array.scala 24:52]
    pe_array_0_5.io.read_en <= _pe_array_0_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_5_io_compute_mode_T = bits(io.compute_mode, 5, 5) @[Systolic_array.scala 25:62]
    pe_array_0_5.io.compute_mode <= _pe_array_0_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_5.io.ifmap_i <= pe_array_0_4.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_5_io_weight_i_T = bits(io.weight, 47, 40) @[Systolic_array.scala 32:56]
    node _pe_array_0_5_io_weight_i_T_1 = asSInt(_pe_array_0_5_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_5.io.weight_i <= _pe_array_0_5_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_5_io_ipsum_T = bits(io.ipsum, 191, 160) @[Systolic_array.scala 36:48]
    node _pe_array_0_5_io_ipsum_T_1 = asSInt(_pe_array_0_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_5.io.ipsum <= _pe_array_0_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_5_T = asUInt(pe_array_0_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[5] <= _opsum_flat_5_T @[Systolic_array.scala 37:29]
    node _pe_array_0_6_io_compute_en_T = bits(io.compute_en, 6, 6) @[Systolic_array.scala 23:58]
    pe_array_0_6.io.compute_en <= _pe_array_0_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_6_io_read_en_T = bits(io.read_en, 6, 6) @[Systolic_array.scala 24:52]
    pe_array_0_6.io.read_en <= _pe_array_0_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_6_io_compute_mode_T = bits(io.compute_mode, 6, 6) @[Systolic_array.scala 25:62]
    pe_array_0_6.io.compute_mode <= _pe_array_0_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_6.io.ifmap_i <= pe_array_0_5.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_6_io_weight_i_T = bits(io.weight, 55, 48) @[Systolic_array.scala 32:56]
    node _pe_array_0_6_io_weight_i_T_1 = asSInt(_pe_array_0_6_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_6.io.weight_i <= _pe_array_0_6_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_6_io_ipsum_T = bits(io.ipsum, 223, 192) @[Systolic_array.scala 36:48]
    node _pe_array_0_6_io_ipsum_T_1 = asSInt(_pe_array_0_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_6.io.ipsum <= _pe_array_0_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_6_T = asUInt(pe_array_0_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[6] <= _opsum_flat_6_T @[Systolic_array.scala 37:29]
    node _pe_array_0_7_io_compute_en_T = bits(io.compute_en, 7, 7) @[Systolic_array.scala 23:58]
    pe_array_0_7.io.compute_en <= _pe_array_0_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_0_7_io_read_en_T = bits(io.read_en, 7, 7) @[Systolic_array.scala 24:52]
    pe_array_0_7.io.read_en <= _pe_array_0_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_0_7_io_compute_mode_T = bits(io.compute_mode, 7, 7) @[Systolic_array.scala 25:62]
    pe_array_0_7.io.compute_mode <= _pe_array_0_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_0_7.io.ifmap_i <= pe_array_0_6.io.ifmap_o @[Systolic_array.scala 29:43]
    node _pe_array_0_7_io_weight_i_T = bits(io.weight, 63, 56) @[Systolic_array.scala 32:56]
    node _pe_array_0_7_io_weight_i_T_1 = asSInt(_pe_array_0_7_io_weight_i_T) @[Systolic_array.scala 32:73]
    pe_array_0_7.io.weight_i <= _pe_array_0_7_io_weight_i_T_1 @[Systolic_array.scala 32:44]
    node _pe_array_0_7_io_ipsum_T = bits(io.ipsum, 255, 224) @[Systolic_array.scala 36:48]
    node _pe_array_0_7_io_ipsum_T_1 = asSInt(_pe_array_0_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_0_7.io.ipsum <= _pe_array_0_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_7_T = asUInt(pe_array_0_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[7] <= _opsum_flat_7_T @[Systolic_array.scala 37:29]
    node _pe_array_1_0_io_compute_en_T = bits(io.compute_en, 8, 8) @[Systolic_array.scala 23:58]
    pe_array_1_0.io.compute_en <= _pe_array_1_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_0_io_read_en_T = bits(io.read_en, 8, 8) @[Systolic_array.scala 24:52]
    pe_array_1_0.io.read_en <= _pe_array_1_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_0_io_compute_mode_T = bits(io.compute_mode, 8, 8) @[Systolic_array.scala 25:62]
    pe_array_1_0.io.compute_mode <= _pe_array_1_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_1_0_io_ifmap_i_T = bits(io.ifmap, 15, 15) @[Systolic_array.scala 27:59]
    node _pe_array_1_0_io_ifmap_i_T_1 = not(_pe_array_1_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_1_0_io_ifmap_i_T_2 = bits(io.ifmap, 14, 8) @[Systolic_array.scala 27:80]
    node _pe_array_1_0_io_ifmap_i_T_3 = cat(_pe_array_1_0_io_ifmap_i_T_1, _pe_array_1_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_1_0_io_ifmap_i_T_4 = asSInt(_pe_array_1_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_1_0.io.ifmap_i <= _pe_array_1_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_1_0.io.weight_i <= pe_array_0_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_0_io_ipsum_T = bits(io.ipsum, 287, 256) @[Systolic_array.scala 36:48]
    node _pe_array_1_0_io_ipsum_T_1 = asSInt(_pe_array_1_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_0.io.ipsum <= _pe_array_1_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_8_T = asUInt(pe_array_1_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[8] <= _opsum_flat_8_T @[Systolic_array.scala 37:29]
    node _pe_array_1_1_io_compute_en_T = bits(io.compute_en, 9, 9) @[Systolic_array.scala 23:58]
    pe_array_1_1.io.compute_en <= _pe_array_1_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_1_io_read_en_T = bits(io.read_en, 9, 9) @[Systolic_array.scala 24:52]
    pe_array_1_1.io.read_en <= _pe_array_1_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_1_io_compute_mode_T = bits(io.compute_mode, 9, 9) @[Systolic_array.scala 25:62]
    pe_array_1_1.io.compute_mode <= _pe_array_1_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_1.io.ifmap_i <= pe_array_1_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_1.io.weight_i <= pe_array_0_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_1_io_ipsum_T = bits(io.ipsum, 319, 288) @[Systolic_array.scala 36:48]
    node _pe_array_1_1_io_ipsum_T_1 = asSInt(_pe_array_1_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_1.io.ipsum <= _pe_array_1_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_9_T = asUInt(pe_array_1_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[9] <= _opsum_flat_9_T @[Systolic_array.scala 37:29]
    node _pe_array_1_2_io_compute_en_T = bits(io.compute_en, 10, 10) @[Systolic_array.scala 23:58]
    pe_array_1_2.io.compute_en <= _pe_array_1_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_2_io_read_en_T = bits(io.read_en, 10, 10) @[Systolic_array.scala 24:52]
    pe_array_1_2.io.read_en <= _pe_array_1_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_2_io_compute_mode_T = bits(io.compute_mode, 10, 10) @[Systolic_array.scala 25:62]
    pe_array_1_2.io.compute_mode <= _pe_array_1_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_2.io.ifmap_i <= pe_array_1_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_2.io.weight_i <= pe_array_0_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_2_io_ipsum_T = bits(io.ipsum, 351, 320) @[Systolic_array.scala 36:48]
    node _pe_array_1_2_io_ipsum_T_1 = asSInt(_pe_array_1_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_2.io.ipsum <= _pe_array_1_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_10_T = asUInt(pe_array_1_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[10] <= _opsum_flat_10_T @[Systolic_array.scala 37:29]
    node _pe_array_1_3_io_compute_en_T = bits(io.compute_en, 11, 11) @[Systolic_array.scala 23:58]
    pe_array_1_3.io.compute_en <= _pe_array_1_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_3_io_read_en_T = bits(io.read_en, 11, 11) @[Systolic_array.scala 24:52]
    pe_array_1_3.io.read_en <= _pe_array_1_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_3_io_compute_mode_T = bits(io.compute_mode, 11, 11) @[Systolic_array.scala 25:62]
    pe_array_1_3.io.compute_mode <= _pe_array_1_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_3.io.ifmap_i <= pe_array_1_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_3.io.weight_i <= pe_array_0_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_3_io_ipsum_T = bits(io.ipsum, 383, 352) @[Systolic_array.scala 36:48]
    node _pe_array_1_3_io_ipsum_T_1 = asSInt(_pe_array_1_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_3.io.ipsum <= _pe_array_1_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_11_T = asUInt(pe_array_1_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[11] <= _opsum_flat_11_T @[Systolic_array.scala 37:29]
    node _pe_array_1_4_io_compute_en_T = bits(io.compute_en, 12, 12) @[Systolic_array.scala 23:58]
    pe_array_1_4.io.compute_en <= _pe_array_1_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_4_io_read_en_T = bits(io.read_en, 12, 12) @[Systolic_array.scala 24:52]
    pe_array_1_4.io.read_en <= _pe_array_1_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_4_io_compute_mode_T = bits(io.compute_mode, 12, 12) @[Systolic_array.scala 25:62]
    pe_array_1_4.io.compute_mode <= _pe_array_1_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_4.io.ifmap_i <= pe_array_1_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_4.io.weight_i <= pe_array_0_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_4_io_ipsum_T = bits(io.ipsum, 415, 384) @[Systolic_array.scala 36:48]
    node _pe_array_1_4_io_ipsum_T_1 = asSInt(_pe_array_1_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_4.io.ipsum <= _pe_array_1_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_12_T = asUInt(pe_array_1_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[12] <= _opsum_flat_12_T @[Systolic_array.scala 37:29]
    node _pe_array_1_5_io_compute_en_T = bits(io.compute_en, 13, 13) @[Systolic_array.scala 23:58]
    pe_array_1_5.io.compute_en <= _pe_array_1_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_5_io_read_en_T = bits(io.read_en, 13, 13) @[Systolic_array.scala 24:52]
    pe_array_1_5.io.read_en <= _pe_array_1_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_5_io_compute_mode_T = bits(io.compute_mode, 13, 13) @[Systolic_array.scala 25:62]
    pe_array_1_5.io.compute_mode <= _pe_array_1_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_5.io.ifmap_i <= pe_array_1_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_5.io.weight_i <= pe_array_0_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_5_io_ipsum_T = bits(io.ipsum, 447, 416) @[Systolic_array.scala 36:48]
    node _pe_array_1_5_io_ipsum_T_1 = asSInt(_pe_array_1_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_5.io.ipsum <= _pe_array_1_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_13_T = asUInt(pe_array_1_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[13] <= _opsum_flat_13_T @[Systolic_array.scala 37:29]
    node _pe_array_1_6_io_compute_en_T = bits(io.compute_en, 14, 14) @[Systolic_array.scala 23:58]
    pe_array_1_6.io.compute_en <= _pe_array_1_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_6_io_read_en_T = bits(io.read_en, 14, 14) @[Systolic_array.scala 24:52]
    pe_array_1_6.io.read_en <= _pe_array_1_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_6_io_compute_mode_T = bits(io.compute_mode, 14, 14) @[Systolic_array.scala 25:62]
    pe_array_1_6.io.compute_mode <= _pe_array_1_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_6.io.ifmap_i <= pe_array_1_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_6.io.weight_i <= pe_array_0_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_6_io_ipsum_T = bits(io.ipsum, 479, 448) @[Systolic_array.scala 36:48]
    node _pe_array_1_6_io_ipsum_T_1 = asSInt(_pe_array_1_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_6.io.ipsum <= _pe_array_1_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_14_T = asUInt(pe_array_1_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[14] <= _opsum_flat_14_T @[Systolic_array.scala 37:29]
    node _pe_array_1_7_io_compute_en_T = bits(io.compute_en, 15, 15) @[Systolic_array.scala 23:58]
    pe_array_1_7.io.compute_en <= _pe_array_1_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_1_7_io_read_en_T = bits(io.read_en, 15, 15) @[Systolic_array.scala 24:52]
    pe_array_1_7.io.read_en <= _pe_array_1_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_1_7_io_compute_mode_T = bits(io.compute_mode, 15, 15) @[Systolic_array.scala 25:62]
    pe_array_1_7.io.compute_mode <= _pe_array_1_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_1_7.io.ifmap_i <= pe_array_1_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_1_7.io.weight_i <= pe_array_0_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_1_7_io_ipsum_T = bits(io.ipsum, 511, 480) @[Systolic_array.scala 36:48]
    node _pe_array_1_7_io_ipsum_T_1 = asSInt(_pe_array_1_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_1_7.io.ipsum <= _pe_array_1_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_15_T = asUInt(pe_array_1_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[15] <= _opsum_flat_15_T @[Systolic_array.scala 37:29]
    node _pe_array_2_0_io_compute_en_T = bits(io.compute_en, 16, 16) @[Systolic_array.scala 23:58]
    pe_array_2_0.io.compute_en <= _pe_array_2_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_0_io_read_en_T = bits(io.read_en, 16, 16) @[Systolic_array.scala 24:52]
    pe_array_2_0.io.read_en <= _pe_array_2_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_0_io_compute_mode_T = bits(io.compute_mode, 16, 16) @[Systolic_array.scala 25:62]
    pe_array_2_0.io.compute_mode <= _pe_array_2_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_2_0_io_ifmap_i_T = bits(io.ifmap, 23, 23) @[Systolic_array.scala 27:59]
    node _pe_array_2_0_io_ifmap_i_T_1 = not(_pe_array_2_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_2_0_io_ifmap_i_T_2 = bits(io.ifmap, 22, 16) @[Systolic_array.scala 27:80]
    node _pe_array_2_0_io_ifmap_i_T_3 = cat(_pe_array_2_0_io_ifmap_i_T_1, _pe_array_2_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_2_0_io_ifmap_i_T_4 = asSInt(_pe_array_2_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_2_0.io.ifmap_i <= _pe_array_2_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_2_0.io.weight_i <= pe_array_1_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_0_io_ipsum_T = bits(io.ipsum, 543, 512) @[Systolic_array.scala 36:48]
    node _pe_array_2_0_io_ipsum_T_1 = asSInt(_pe_array_2_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_0.io.ipsum <= _pe_array_2_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_16_T = asUInt(pe_array_2_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[16] <= _opsum_flat_16_T @[Systolic_array.scala 37:29]
    node _pe_array_2_1_io_compute_en_T = bits(io.compute_en, 17, 17) @[Systolic_array.scala 23:58]
    pe_array_2_1.io.compute_en <= _pe_array_2_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_1_io_read_en_T = bits(io.read_en, 17, 17) @[Systolic_array.scala 24:52]
    pe_array_2_1.io.read_en <= _pe_array_2_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_1_io_compute_mode_T = bits(io.compute_mode, 17, 17) @[Systolic_array.scala 25:62]
    pe_array_2_1.io.compute_mode <= _pe_array_2_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_1.io.ifmap_i <= pe_array_2_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_1.io.weight_i <= pe_array_1_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_1_io_ipsum_T = bits(io.ipsum, 575, 544) @[Systolic_array.scala 36:48]
    node _pe_array_2_1_io_ipsum_T_1 = asSInt(_pe_array_2_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_1.io.ipsum <= _pe_array_2_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_17_T = asUInt(pe_array_2_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[17] <= _opsum_flat_17_T @[Systolic_array.scala 37:29]
    node _pe_array_2_2_io_compute_en_T = bits(io.compute_en, 18, 18) @[Systolic_array.scala 23:58]
    pe_array_2_2.io.compute_en <= _pe_array_2_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_2_io_read_en_T = bits(io.read_en, 18, 18) @[Systolic_array.scala 24:52]
    pe_array_2_2.io.read_en <= _pe_array_2_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_2_io_compute_mode_T = bits(io.compute_mode, 18, 18) @[Systolic_array.scala 25:62]
    pe_array_2_2.io.compute_mode <= _pe_array_2_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_2.io.ifmap_i <= pe_array_2_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_2.io.weight_i <= pe_array_1_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_2_io_ipsum_T = bits(io.ipsum, 607, 576) @[Systolic_array.scala 36:48]
    node _pe_array_2_2_io_ipsum_T_1 = asSInt(_pe_array_2_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_2.io.ipsum <= _pe_array_2_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_18_T = asUInt(pe_array_2_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[18] <= _opsum_flat_18_T @[Systolic_array.scala 37:29]
    node _pe_array_2_3_io_compute_en_T = bits(io.compute_en, 19, 19) @[Systolic_array.scala 23:58]
    pe_array_2_3.io.compute_en <= _pe_array_2_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_3_io_read_en_T = bits(io.read_en, 19, 19) @[Systolic_array.scala 24:52]
    pe_array_2_3.io.read_en <= _pe_array_2_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_3_io_compute_mode_T = bits(io.compute_mode, 19, 19) @[Systolic_array.scala 25:62]
    pe_array_2_3.io.compute_mode <= _pe_array_2_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_3.io.ifmap_i <= pe_array_2_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_3.io.weight_i <= pe_array_1_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_3_io_ipsum_T = bits(io.ipsum, 639, 608) @[Systolic_array.scala 36:48]
    node _pe_array_2_3_io_ipsum_T_1 = asSInt(_pe_array_2_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_3.io.ipsum <= _pe_array_2_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_19_T = asUInt(pe_array_2_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[19] <= _opsum_flat_19_T @[Systolic_array.scala 37:29]
    node _pe_array_2_4_io_compute_en_T = bits(io.compute_en, 20, 20) @[Systolic_array.scala 23:58]
    pe_array_2_4.io.compute_en <= _pe_array_2_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_4_io_read_en_T = bits(io.read_en, 20, 20) @[Systolic_array.scala 24:52]
    pe_array_2_4.io.read_en <= _pe_array_2_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_4_io_compute_mode_T = bits(io.compute_mode, 20, 20) @[Systolic_array.scala 25:62]
    pe_array_2_4.io.compute_mode <= _pe_array_2_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_4.io.ifmap_i <= pe_array_2_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_4.io.weight_i <= pe_array_1_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_4_io_ipsum_T = bits(io.ipsum, 671, 640) @[Systolic_array.scala 36:48]
    node _pe_array_2_4_io_ipsum_T_1 = asSInt(_pe_array_2_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_4.io.ipsum <= _pe_array_2_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_20_T = asUInt(pe_array_2_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[20] <= _opsum_flat_20_T @[Systolic_array.scala 37:29]
    node _pe_array_2_5_io_compute_en_T = bits(io.compute_en, 21, 21) @[Systolic_array.scala 23:58]
    pe_array_2_5.io.compute_en <= _pe_array_2_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_5_io_read_en_T = bits(io.read_en, 21, 21) @[Systolic_array.scala 24:52]
    pe_array_2_5.io.read_en <= _pe_array_2_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_5_io_compute_mode_T = bits(io.compute_mode, 21, 21) @[Systolic_array.scala 25:62]
    pe_array_2_5.io.compute_mode <= _pe_array_2_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_5.io.ifmap_i <= pe_array_2_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_5.io.weight_i <= pe_array_1_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_5_io_ipsum_T = bits(io.ipsum, 703, 672) @[Systolic_array.scala 36:48]
    node _pe_array_2_5_io_ipsum_T_1 = asSInt(_pe_array_2_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_5.io.ipsum <= _pe_array_2_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_21_T = asUInt(pe_array_2_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[21] <= _opsum_flat_21_T @[Systolic_array.scala 37:29]
    node _pe_array_2_6_io_compute_en_T = bits(io.compute_en, 22, 22) @[Systolic_array.scala 23:58]
    pe_array_2_6.io.compute_en <= _pe_array_2_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_6_io_read_en_T = bits(io.read_en, 22, 22) @[Systolic_array.scala 24:52]
    pe_array_2_6.io.read_en <= _pe_array_2_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_6_io_compute_mode_T = bits(io.compute_mode, 22, 22) @[Systolic_array.scala 25:62]
    pe_array_2_6.io.compute_mode <= _pe_array_2_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_6.io.ifmap_i <= pe_array_2_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_6.io.weight_i <= pe_array_1_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_6_io_ipsum_T = bits(io.ipsum, 735, 704) @[Systolic_array.scala 36:48]
    node _pe_array_2_6_io_ipsum_T_1 = asSInt(_pe_array_2_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_6.io.ipsum <= _pe_array_2_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_22_T = asUInt(pe_array_2_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[22] <= _opsum_flat_22_T @[Systolic_array.scala 37:29]
    node _pe_array_2_7_io_compute_en_T = bits(io.compute_en, 23, 23) @[Systolic_array.scala 23:58]
    pe_array_2_7.io.compute_en <= _pe_array_2_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_2_7_io_read_en_T = bits(io.read_en, 23, 23) @[Systolic_array.scala 24:52]
    pe_array_2_7.io.read_en <= _pe_array_2_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_2_7_io_compute_mode_T = bits(io.compute_mode, 23, 23) @[Systolic_array.scala 25:62]
    pe_array_2_7.io.compute_mode <= _pe_array_2_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_2_7.io.ifmap_i <= pe_array_2_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_2_7.io.weight_i <= pe_array_1_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_2_7_io_ipsum_T = bits(io.ipsum, 767, 736) @[Systolic_array.scala 36:48]
    node _pe_array_2_7_io_ipsum_T_1 = asSInt(_pe_array_2_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_2_7.io.ipsum <= _pe_array_2_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_23_T = asUInt(pe_array_2_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[23] <= _opsum_flat_23_T @[Systolic_array.scala 37:29]
    node _pe_array_3_0_io_compute_en_T = bits(io.compute_en, 24, 24) @[Systolic_array.scala 23:58]
    pe_array_3_0.io.compute_en <= _pe_array_3_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_0_io_read_en_T = bits(io.read_en, 24, 24) @[Systolic_array.scala 24:52]
    pe_array_3_0.io.read_en <= _pe_array_3_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_0_io_compute_mode_T = bits(io.compute_mode, 24, 24) @[Systolic_array.scala 25:62]
    pe_array_3_0.io.compute_mode <= _pe_array_3_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_3_0_io_ifmap_i_T = bits(io.ifmap, 31, 31) @[Systolic_array.scala 27:59]
    node _pe_array_3_0_io_ifmap_i_T_1 = not(_pe_array_3_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_3_0_io_ifmap_i_T_2 = bits(io.ifmap, 30, 24) @[Systolic_array.scala 27:80]
    node _pe_array_3_0_io_ifmap_i_T_3 = cat(_pe_array_3_0_io_ifmap_i_T_1, _pe_array_3_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_3_0_io_ifmap_i_T_4 = asSInt(_pe_array_3_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_3_0.io.ifmap_i <= _pe_array_3_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_3_0.io.weight_i <= pe_array_2_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_0_io_ipsum_T = bits(io.ipsum, 799, 768) @[Systolic_array.scala 36:48]
    node _pe_array_3_0_io_ipsum_T_1 = asSInt(_pe_array_3_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_0.io.ipsum <= _pe_array_3_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_24_T = asUInt(pe_array_3_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[24] <= _opsum_flat_24_T @[Systolic_array.scala 37:29]
    node _pe_array_3_1_io_compute_en_T = bits(io.compute_en, 25, 25) @[Systolic_array.scala 23:58]
    pe_array_3_1.io.compute_en <= _pe_array_3_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_1_io_read_en_T = bits(io.read_en, 25, 25) @[Systolic_array.scala 24:52]
    pe_array_3_1.io.read_en <= _pe_array_3_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_1_io_compute_mode_T = bits(io.compute_mode, 25, 25) @[Systolic_array.scala 25:62]
    pe_array_3_1.io.compute_mode <= _pe_array_3_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_1.io.ifmap_i <= pe_array_3_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_1.io.weight_i <= pe_array_2_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_1_io_ipsum_T = bits(io.ipsum, 831, 800) @[Systolic_array.scala 36:48]
    node _pe_array_3_1_io_ipsum_T_1 = asSInt(_pe_array_3_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_1.io.ipsum <= _pe_array_3_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_25_T = asUInt(pe_array_3_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[25] <= _opsum_flat_25_T @[Systolic_array.scala 37:29]
    node _pe_array_3_2_io_compute_en_T = bits(io.compute_en, 26, 26) @[Systolic_array.scala 23:58]
    pe_array_3_2.io.compute_en <= _pe_array_3_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_2_io_read_en_T = bits(io.read_en, 26, 26) @[Systolic_array.scala 24:52]
    pe_array_3_2.io.read_en <= _pe_array_3_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_2_io_compute_mode_T = bits(io.compute_mode, 26, 26) @[Systolic_array.scala 25:62]
    pe_array_3_2.io.compute_mode <= _pe_array_3_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_2.io.ifmap_i <= pe_array_3_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_2.io.weight_i <= pe_array_2_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_2_io_ipsum_T = bits(io.ipsum, 863, 832) @[Systolic_array.scala 36:48]
    node _pe_array_3_2_io_ipsum_T_1 = asSInt(_pe_array_3_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_2.io.ipsum <= _pe_array_3_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_26_T = asUInt(pe_array_3_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[26] <= _opsum_flat_26_T @[Systolic_array.scala 37:29]
    node _pe_array_3_3_io_compute_en_T = bits(io.compute_en, 27, 27) @[Systolic_array.scala 23:58]
    pe_array_3_3.io.compute_en <= _pe_array_3_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_3_io_read_en_T = bits(io.read_en, 27, 27) @[Systolic_array.scala 24:52]
    pe_array_3_3.io.read_en <= _pe_array_3_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_3_io_compute_mode_T = bits(io.compute_mode, 27, 27) @[Systolic_array.scala 25:62]
    pe_array_3_3.io.compute_mode <= _pe_array_3_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_3.io.ifmap_i <= pe_array_3_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_3.io.weight_i <= pe_array_2_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_3_io_ipsum_T = bits(io.ipsum, 895, 864) @[Systolic_array.scala 36:48]
    node _pe_array_3_3_io_ipsum_T_1 = asSInt(_pe_array_3_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_3.io.ipsum <= _pe_array_3_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_27_T = asUInt(pe_array_3_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[27] <= _opsum_flat_27_T @[Systolic_array.scala 37:29]
    node _pe_array_3_4_io_compute_en_T = bits(io.compute_en, 28, 28) @[Systolic_array.scala 23:58]
    pe_array_3_4.io.compute_en <= _pe_array_3_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_4_io_read_en_T = bits(io.read_en, 28, 28) @[Systolic_array.scala 24:52]
    pe_array_3_4.io.read_en <= _pe_array_3_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_4_io_compute_mode_T = bits(io.compute_mode, 28, 28) @[Systolic_array.scala 25:62]
    pe_array_3_4.io.compute_mode <= _pe_array_3_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_4.io.ifmap_i <= pe_array_3_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_4.io.weight_i <= pe_array_2_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_4_io_ipsum_T = bits(io.ipsum, 927, 896) @[Systolic_array.scala 36:48]
    node _pe_array_3_4_io_ipsum_T_1 = asSInt(_pe_array_3_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_4.io.ipsum <= _pe_array_3_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_28_T = asUInt(pe_array_3_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[28] <= _opsum_flat_28_T @[Systolic_array.scala 37:29]
    node _pe_array_3_5_io_compute_en_T = bits(io.compute_en, 29, 29) @[Systolic_array.scala 23:58]
    pe_array_3_5.io.compute_en <= _pe_array_3_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_5_io_read_en_T = bits(io.read_en, 29, 29) @[Systolic_array.scala 24:52]
    pe_array_3_5.io.read_en <= _pe_array_3_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_5_io_compute_mode_T = bits(io.compute_mode, 29, 29) @[Systolic_array.scala 25:62]
    pe_array_3_5.io.compute_mode <= _pe_array_3_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_5.io.ifmap_i <= pe_array_3_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_5.io.weight_i <= pe_array_2_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_5_io_ipsum_T = bits(io.ipsum, 959, 928) @[Systolic_array.scala 36:48]
    node _pe_array_3_5_io_ipsum_T_1 = asSInt(_pe_array_3_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_5.io.ipsum <= _pe_array_3_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_29_T = asUInt(pe_array_3_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[29] <= _opsum_flat_29_T @[Systolic_array.scala 37:29]
    node _pe_array_3_6_io_compute_en_T = bits(io.compute_en, 30, 30) @[Systolic_array.scala 23:58]
    pe_array_3_6.io.compute_en <= _pe_array_3_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_6_io_read_en_T = bits(io.read_en, 30, 30) @[Systolic_array.scala 24:52]
    pe_array_3_6.io.read_en <= _pe_array_3_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_6_io_compute_mode_T = bits(io.compute_mode, 30, 30) @[Systolic_array.scala 25:62]
    pe_array_3_6.io.compute_mode <= _pe_array_3_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_6.io.ifmap_i <= pe_array_3_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_6.io.weight_i <= pe_array_2_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_6_io_ipsum_T = bits(io.ipsum, 991, 960) @[Systolic_array.scala 36:48]
    node _pe_array_3_6_io_ipsum_T_1 = asSInt(_pe_array_3_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_6.io.ipsum <= _pe_array_3_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_30_T = asUInt(pe_array_3_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[30] <= _opsum_flat_30_T @[Systolic_array.scala 37:29]
    node _pe_array_3_7_io_compute_en_T = bits(io.compute_en, 31, 31) @[Systolic_array.scala 23:58]
    pe_array_3_7.io.compute_en <= _pe_array_3_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_3_7_io_read_en_T = bits(io.read_en, 31, 31) @[Systolic_array.scala 24:52]
    pe_array_3_7.io.read_en <= _pe_array_3_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_3_7_io_compute_mode_T = bits(io.compute_mode, 31, 31) @[Systolic_array.scala 25:62]
    pe_array_3_7.io.compute_mode <= _pe_array_3_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_3_7.io.ifmap_i <= pe_array_3_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_3_7.io.weight_i <= pe_array_2_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_3_7_io_ipsum_T = bits(io.ipsum, 1023, 992) @[Systolic_array.scala 36:48]
    node _pe_array_3_7_io_ipsum_T_1 = asSInt(_pe_array_3_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_3_7.io.ipsum <= _pe_array_3_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_31_T = asUInt(pe_array_3_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[31] <= _opsum_flat_31_T @[Systolic_array.scala 37:29]
    node _pe_array_4_0_io_compute_en_T = bits(io.compute_en, 32, 32) @[Systolic_array.scala 23:58]
    pe_array_4_0.io.compute_en <= _pe_array_4_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_0_io_read_en_T = bits(io.read_en, 32, 32) @[Systolic_array.scala 24:52]
    pe_array_4_0.io.read_en <= _pe_array_4_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_0_io_compute_mode_T = bits(io.compute_mode, 32, 32) @[Systolic_array.scala 25:62]
    pe_array_4_0.io.compute_mode <= _pe_array_4_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_4_0_io_ifmap_i_T = bits(io.ifmap, 39, 39) @[Systolic_array.scala 27:59]
    node _pe_array_4_0_io_ifmap_i_T_1 = not(_pe_array_4_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_4_0_io_ifmap_i_T_2 = bits(io.ifmap, 38, 32) @[Systolic_array.scala 27:80]
    node _pe_array_4_0_io_ifmap_i_T_3 = cat(_pe_array_4_0_io_ifmap_i_T_1, _pe_array_4_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_4_0_io_ifmap_i_T_4 = asSInt(_pe_array_4_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_4_0.io.ifmap_i <= _pe_array_4_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_4_0.io.weight_i <= pe_array_3_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_0_io_ipsum_T = bits(io.ipsum, 1055, 1024) @[Systolic_array.scala 36:48]
    node _pe_array_4_0_io_ipsum_T_1 = asSInt(_pe_array_4_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_0.io.ipsum <= _pe_array_4_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_32_T = asUInt(pe_array_4_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[32] <= _opsum_flat_32_T @[Systolic_array.scala 37:29]
    node _pe_array_4_1_io_compute_en_T = bits(io.compute_en, 33, 33) @[Systolic_array.scala 23:58]
    pe_array_4_1.io.compute_en <= _pe_array_4_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_1_io_read_en_T = bits(io.read_en, 33, 33) @[Systolic_array.scala 24:52]
    pe_array_4_1.io.read_en <= _pe_array_4_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_1_io_compute_mode_T = bits(io.compute_mode, 33, 33) @[Systolic_array.scala 25:62]
    pe_array_4_1.io.compute_mode <= _pe_array_4_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_1.io.ifmap_i <= pe_array_4_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_1.io.weight_i <= pe_array_3_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_1_io_ipsum_T = bits(io.ipsum, 1087, 1056) @[Systolic_array.scala 36:48]
    node _pe_array_4_1_io_ipsum_T_1 = asSInt(_pe_array_4_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_1.io.ipsum <= _pe_array_4_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_33_T = asUInt(pe_array_4_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[33] <= _opsum_flat_33_T @[Systolic_array.scala 37:29]
    node _pe_array_4_2_io_compute_en_T = bits(io.compute_en, 34, 34) @[Systolic_array.scala 23:58]
    pe_array_4_2.io.compute_en <= _pe_array_4_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_2_io_read_en_T = bits(io.read_en, 34, 34) @[Systolic_array.scala 24:52]
    pe_array_4_2.io.read_en <= _pe_array_4_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_2_io_compute_mode_T = bits(io.compute_mode, 34, 34) @[Systolic_array.scala 25:62]
    pe_array_4_2.io.compute_mode <= _pe_array_4_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_2.io.ifmap_i <= pe_array_4_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_2.io.weight_i <= pe_array_3_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_2_io_ipsum_T = bits(io.ipsum, 1119, 1088) @[Systolic_array.scala 36:48]
    node _pe_array_4_2_io_ipsum_T_1 = asSInt(_pe_array_4_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_2.io.ipsum <= _pe_array_4_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_34_T = asUInt(pe_array_4_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[34] <= _opsum_flat_34_T @[Systolic_array.scala 37:29]
    node _pe_array_4_3_io_compute_en_T = bits(io.compute_en, 35, 35) @[Systolic_array.scala 23:58]
    pe_array_4_3.io.compute_en <= _pe_array_4_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_3_io_read_en_T = bits(io.read_en, 35, 35) @[Systolic_array.scala 24:52]
    pe_array_4_3.io.read_en <= _pe_array_4_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_3_io_compute_mode_T = bits(io.compute_mode, 35, 35) @[Systolic_array.scala 25:62]
    pe_array_4_3.io.compute_mode <= _pe_array_4_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_3.io.ifmap_i <= pe_array_4_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_3.io.weight_i <= pe_array_3_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_3_io_ipsum_T = bits(io.ipsum, 1151, 1120) @[Systolic_array.scala 36:48]
    node _pe_array_4_3_io_ipsum_T_1 = asSInt(_pe_array_4_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_3.io.ipsum <= _pe_array_4_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_35_T = asUInt(pe_array_4_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[35] <= _opsum_flat_35_T @[Systolic_array.scala 37:29]
    node _pe_array_4_4_io_compute_en_T = bits(io.compute_en, 36, 36) @[Systolic_array.scala 23:58]
    pe_array_4_4.io.compute_en <= _pe_array_4_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_4_io_read_en_T = bits(io.read_en, 36, 36) @[Systolic_array.scala 24:52]
    pe_array_4_4.io.read_en <= _pe_array_4_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_4_io_compute_mode_T = bits(io.compute_mode, 36, 36) @[Systolic_array.scala 25:62]
    pe_array_4_4.io.compute_mode <= _pe_array_4_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_4.io.ifmap_i <= pe_array_4_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_4.io.weight_i <= pe_array_3_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_4_io_ipsum_T = bits(io.ipsum, 1183, 1152) @[Systolic_array.scala 36:48]
    node _pe_array_4_4_io_ipsum_T_1 = asSInt(_pe_array_4_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_4.io.ipsum <= _pe_array_4_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_36_T = asUInt(pe_array_4_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[36] <= _opsum_flat_36_T @[Systolic_array.scala 37:29]
    node _pe_array_4_5_io_compute_en_T = bits(io.compute_en, 37, 37) @[Systolic_array.scala 23:58]
    pe_array_4_5.io.compute_en <= _pe_array_4_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_5_io_read_en_T = bits(io.read_en, 37, 37) @[Systolic_array.scala 24:52]
    pe_array_4_5.io.read_en <= _pe_array_4_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_5_io_compute_mode_T = bits(io.compute_mode, 37, 37) @[Systolic_array.scala 25:62]
    pe_array_4_5.io.compute_mode <= _pe_array_4_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_5.io.ifmap_i <= pe_array_4_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_5.io.weight_i <= pe_array_3_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_5_io_ipsum_T = bits(io.ipsum, 1215, 1184) @[Systolic_array.scala 36:48]
    node _pe_array_4_5_io_ipsum_T_1 = asSInt(_pe_array_4_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_5.io.ipsum <= _pe_array_4_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_37_T = asUInt(pe_array_4_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[37] <= _opsum_flat_37_T @[Systolic_array.scala 37:29]
    node _pe_array_4_6_io_compute_en_T = bits(io.compute_en, 38, 38) @[Systolic_array.scala 23:58]
    pe_array_4_6.io.compute_en <= _pe_array_4_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_6_io_read_en_T = bits(io.read_en, 38, 38) @[Systolic_array.scala 24:52]
    pe_array_4_6.io.read_en <= _pe_array_4_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_6_io_compute_mode_T = bits(io.compute_mode, 38, 38) @[Systolic_array.scala 25:62]
    pe_array_4_6.io.compute_mode <= _pe_array_4_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_6.io.ifmap_i <= pe_array_4_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_6.io.weight_i <= pe_array_3_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_6_io_ipsum_T = bits(io.ipsum, 1247, 1216) @[Systolic_array.scala 36:48]
    node _pe_array_4_6_io_ipsum_T_1 = asSInt(_pe_array_4_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_6.io.ipsum <= _pe_array_4_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_38_T = asUInt(pe_array_4_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[38] <= _opsum_flat_38_T @[Systolic_array.scala 37:29]
    node _pe_array_4_7_io_compute_en_T = bits(io.compute_en, 39, 39) @[Systolic_array.scala 23:58]
    pe_array_4_7.io.compute_en <= _pe_array_4_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_4_7_io_read_en_T = bits(io.read_en, 39, 39) @[Systolic_array.scala 24:52]
    pe_array_4_7.io.read_en <= _pe_array_4_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_4_7_io_compute_mode_T = bits(io.compute_mode, 39, 39) @[Systolic_array.scala 25:62]
    pe_array_4_7.io.compute_mode <= _pe_array_4_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_4_7.io.ifmap_i <= pe_array_4_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_4_7.io.weight_i <= pe_array_3_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_4_7_io_ipsum_T = bits(io.ipsum, 1279, 1248) @[Systolic_array.scala 36:48]
    node _pe_array_4_7_io_ipsum_T_1 = asSInt(_pe_array_4_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_4_7.io.ipsum <= _pe_array_4_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_39_T = asUInt(pe_array_4_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[39] <= _opsum_flat_39_T @[Systolic_array.scala 37:29]
    node _pe_array_5_0_io_compute_en_T = bits(io.compute_en, 40, 40) @[Systolic_array.scala 23:58]
    pe_array_5_0.io.compute_en <= _pe_array_5_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_0_io_read_en_T = bits(io.read_en, 40, 40) @[Systolic_array.scala 24:52]
    pe_array_5_0.io.read_en <= _pe_array_5_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_0_io_compute_mode_T = bits(io.compute_mode, 40, 40) @[Systolic_array.scala 25:62]
    pe_array_5_0.io.compute_mode <= _pe_array_5_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_5_0_io_ifmap_i_T = bits(io.ifmap, 47, 47) @[Systolic_array.scala 27:59]
    node _pe_array_5_0_io_ifmap_i_T_1 = not(_pe_array_5_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_5_0_io_ifmap_i_T_2 = bits(io.ifmap, 46, 40) @[Systolic_array.scala 27:80]
    node _pe_array_5_0_io_ifmap_i_T_3 = cat(_pe_array_5_0_io_ifmap_i_T_1, _pe_array_5_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_5_0_io_ifmap_i_T_4 = asSInt(_pe_array_5_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_5_0.io.ifmap_i <= _pe_array_5_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_5_0.io.weight_i <= pe_array_4_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_0_io_ipsum_T = bits(io.ipsum, 1311, 1280) @[Systolic_array.scala 36:48]
    node _pe_array_5_0_io_ipsum_T_1 = asSInt(_pe_array_5_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_0.io.ipsum <= _pe_array_5_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_40_T = asUInt(pe_array_5_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[40] <= _opsum_flat_40_T @[Systolic_array.scala 37:29]
    node _pe_array_5_1_io_compute_en_T = bits(io.compute_en, 41, 41) @[Systolic_array.scala 23:58]
    pe_array_5_1.io.compute_en <= _pe_array_5_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_1_io_read_en_T = bits(io.read_en, 41, 41) @[Systolic_array.scala 24:52]
    pe_array_5_1.io.read_en <= _pe_array_5_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_1_io_compute_mode_T = bits(io.compute_mode, 41, 41) @[Systolic_array.scala 25:62]
    pe_array_5_1.io.compute_mode <= _pe_array_5_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_1.io.ifmap_i <= pe_array_5_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_1.io.weight_i <= pe_array_4_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_1_io_ipsum_T = bits(io.ipsum, 1343, 1312) @[Systolic_array.scala 36:48]
    node _pe_array_5_1_io_ipsum_T_1 = asSInt(_pe_array_5_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_1.io.ipsum <= _pe_array_5_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_41_T = asUInt(pe_array_5_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[41] <= _opsum_flat_41_T @[Systolic_array.scala 37:29]
    node _pe_array_5_2_io_compute_en_T = bits(io.compute_en, 42, 42) @[Systolic_array.scala 23:58]
    pe_array_5_2.io.compute_en <= _pe_array_5_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_2_io_read_en_T = bits(io.read_en, 42, 42) @[Systolic_array.scala 24:52]
    pe_array_5_2.io.read_en <= _pe_array_5_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_2_io_compute_mode_T = bits(io.compute_mode, 42, 42) @[Systolic_array.scala 25:62]
    pe_array_5_2.io.compute_mode <= _pe_array_5_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_2.io.ifmap_i <= pe_array_5_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_2.io.weight_i <= pe_array_4_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_2_io_ipsum_T = bits(io.ipsum, 1375, 1344) @[Systolic_array.scala 36:48]
    node _pe_array_5_2_io_ipsum_T_1 = asSInt(_pe_array_5_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_2.io.ipsum <= _pe_array_5_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_42_T = asUInt(pe_array_5_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[42] <= _opsum_flat_42_T @[Systolic_array.scala 37:29]
    node _pe_array_5_3_io_compute_en_T = bits(io.compute_en, 43, 43) @[Systolic_array.scala 23:58]
    pe_array_5_3.io.compute_en <= _pe_array_5_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_3_io_read_en_T = bits(io.read_en, 43, 43) @[Systolic_array.scala 24:52]
    pe_array_5_3.io.read_en <= _pe_array_5_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_3_io_compute_mode_T = bits(io.compute_mode, 43, 43) @[Systolic_array.scala 25:62]
    pe_array_5_3.io.compute_mode <= _pe_array_5_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_3.io.ifmap_i <= pe_array_5_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_3.io.weight_i <= pe_array_4_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_3_io_ipsum_T = bits(io.ipsum, 1407, 1376) @[Systolic_array.scala 36:48]
    node _pe_array_5_3_io_ipsum_T_1 = asSInt(_pe_array_5_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_3.io.ipsum <= _pe_array_5_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_43_T = asUInt(pe_array_5_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[43] <= _opsum_flat_43_T @[Systolic_array.scala 37:29]
    node _pe_array_5_4_io_compute_en_T = bits(io.compute_en, 44, 44) @[Systolic_array.scala 23:58]
    pe_array_5_4.io.compute_en <= _pe_array_5_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_4_io_read_en_T = bits(io.read_en, 44, 44) @[Systolic_array.scala 24:52]
    pe_array_5_4.io.read_en <= _pe_array_5_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_4_io_compute_mode_T = bits(io.compute_mode, 44, 44) @[Systolic_array.scala 25:62]
    pe_array_5_4.io.compute_mode <= _pe_array_5_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_4.io.ifmap_i <= pe_array_5_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_4.io.weight_i <= pe_array_4_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_4_io_ipsum_T = bits(io.ipsum, 1439, 1408) @[Systolic_array.scala 36:48]
    node _pe_array_5_4_io_ipsum_T_1 = asSInt(_pe_array_5_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_4.io.ipsum <= _pe_array_5_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_44_T = asUInt(pe_array_5_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[44] <= _opsum_flat_44_T @[Systolic_array.scala 37:29]
    node _pe_array_5_5_io_compute_en_T = bits(io.compute_en, 45, 45) @[Systolic_array.scala 23:58]
    pe_array_5_5.io.compute_en <= _pe_array_5_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_5_io_read_en_T = bits(io.read_en, 45, 45) @[Systolic_array.scala 24:52]
    pe_array_5_5.io.read_en <= _pe_array_5_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_5_io_compute_mode_T = bits(io.compute_mode, 45, 45) @[Systolic_array.scala 25:62]
    pe_array_5_5.io.compute_mode <= _pe_array_5_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_5.io.ifmap_i <= pe_array_5_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_5.io.weight_i <= pe_array_4_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_5_io_ipsum_T = bits(io.ipsum, 1471, 1440) @[Systolic_array.scala 36:48]
    node _pe_array_5_5_io_ipsum_T_1 = asSInt(_pe_array_5_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_5.io.ipsum <= _pe_array_5_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_45_T = asUInt(pe_array_5_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[45] <= _opsum_flat_45_T @[Systolic_array.scala 37:29]
    node _pe_array_5_6_io_compute_en_T = bits(io.compute_en, 46, 46) @[Systolic_array.scala 23:58]
    pe_array_5_6.io.compute_en <= _pe_array_5_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_6_io_read_en_T = bits(io.read_en, 46, 46) @[Systolic_array.scala 24:52]
    pe_array_5_6.io.read_en <= _pe_array_5_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_6_io_compute_mode_T = bits(io.compute_mode, 46, 46) @[Systolic_array.scala 25:62]
    pe_array_5_6.io.compute_mode <= _pe_array_5_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_6.io.ifmap_i <= pe_array_5_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_6.io.weight_i <= pe_array_4_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_6_io_ipsum_T = bits(io.ipsum, 1503, 1472) @[Systolic_array.scala 36:48]
    node _pe_array_5_6_io_ipsum_T_1 = asSInt(_pe_array_5_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_6.io.ipsum <= _pe_array_5_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_46_T = asUInt(pe_array_5_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[46] <= _opsum_flat_46_T @[Systolic_array.scala 37:29]
    node _pe_array_5_7_io_compute_en_T = bits(io.compute_en, 47, 47) @[Systolic_array.scala 23:58]
    pe_array_5_7.io.compute_en <= _pe_array_5_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_5_7_io_read_en_T = bits(io.read_en, 47, 47) @[Systolic_array.scala 24:52]
    pe_array_5_7.io.read_en <= _pe_array_5_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_5_7_io_compute_mode_T = bits(io.compute_mode, 47, 47) @[Systolic_array.scala 25:62]
    pe_array_5_7.io.compute_mode <= _pe_array_5_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_5_7.io.ifmap_i <= pe_array_5_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_5_7.io.weight_i <= pe_array_4_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_5_7_io_ipsum_T = bits(io.ipsum, 1535, 1504) @[Systolic_array.scala 36:48]
    node _pe_array_5_7_io_ipsum_T_1 = asSInt(_pe_array_5_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_5_7.io.ipsum <= _pe_array_5_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_47_T = asUInt(pe_array_5_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[47] <= _opsum_flat_47_T @[Systolic_array.scala 37:29]
    node _pe_array_6_0_io_compute_en_T = bits(io.compute_en, 48, 48) @[Systolic_array.scala 23:58]
    pe_array_6_0.io.compute_en <= _pe_array_6_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_0_io_read_en_T = bits(io.read_en, 48, 48) @[Systolic_array.scala 24:52]
    pe_array_6_0.io.read_en <= _pe_array_6_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_0_io_compute_mode_T = bits(io.compute_mode, 48, 48) @[Systolic_array.scala 25:62]
    pe_array_6_0.io.compute_mode <= _pe_array_6_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_6_0_io_ifmap_i_T = bits(io.ifmap, 55, 55) @[Systolic_array.scala 27:59]
    node _pe_array_6_0_io_ifmap_i_T_1 = not(_pe_array_6_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_6_0_io_ifmap_i_T_2 = bits(io.ifmap, 54, 48) @[Systolic_array.scala 27:80]
    node _pe_array_6_0_io_ifmap_i_T_3 = cat(_pe_array_6_0_io_ifmap_i_T_1, _pe_array_6_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_6_0_io_ifmap_i_T_4 = asSInt(_pe_array_6_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_6_0.io.ifmap_i <= _pe_array_6_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_6_0.io.weight_i <= pe_array_5_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_0_io_ipsum_T = bits(io.ipsum, 1567, 1536) @[Systolic_array.scala 36:48]
    node _pe_array_6_0_io_ipsum_T_1 = asSInt(_pe_array_6_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_0.io.ipsum <= _pe_array_6_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_48_T = asUInt(pe_array_6_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[48] <= _opsum_flat_48_T @[Systolic_array.scala 37:29]
    node _pe_array_6_1_io_compute_en_T = bits(io.compute_en, 49, 49) @[Systolic_array.scala 23:58]
    pe_array_6_1.io.compute_en <= _pe_array_6_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_1_io_read_en_T = bits(io.read_en, 49, 49) @[Systolic_array.scala 24:52]
    pe_array_6_1.io.read_en <= _pe_array_6_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_1_io_compute_mode_T = bits(io.compute_mode, 49, 49) @[Systolic_array.scala 25:62]
    pe_array_6_1.io.compute_mode <= _pe_array_6_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_1.io.ifmap_i <= pe_array_6_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_1.io.weight_i <= pe_array_5_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_1_io_ipsum_T = bits(io.ipsum, 1599, 1568) @[Systolic_array.scala 36:48]
    node _pe_array_6_1_io_ipsum_T_1 = asSInt(_pe_array_6_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_1.io.ipsum <= _pe_array_6_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_49_T = asUInt(pe_array_6_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[49] <= _opsum_flat_49_T @[Systolic_array.scala 37:29]
    node _pe_array_6_2_io_compute_en_T = bits(io.compute_en, 50, 50) @[Systolic_array.scala 23:58]
    pe_array_6_2.io.compute_en <= _pe_array_6_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_2_io_read_en_T = bits(io.read_en, 50, 50) @[Systolic_array.scala 24:52]
    pe_array_6_2.io.read_en <= _pe_array_6_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_2_io_compute_mode_T = bits(io.compute_mode, 50, 50) @[Systolic_array.scala 25:62]
    pe_array_6_2.io.compute_mode <= _pe_array_6_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_2.io.ifmap_i <= pe_array_6_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_2.io.weight_i <= pe_array_5_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_2_io_ipsum_T = bits(io.ipsum, 1631, 1600) @[Systolic_array.scala 36:48]
    node _pe_array_6_2_io_ipsum_T_1 = asSInt(_pe_array_6_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_2.io.ipsum <= _pe_array_6_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_50_T = asUInt(pe_array_6_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[50] <= _opsum_flat_50_T @[Systolic_array.scala 37:29]
    node _pe_array_6_3_io_compute_en_T = bits(io.compute_en, 51, 51) @[Systolic_array.scala 23:58]
    pe_array_6_3.io.compute_en <= _pe_array_6_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_3_io_read_en_T = bits(io.read_en, 51, 51) @[Systolic_array.scala 24:52]
    pe_array_6_3.io.read_en <= _pe_array_6_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_3_io_compute_mode_T = bits(io.compute_mode, 51, 51) @[Systolic_array.scala 25:62]
    pe_array_6_3.io.compute_mode <= _pe_array_6_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_3.io.ifmap_i <= pe_array_6_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_3.io.weight_i <= pe_array_5_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_3_io_ipsum_T = bits(io.ipsum, 1663, 1632) @[Systolic_array.scala 36:48]
    node _pe_array_6_3_io_ipsum_T_1 = asSInt(_pe_array_6_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_3.io.ipsum <= _pe_array_6_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_51_T = asUInt(pe_array_6_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[51] <= _opsum_flat_51_T @[Systolic_array.scala 37:29]
    node _pe_array_6_4_io_compute_en_T = bits(io.compute_en, 52, 52) @[Systolic_array.scala 23:58]
    pe_array_6_4.io.compute_en <= _pe_array_6_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_4_io_read_en_T = bits(io.read_en, 52, 52) @[Systolic_array.scala 24:52]
    pe_array_6_4.io.read_en <= _pe_array_6_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_4_io_compute_mode_T = bits(io.compute_mode, 52, 52) @[Systolic_array.scala 25:62]
    pe_array_6_4.io.compute_mode <= _pe_array_6_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_4.io.ifmap_i <= pe_array_6_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_4.io.weight_i <= pe_array_5_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_4_io_ipsum_T = bits(io.ipsum, 1695, 1664) @[Systolic_array.scala 36:48]
    node _pe_array_6_4_io_ipsum_T_1 = asSInt(_pe_array_6_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_4.io.ipsum <= _pe_array_6_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_52_T = asUInt(pe_array_6_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[52] <= _opsum_flat_52_T @[Systolic_array.scala 37:29]
    node _pe_array_6_5_io_compute_en_T = bits(io.compute_en, 53, 53) @[Systolic_array.scala 23:58]
    pe_array_6_5.io.compute_en <= _pe_array_6_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_5_io_read_en_T = bits(io.read_en, 53, 53) @[Systolic_array.scala 24:52]
    pe_array_6_5.io.read_en <= _pe_array_6_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_5_io_compute_mode_T = bits(io.compute_mode, 53, 53) @[Systolic_array.scala 25:62]
    pe_array_6_5.io.compute_mode <= _pe_array_6_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_5.io.ifmap_i <= pe_array_6_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_5.io.weight_i <= pe_array_5_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_5_io_ipsum_T = bits(io.ipsum, 1727, 1696) @[Systolic_array.scala 36:48]
    node _pe_array_6_5_io_ipsum_T_1 = asSInt(_pe_array_6_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_5.io.ipsum <= _pe_array_6_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_53_T = asUInt(pe_array_6_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[53] <= _opsum_flat_53_T @[Systolic_array.scala 37:29]
    node _pe_array_6_6_io_compute_en_T = bits(io.compute_en, 54, 54) @[Systolic_array.scala 23:58]
    pe_array_6_6.io.compute_en <= _pe_array_6_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_6_io_read_en_T = bits(io.read_en, 54, 54) @[Systolic_array.scala 24:52]
    pe_array_6_6.io.read_en <= _pe_array_6_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_6_io_compute_mode_T = bits(io.compute_mode, 54, 54) @[Systolic_array.scala 25:62]
    pe_array_6_6.io.compute_mode <= _pe_array_6_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_6.io.ifmap_i <= pe_array_6_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_6.io.weight_i <= pe_array_5_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_6_io_ipsum_T = bits(io.ipsum, 1759, 1728) @[Systolic_array.scala 36:48]
    node _pe_array_6_6_io_ipsum_T_1 = asSInt(_pe_array_6_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_6.io.ipsum <= _pe_array_6_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_54_T = asUInt(pe_array_6_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[54] <= _opsum_flat_54_T @[Systolic_array.scala 37:29]
    node _pe_array_6_7_io_compute_en_T = bits(io.compute_en, 55, 55) @[Systolic_array.scala 23:58]
    pe_array_6_7.io.compute_en <= _pe_array_6_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_6_7_io_read_en_T = bits(io.read_en, 55, 55) @[Systolic_array.scala 24:52]
    pe_array_6_7.io.read_en <= _pe_array_6_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_6_7_io_compute_mode_T = bits(io.compute_mode, 55, 55) @[Systolic_array.scala 25:62]
    pe_array_6_7.io.compute_mode <= _pe_array_6_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_6_7.io.ifmap_i <= pe_array_6_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_6_7.io.weight_i <= pe_array_5_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_6_7_io_ipsum_T = bits(io.ipsum, 1791, 1760) @[Systolic_array.scala 36:48]
    node _pe_array_6_7_io_ipsum_T_1 = asSInt(_pe_array_6_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_6_7.io.ipsum <= _pe_array_6_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_55_T = asUInt(pe_array_6_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[55] <= _opsum_flat_55_T @[Systolic_array.scala 37:29]
    node _pe_array_7_0_io_compute_en_T = bits(io.compute_en, 56, 56) @[Systolic_array.scala 23:58]
    pe_array_7_0.io.compute_en <= _pe_array_7_0_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_0_io_read_en_T = bits(io.read_en, 56, 56) @[Systolic_array.scala 24:52]
    pe_array_7_0.io.read_en <= _pe_array_7_0_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_0_io_compute_mode_T = bits(io.compute_mode, 56, 56) @[Systolic_array.scala 25:62]
    pe_array_7_0.io.compute_mode <= _pe_array_7_0_io_compute_mode_T @[Systolic_array.scala 25:44]
    node _pe_array_7_0_io_ifmap_i_T = bits(io.ifmap, 63, 63) @[Systolic_array.scala 27:59]
    node _pe_array_7_0_io_ifmap_i_T_1 = not(_pe_array_7_0_io_ifmap_i_T) @[Systolic_array.scala 27:50]
    node _pe_array_7_0_io_ifmap_i_T_2 = bits(io.ifmap, 62, 56) @[Systolic_array.scala 27:80]
    node _pe_array_7_0_io_ifmap_i_T_3 = cat(_pe_array_7_0_io_ifmap_i_T_1, _pe_array_7_0_io_ifmap_i_T_2) @[Cat.scala 33:92]
    node _pe_array_7_0_io_ifmap_i_T_4 = asSInt(_pe_array_7_0_io_ifmap_i_T_3) @[Systolic_array.scala 27:97]
    pe_array_7_0.io.ifmap_i <= _pe_array_7_0_io_ifmap_i_T_4 @[Systolic_array.scala 27:43]
    pe_array_7_0.io.weight_i <= pe_array_6_0.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_0_io_ipsum_T = bits(io.ipsum, 1823, 1792) @[Systolic_array.scala 36:48]
    node _pe_array_7_0_io_ipsum_T_1 = asSInt(_pe_array_7_0_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_0.io.ipsum <= _pe_array_7_0_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_56_T = asUInt(pe_array_7_0.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[56] <= _opsum_flat_56_T @[Systolic_array.scala 37:29]
    node _pe_array_7_1_io_compute_en_T = bits(io.compute_en, 57, 57) @[Systolic_array.scala 23:58]
    pe_array_7_1.io.compute_en <= _pe_array_7_1_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_1_io_read_en_T = bits(io.read_en, 57, 57) @[Systolic_array.scala 24:52]
    pe_array_7_1.io.read_en <= _pe_array_7_1_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_1_io_compute_mode_T = bits(io.compute_mode, 57, 57) @[Systolic_array.scala 25:62]
    pe_array_7_1.io.compute_mode <= _pe_array_7_1_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_1.io.ifmap_i <= pe_array_7_0.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_1.io.weight_i <= pe_array_6_1.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_1_io_ipsum_T = bits(io.ipsum, 1855, 1824) @[Systolic_array.scala 36:48]
    node _pe_array_7_1_io_ipsum_T_1 = asSInt(_pe_array_7_1_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_1.io.ipsum <= _pe_array_7_1_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_57_T = asUInt(pe_array_7_1.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[57] <= _opsum_flat_57_T @[Systolic_array.scala 37:29]
    node _pe_array_7_2_io_compute_en_T = bits(io.compute_en, 58, 58) @[Systolic_array.scala 23:58]
    pe_array_7_2.io.compute_en <= _pe_array_7_2_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_2_io_read_en_T = bits(io.read_en, 58, 58) @[Systolic_array.scala 24:52]
    pe_array_7_2.io.read_en <= _pe_array_7_2_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_2_io_compute_mode_T = bits(io.compute_mode, 58, 58) @[Systolic_array.scala 25:62]
    pe_array_7_2.io.compute_mode <= _pe_array_7_2_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_2.io.ifmap_i <= pe_array_7_1.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_2.io.weight_i <= pe_array_6_2.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_2_io_ipsum_T = bits(io.ipsum, 1887, 1856) @[Systolic_array.scala 36:48]
    node _pe_array_7_2_io_ipsum_T_1 = asSInt(_pe_array_7_2_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_2.io.ipsum <= _pe_array_7_2_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_58_T = asUInt(pe_array_7_2.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[58] <= _opsum_flat_58_T @[Systolic_array.scala 37:29]
    node _pe_array_7_3_io_compute_en_T = bits(io.compute_en, 59, 59) @[Systolic_array.scala 23:58]
    pe_array_7_3.io.compute_en <= _pe_array_7_3_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_3_io_read_en_T = bits(io.read_en, 59, 59) @[Systolic_array.scala 24:52]
    pe_array_7_3.io.read_en <= _pe_array_7_3_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_3_io_compute_mode_T = bits(io.compute_mode, 59, 59) @[Systolic_array.scala 25:62]
    pe_array_7_3.io.compute_mode <= _pe_array_7_3_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_3.io.ifmap_i <= pe_array_7_2.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_3.io.weight_i <= pe_array_6_3.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_3_io_ipsum_T = bits(io.ipsum, 1919, 1888) @[Systolic_array.scala 36:48]
    node _pe_array_7_3_io_ipsum_T_1 = asSInt(_pe_array_7_3_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_3.io.ipsum <= _pe_array_7_3_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_59_T = asUInt(pe_array_7_3.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[59] <= _opsum_flat_59_T @[Systolic_array.scala 37:29]
    node _pe_array_7_4_io_compute_en_T = bits(io.compute_en, 60, 60) @[Systolic_array.scala 23:58]
    pe_array_7_4.io.compute_en <= _pe_array_7_4_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_4_io_read_en_T = bits(io.read_en, 60, 60) @[Systolic_array.scala 24:52]
    pe_array_7_4.io.read_en <= _pe_array_7_4_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_4_io_compute_mode_T = bits(io.compute_mode, 60, 60) @[Systolic_array.scala 25:62]
    pe_array_7_4.io.compute_mode <= _pe_array_7_4_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_4.io.ifmap_i <= pe_array_7_3.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_4.io.weight_i <= pe_array_6_4.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_4_io_ipsum_T = bits(io.ipsum, 1951, 1920) @[Systolic_array.scala 36:48]
    node _pe_array_7_4_io_ipsum_T_1 = asSInt(_pe_array_7_4_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_4.io.ipsum <= _pe_array_7_4_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_60_T = asUInt(pe_array_7_4.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[60] <= _opsum_flat_60_T @[Systolic_array.scala 37:29]
    node _pe_array_7_5_io_compute_en_T = bits(io.compute_en, 61, 61) @[Systolic_array.scala 23:58]
    pe_array_7_5.io.compute_en <= _pe_array_7_5_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_5_io_read_en_T = bits(io.read_en, 61, 61) @[Systolic_array.scala 24:52]
    pe_array_7_5.io.read_en <= _pe_array_7_5_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_5_io_compute_mode_T = bits(io.compute_mode, 61, 61) @[Systolic_array.scala 25:62]
    pe_array_7_5.io.compute_mode <= _pe_array_7_5_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_5.io.ifmap_i <= pe_array_7_4.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_5.io.weight_i <= pe_array_6_5.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_5_io_ipsum_T = bits(io.ipsum, 1983, 1952) @[Systolic_array.scala 36:48]
    node _pe_array_7_5_io_ipsum_T_1 = asSInt(_pe_array_7_5_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_5.io.ipsum <= _pe_array_7_5_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_61_T = asUInt(pe_array_7_5.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[61] <= _opsum_flat_61_T @[Systolic_array.scala 37:29]
    node _pe_array_7_6_io_compute_en_T = bits(io.compute_en, 62, 62) @[Systolic_array.scala 23:58]
    pe_array_7_6.io.compute_en <= _pe_array_7_6_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_6_io_read_en_T = bits(io.read_en, 62, 62) @[Systolic_array.scala 24:52]
    pe_array_7_6.io.read_en <= _pe_array_7_6_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_6_io_compute_mode_T = bits(io.compute_mode, 62, 62) @[Systolic_array.scala 25:62]
    pe_array_7_6.io.compute_mode <= _pe_array_7_6_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_6.io.ifmap_i <= pe_array_7_5.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_6.io.weight_i <= pe_array_6_6.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_6_io_ipsum_T = bits(io.ipsum, 2015, 1984) @[Systolic_array.scala 36:48]
    node _pe_array_7_6_io_ipsum_T_1 = asSInt(_pe_array_7_6_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_6.io.ipsum <= _pe_array_7_6_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_62_T = asUInt(pe_array_7_6.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[62] <= _opsum_flat_62_T @[Systolic_array.scala 37:29]
    node _pe_array_7_7_io_compute_en_T = bits(io.compute_en, 63, 63) @[Systolic_array.scala 23:58]
    pe_array_7_7.io.compute_en <= _pe_array_7_7_io_compute_en_T @[Systolic_array.scala 23:42]
    node _pe_array_7_7_io_read_en_T = bits(io.read_en, 63, 63) @[Systolic_array.scala 24:52]
    pe_array_7_7.io.read_en <= _pe_array_7_7_io_read_en_T @[Systolic_array.scala 24:39]
    node _pe_array_7_7_io_compute_mode_T = bits(io.compute_mode, 63, 63) @[Systolic_array.scala 25:62]
    pe_array_7_7.io.compute_mode <= _pe_array_7_7_io_compute_mode_T @[Systolic_array.scala 25:44]
    pe_array_7_7.io.ifmap_i <= pe_array_7_6.io.ifmap_o @[Systolic_array.scala 29:43]
    pe_array_7_7.io.weight_i <= pe_array_6_7.io.weight_o @[Systolic_array.scala 34:44]
    node _pe_array_7_7_io_ipsum_T = bits(io.ipsum, 2047, 2016) @[Systolic_array.scala 36:48]
    node _pe_array_7_7_io_ipsum_T_1 = asSInt(_pe_array_7_7_io_ipsum_T) @[Systolic_array.scala 36:71]
    pe_array_7_7.io.ipsum <= _pe_array_7_7_io_ipsum_T_1 @[Systolic_array.scala 36:37]
    node _opsum_flat_63_T = asUInt(pe_array_7_7.io.opsum) @[Systolic_array.scala 37:56]
    opsum_flat[63] <= _opsum_flat_63_T @[Systolic_array.scala 37:29]
    node io_opsum_lo_lo_lo_lo_lo = cat(opsum_flat[1], opsum_flat[0]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo_lo_hi = cat(opsum_flat[3], opsum_flat[2]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo_lo = cat(io_opsum_lo_lo_lo_lo_hi, io_opsum_lo_lo_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo_hi_lo = cat(opsum_flat[5], opsum_flat[4]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo_hi_hi = cat(opsum_flat[7], opsum_flat[6]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo_hi = cat(io_opsum_lo_lo_lo_hi_hi, io_opsum_lo_lo_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_lo = cat(io_opsum_lo_lo_lo_hi, io_opsum_lo_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_lo_lo = cat(opsum_flat[9], opsum_flat[8]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_lo_hi = cat(opsum_flat[11], opsum_flat[10]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_lo = cat(io_opsum_lo_lo_hi_lo_hi, io_opsum_lo_lo_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_hi_lo = cat(opsum_flat[13], opsum_flat[12]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_hi_hi = cat(opsum_flat[15], opsum_flat[14]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi_hi = cat(io_opsum_lo_lo_hi_hi_hi, io_opsum_lo_lo_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo_hi = cat(io_opsum_lo_lo_hi_hi, io_opsum_lo_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_lo = cat(io_opsum_lo_lo_hi, io_opsum_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_lo_lo = cat(opsum_flat[17], opsum_flat[16]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_lo_hi = cat(opsum_flat[19], opsum_flat[18]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_lo = cat(io_opsum_lo_hi_lo_lo_hi, io_opsum_lo_hi_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_hi_lo = cat(opsum_flat[21], opsum_flat[20]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_hi_hi = cat(opsum_flat[23], opsum_flat[22]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo_hi = cat(io_opsum_lo_hi_lo_hi_hi, io_opsum_lo_hi_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_lo = cat(io_opsum_lo_hi_lo_hi, io_opsum_lo_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_lo_lo = cat(opsum_flat[25], opsum_flat[24]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_lo_hi = cat(opsum_flat[27], opsum_flat[26]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_lo = cat(io_opsum_lo_hi_hi_lo_hi, io_opsum_lo_hi_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_hi_lo = cat(opsum_flat[29], opsum_flat[28]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_hi_hi = cat(opsum_flat[31], opsum_flat[30]) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi_hi = cat(io_opsum_lo_hi_hi_hi_hi, io_opsum_lo_hi_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi_hi = cat(io_opsum_lo_hi_hi_hi, io_opsum_lo_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo_hi = cat(io_opsum_lo_hi_hi, io_opsum_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_lo = cat(io_opsum_lo_hi, io_opsum_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_lo_lo = cat(opsum_flat[33], opsum_flat[32]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_lo_hi = cat(opsum_flat[35], opsum_flat[34]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_lo = cat(io_opsum_hi_lo_lo_lo_hi, io_opsum_hi_lo_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_hi_lo = cat(opsum_flat[37], opsum_flat[36]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_hi_hi = cat(opsum_flat[39], opsum_flat[38]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo_hi = cat(io_opsum_hi_lo_lo_hi_hi, io_opsum_hi_lo_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_lo = cat(io_opsum_hi_lo_lo_hi, io_opsum_hi_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_lo_lo = cat(opsum_flat[41], opsum_flat[40]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_lo_hi = cat(opsum_flat[43], opsum_flat[42]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_lo = cat(io_opsum_hi_lo_hi_lo_hi, io_opsum_hi_lo_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_hi_lo = cat(opsum_flat[45], opsum_flat[44]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_hi_hi = cat(opsum_flat[47], opsum_flat[46]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi_hi = cat(io_opsum_hi_lo_hi_hi_hi, io_opsum_hi_lo_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo_hi = cat(io_opsum_hi_lo_hi_hi, io_opsum_hi_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_lo = cat(io_opsum_hi_lo_hi, io_opsum_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_lo_lo = cat(opsum_flat[49], opsum_flat[48]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_lo_hi = cat(opsum_flat[51], opsum_flat[50]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_lo = cat(io_opsum_hi_hi_lo_lo_hi, io_opsum_hi_hi_lo_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_hi_lo = cat(opsum_flat[53], opsum_flat[52]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_hi_hi = cat(opsum_flat[55], opsum_flat[54]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo_hi = cat(io_opsum_hi_hi_lo_hi_hi, io_opsum_hi_hi_lo_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_lo = cat(io_opsum_hi_hi_lo_hi, io_opsum_hi_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_lo_lo = cat(opsum_flat[57], opsum_flat[56]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_lo_hi = cat(opsum_flat[59], opsum_flat[58]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_lo = cat(io_opsum_hi_hi_hi_lo_hi, io_opsum_hi_hi_hi_lo_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_hi_lo = cat(opsum_flat[61], opsum_flat[60]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_hi_hi = cat(opsum_flat[63], opsum_flat[62]) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi_hi = cat(io_opsum_hi_hi_hi_hi_hi, io_opsum_hi_hi_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi_hi = cat(io_opsum_hi_hi_hi_hi, io_opsum_hi_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi_hi = cat(io_opsum_hi_hi_hi, io_opsum_hi_hi_lo) @[Systolic_array.scala 41:28]
    node io_opsum_hi = cat(io_opsum_hi_hi, io_opsum_hi_lo) @[Systolic_array.scala 41:28]
    node _io_opsum_T = cat(io_opsum_hi, io_opsum_lo) @[Systolic_array.scala 41:28]
    io.opsum <= _io_opsum_T @[Systolic_array.scala 41:14]

