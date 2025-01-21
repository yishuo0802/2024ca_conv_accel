#include <Python.h>
#include <vector>
#include <iostream>
#include <string>

using namespace std;

template<typename T>
void load_array_from_python(const string& file_name, const string& func_name, const string& arg,
                             vector<vector<vector<vector<T> > > >& ifmap, vector<vector<vector<vector<T> > > >& weight) {
    // 初始化 Python 解釋器
    Py_Initialize();

    PyRun_SimpleString("import sys");
    PyRun_SimpleString("sys.path.append('../software')");

    // 加載 Python 模組
    PyObject* pName = PyUnicode_DecodeFSDefault(file_name.c_str());
    PyObject* pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    if (pModule) {
        // 獲取 Python 函數
        PyObject* pFunc = PyObject_GetAttrString(pModule, func_name.c_str());

        if (pFunc && PyCallable_Check(pFunc)) {
            // 構造 Python 函數的參數
            PyObject* pArgs = PyTuple_New(1);
            PyObject* pArg = PyUnicode_FromString(arg.c_str());
            PyTuple_SetItem(pArgs, 0, pArg);

            // 調用函數
            PyObject* pValue = PyObject_CallObject(pFunc, pArgs);
            Py_DECREF(pArgs);

            if (pValue && PyTuple_Check(pValue) && PyTuple_Size(pValue) == 2) {
                // 解析第一個 4D array
                PyObject* pyArray1 = PyTuple_GetItem(pValue, 0);
                size_t dim1 = PyList_Size(pyArray1);
                ifmap.resize(dim1);
                for (size_t i = 0; i < dim1; ++i) {
                    PyObject* pSubList1 = PyList_GetItem(pyArray1, i);
                    size_t dim2 = PyList_Size(pSubList1);
                    ifmap[i].resize(dim2);
                    for (size_t j = 0; j < dim2; ++j) {
                        PyObject* pSubList2 = PyList_GetItem(pSubList1, j);
                        size_t dim3 = PyList_Size(pSubList2);
                        ifmap[i][j].resize(dim3);
                        for (size_t k = 0; k < dim3; ++k) {
                            PyObject* pSubList3 = PyList_GetItem(pSubList2, k);
                            size_t dim4 = PyList_Size(pSubList3);
                            ifmap[i][j][k].resize(dim4);
                            for (size_t l = 0; l < dim4; ++l) {
                                PyObject* pElem = PyList_GetItem(pSubList3, l);
                                ifmap[i][j][k][l] = static_cast<T>(PyLong_AsLong(pElem));
                            }
                        }
                    }
                }

                // 解析第二個 4D array
                PyObject* pyArray2 = PyTuple_GetItem(pValue, 1);
                dim1 = PyList_Size(pyArray2);
                weight.resize(dim1);
                for (size_t i = 0; i < dim1; ++i) {
                    PyObject* pSubList1 = PyList_GetItem(pyArray2, i);
                    size_t dim2 = PyList_Size(pSubList1);
                    weight[i].resize(dim2);
                    for (size_t j = 0; j < dim2; ++j) {
                        PyObject* pSubList2 = PyList_GetItem(pSubList1, j);
                        size_t dim3 = PyList_Size(pSubList2);
                        weight[i][j].resize(dim3);
                        for (size_t k = 0; k < dim3; ++k) {
                            PyObject* pSubList3 = PyList_GetItem(pSubList2, k);
                            size_t dim4 = PyList_Size(pSubList3);
                            weight[i][j][k].resize(dim4);
                            for (size_t l = 0; l < dim4; ++l) {
                                PyObject* pElem = PyList_GetItem(pSubList3, l);
                                weight[i][j][k][l] = static_cast<T>(PyLong_AsLong(pElem));
                            }
                        }
                    }
                }

                Py_DECREF(pValue);
            } else {
                PyErr_Print();
            }
        } else {
            PyErr_Print();
        }

        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
    } else {
        PyErr_Print();
    }

    // 終止 Python 解釋器
    Py_Finalize();
}

int main() {
    vector<vector<vector<vector<int> > > > ifmap, weight;
    string arg = "conv1.0"; // 示例參數

    load_array_from_python("main", "send_tile_matrix", arg, ifmap, weight);

    // 打印結果
    cout << "Loaded tile_ifmap tile_weight from Python:\n";

    cout << "Ifmap:\n";
    for (size_t i = 0; i < ifmap.size(); ++i) {
        for (size_t j = 0; j < ifmap[i].size(); ++j) {
            for (size_t k = 0; k < ifmap[i][j].size(); ++k) {
                for (size_t l = 0; l < ifmap[i][j][k].size(); ++l) {
                    cout << ifmap[i][j][k][l] << " ";
                }
                cout << "| ";
            }
            cout << endl;
        }
        cout << endl;
    }

    cout << "Weight:\n";
    for (size_t i = 0; i < weight.size(); ++i) {
        for (size_t j = 0; j < weight[i].size(); ++j) {
            for (size_t k = 0; k < weight[i][j].size(); ++k) {
                for (size_t l = 0; l < weight[i][j][k].size(); ++l) {
                    cout << weight[i][j][k][l] << " ";
                }
                cout << "| ";
            }
            cout << endl;
        }
        cout << endl;
    }

    return 0;
}
