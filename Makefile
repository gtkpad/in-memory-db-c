# Compilador e flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDFLAGS = -lpthread  # Adicionei pthread para o thread_pool

# Diretórios
SRC_DIR = .
BUILD_DIR = build
BIN_DIR = bin
PREFIX = /usr/local  # Diretório padrão de instalação

# Arquivos fonte
CLIENT_SRC = $(SRC_DIR)/client.cpp
SERVER_SRC = $(SRC_DIR)/server.cpp
HASHTABLE_SRC = $(SRC_DIR)/hashtable.cpp
AVL_SRC = $(SRC_DIR)/avl.cpp
ZSET_SRC = $(SRC_DIR)/zset.cpp
THREAD_POOL_SRC = $(SRC_DIR)/thread_pool.cpp
HEAP_SRC = $(SRC_DIR)/heap.cpp  # Adicionado heap.cpp

# Arquivos objeto
CLIENT_OBJ = $(BUILD_DIR)/client.o
SERVER_OBJ = $(BUILD_DIR)/server.o
HASHTABLE_OBJ = $(BUILD_DIR)/hashtable.o
AVL_OBJ = $(BUILD_DIR)/avl.o
ZSET_OBJ = $(BUILD_DIR)/zset.o
THREAD_POOL_OBJ = $(BUILD_DIR)/thread_pool.o
HEAP_OBJ = $(BUILD_DIR)/heap.o  # Adicionado heap.o

# Binários
CLIENT_BIN = $(BIN_DIR)/client
SERVER_BIN = $(BIN_DIR)/server

# Alvo padrão
all: $(CLIENT_BIN) $(SERVER_BIN)

# Compilação do cliente
$(CLIENT_BIN): $(CLIENT_OBJ) $(HASHTABLE_OBJ) $(AVL_OBJ) $(ZSET_OBJ)
		@mkdir -p $(BIN_DIR)
		$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# Compilação do servidor
$(SERVER_BIN): $(SERVER_OBJ) $(HASHTABLE_OBJ) $(AVL_OBJ) $(ZSET_OBJ) $(THREAD_POOL_OBJ) $(HEAP_OBJ)
		@mkdir -p $(BIN_DIR)
		$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

# Compilação dos arquivos objeto
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
		@mkdir -p $(BUILD_DIR)
		$(CXX) $(CXXFLAGS) -c $< -o $@

# Instalação dos binários
install: all
		@mkdir -p $(PREFIX)/bin
		install -m 755 $(CLIENT_BIN) $(PREFIX)/bin
		install -m 755 $(SERVER_BIN) $(PREFIX)/bin
		@echo "Binários instalados em $(PREFIX)/bin"

# Limpeza
clean:
		rm -rf $(BUILD_DIR) $(BIN_DIR)

# Phony targets
.PHONY: all clean install