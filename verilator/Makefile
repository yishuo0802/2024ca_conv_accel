# 編譯器
CXX = g++

# 編譯選項
CXXFLAGS = -I/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/include/python3.10 \
           -I/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib/python3.10/site-packages/numpy/_core/include

# 鏈接選項，包含動態庫的路徑和名稱
LDFLAGS = -L/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib -lpython3.10 \
          -Wl,-rpath,/opt/homebrew/Caskroom/miniconda/base/envs/ca2024/lib

# 目標執行檔名稱
TARGET = main.out

# 原始碼檔案
SRC = main.cpp

# 編譯目標
all: $(TARGET)
	@echo "Running $(TARGET)..."
	./$(TARGET) > output.log

$(TARGET): $(SRC)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS)

# 清理編譯產物
clean:
	rm -f $(TARGET)
