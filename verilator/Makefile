SRC = $(wildcard ../src/SystolicArray.v)

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

VERILATOR_FLAGS += --cc --exe
CXXFLAGS += -g
CXXFLAGS += -I/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/include/python3.10 \
           -I/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib/python3.10/site-packages/numpy/_core/include

LDFLAGS += -L/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib -lpython3.10 \
          -Wl,-rpath,/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib

# Optimize
# VERILATOR_FLAGS += -x-assign fast

# Warn abount lint issues; may not want this on less solid designs
# VERILATOR_FLAGS += -Wall
# VERILATOR_FLAGS += -Wall -Wno-lint

# Automatically build the Verilated model
VERILATOR_FLAGS += --build

# Make waveforms
VERILATOR_FLAGS += --trace
VERILATOR_FLAGS += --trace-max-array 1024

# Run Verilator in debug mode
# VERILATOR_FLAGS += --debug

LOG_FILE ?= logs/terminal_text.log

######################################################################
default: all

.PHONY: all

run:
	@echo
	@echo "-- Verilator Start"

	@echo
	@echo "-- VERILATE ----------------"
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)

	@echo
	@echo "-- RUN ---------------------"
	@rm -rf logs
	@mkdir -p logs
	obj_dir/VPE_array +trace > $(LOG_FILE)

	@echo
	@echo "-- DONE --------------------"
	@echo "To see waveforms, open PE_wave.vcd in a waveform viewer"
	@echo

######################################################################
# Specific Testbench Targets
# Pass TB_select as a parameter to the simulation executable
.PHONY: sa0

sa0: VERILATOR_FLAGS += -CFLAGS -DTB_PE=0
sa0: VERILATOR_INPUT = $(SRC) ./test_systolic_array.cpp
sa0: LOG_FILE = logs/systolic_array.log
sa0: run
	@chmod 666 ./test_systolic_array.cpp


######################################################################
# Other targets

format:
	clang-format -i testbench/*.cpp testbench/*.h
	@chmod 666 ./testbench/*.cpp
	@chmod 666 ./testbench/*.h
show-config:
	$(VERILATOR) -V

maintainer-copy::
clean mostlyclean distclean maintainer-clean::
	-rm -rf obj_dir logs *.log *.dmp *.vpd *.vcd *.fsdb coverage.dat core
