#include <verilated.h>  // Include common routines

#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

#include "VSystolicArray.h"
#include "verilated_vcd_c.h"


#define step(dut, fp, time)   \
    (fp)->dump(time);         \
    (time) += CYCLE / 2;      \
    (dut)->clk = !(dut)->clk; \
    (dut)->eval();

#define set_signal(dut, signal, value) \
    (signal) = (value);                \
    (dut)->eval();

void transaction (VSystolicArray* dut, ) {
    // transaction
}

void value_assign (vector <vector <uint8_t>>& matrix_A, vector <vector <uint8_t>>& matrix_B) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            matrix_A[i][j] = 128 - 32 + i * 8 + j;  // Assign values like 96, 97, 98, ..., 159
            matrix_B[i][j] = i * 8 + j;  // Assign values like 0, 1, 2, ..., 63
        }
    }
}

void compute_en_matrix (int compute_en_matrix[], int compute_step) {
    for (int i = 0; i < 8; i++) {
        if (i == compute_step) {
            compute_en_matrix[i] = 1;
        } else {
            compute_en_matrix[i] = 0;
        }
    }
}

int main(int argc, char** argv) {


    Verilated::traceEverOn(true);
    VerilatedVcdC* fp = new VerilatedVcdC();

    auto dut = new VPE;
    dut->trace(fp, 99);
    fp->open("build/SystolicArray_wave.vcd");

    int time = 0;
    dut->reset = 1;
    dut->clock = 0;

    vector <vector <uint8_t>> matrix_A (8, vector <uint8_t> (8));
    vector <vector <int8_t>> matrix_B (8, vector <uint8_t> (8));
    int compute_en_matrix[8] = {0};
    int compute_step = 0;

    // Assign vaues to matrix_A and matrix_B
    value_assign (matrix_A, matrix_B);
    cal_compute_en(compute_en_matrix, compute_step);

    // Simulate until time_out or opsum_end
    while (time <= 100000) {
        step(dut, fp, time);
        dut->reset = 0;
        if (!dut->clock) {
            transaction(dut, );
        }
        dut->eval();
        if () break;
    }


    fp->close();
    dut->final();
    delete dut;
    return 0;
}
