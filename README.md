# In-Memory Database in C++

_[English](#english) | [Português](#português-brasil)_

<a name="english"></a>

## English

An in-memory database inspired by Redis, implemented in C++ using a client-server architecture.

### Key Features

- In-memory key-value storage
- Commands for basic operations (`GET`, `SET`, `DEL`)
- Sorted sets (`ZSET`) with AVL tree implementation
- TTL (Time-To-Live) support for key expiration
- Hash table for fast indexing
- Thread pool for operations requiring intensive processing
- TCP client-server communication
- Non-blocking event-based architecture

### Project Structure

- `avl.h/cpp`: Balanced AVL tree implementation
- `zset.h/cpp`: Sorted sets implementation
- `hashtable.h/cpp`: Hash table for storage
- `heap.h/cpp`: Heap implementation for TTL management
- `thread_pool.h/cpp`: Thread pool for parallel operations
- `list.h`: Doubly linked list for connection management
- `server.cpp`: Server implementation
- `client.cpp`: Client for server communication
- `common.h`: Shared utilities

### Compilation

The project uses a Makefile for compilation. Run:

```bash
make
```

This will generate client and server binaries in the `bin/` directory.

### Installation

#### Prerequisites

- C++ compiler with C++17 support
- pthread library
- Make

#### Local Compilation

To compile the project locally:

```bash
git clone https://github.com/gtkpad/in-memory-db-c.git
cd in-memory-db-c
make
```

#### Global Installation

To install the binaries globally on the system (requires administrator permissions):

```bash
sudo make install
```

This will install the client and server in `/usr/local/bin`.

#### Custom Directory Installation

To install in a different directory:

```bash
make
PREFIX=/custom/path sudo make install
```

### Usage

#### Starting the Server

By default, the server listens on port 1234.

```bash
./bin/server
```

#### Using the Client

```bash
./bin/client [command] [arguments]
```

### Supported Commands

#### Basic Operations

- **GET**: Retrieves the value of a key

  ```bash
  ./bin/client get key
  ```

- **SET**: Sets the value of a key

  ```bash
  ./bin/client set key value
  ```

- **DEL**: Removes a key

  ```bash
  ./bin/client del key
  ```

- **KEYS**: Lists all keys
  ```bash
  ./bin/client keys
  ```

#### Key Expiration

- **PEXPIRE**: Sets an expiration time (in milliseconds)

  ```bash
  ./bin/client pexpire key 30000
  ```

- **PTTL**: Gets the remaining expiration time
  ```bash
  ./bin/client pttl key
  ```

#### Operations with Sorted Sets (ZSET)

- **ZADD**: Adds an element to the sorted set

  ```bash
  ./bin/client zadd set score element
  ```

- **ZREM**: Removes an element from the sorted set

  ```bash
  ./bin/client zrem set element
  ```

- **ZSCORE**: Gets the score of an element

  ```bash
  ./bin/client zscore set element
  ```

- **ZQUERY**: Queries elements by score
  ```bash
  ./bin/client zquery set score element offset limit
  ```

### Implementation Details

- Uses hash tables for fast data access
- Sorted sets implemented with AVL trees for efficient queries
- TTL system based on min heap for efficient expiration
- Non-blocking I/O architecture using `poll()` for high concurrency
- Thread pool for heavy operations, avoiding blocking of the main loop

### Technical Features

- String and sorted set storage
- Command pipelining support
- Efficient connection management with idle timers
- Progressive hash table rehashing to avoid pauses during resizing

This project demonstrates advanced concepts in C++ programming and data structures, being useful for understanding the implementation of in-memory databases and cache systems.

---

<a name="português-brasil"></a>

## Português (Brasil)

Um banco de dados em memória inspirado no Redis, implementado em C++ utilizando arquitetura cliente-servidor.

### Características principais

- Armazenamento de pares chave-valor em memória
- Comandos para operações básicas (`GET`, `SET`, `DEL`)
- Conjuntos ordenados (`ZSET`) com implementação de árvore AVL
- Suporte a TTL (Time-To-Live) para expiração de chaves
- Tabela hash para indexação rápida
- Pool de threads para operações que exigem processamento intensivo
- Comunicação cliente-servidor via TCP
- Arquitetura não-bloqueante baseada em eventos

### Estrutura do projeto

- `avl.h/cpp`: Implementação de árvore AVL balanceada
- `zset.h/cpp`: Implementação de conjuntos ordenados
- `hashtable.h/cpp`: Tabela hash para armazenamento
- `heap.h/cpp`: Implementação de heap para gerenciamento de TTL
- `thread_pool.h/cpp`: Pool de threads para operações paralelas
- `list.h`: Lista duplamente encadeada para gerenciamento de conexões
- `server.cpp`: Implementação do servidor
- `client.cpp`: Cliente para comunicação com o servidor
- `common.h`: Utilitários compartilhados

### Compilação

O projeto utiliza um Makefile para compilação. Execute:

```bash
make
```

Isso irá gerar os binários do cliente e do servidor no diretório `bin/`.

### Instalação

#### Pré-requisitos

- Compilador C++ com suporte a C++17
- Biblioteca pthread
- Make

#### Compilação local

Para compilar o projeto localmente:

```bash
git clone https://github.com/gtkpad/in-memory-db-c.git
cd in-memory-db-c
make
```

#### Instalação global

Para instalar os binários globalmente no sistema (requer permissões de administrador):

```bash
sudo make install
```

Isso instalará o cliente e o servidor em `/usr/local/bin`.

#### Instalação em diretório personalizado

Para instalar em um diretório diferente:

```bash
make
PREFIX=/caminho/personalizado sudo make install
```

### Uso

#### Iniciando o servidor

Por padrão, o servidor escuta na porta 1234.

```bash
./bin/server
```

#### Usando o cliente

```bash
./bin/client [comando] [argumentos]
```

### Comandos suportados

#### Operações básicas

- **GET**: Recupera o valor de uma chave

  ```bash
  ./bin/client get chave
  ```

- **SET**: Define o valor de uma chave

  ```bash
  ./bin/client set chave valor
  ```

- **DEL**: Remove uma chave

  ```bash
  ./bin/client del chave
  ```

- **KEYS**: Lista todas as chaves
  ```bash
  ./bin/client keys
  ```

#### Expiração de chaves

- **PEXPIRE**: Define um tempo de expiração (em milissegundos)

  ```bash
  ./bin/client pexpire chave 30000
  ```

- **PTTL**: Obtém o tempo restante de expiração
  ```bash
  ./bin/client pttl chave
  ```

#### Operações com conjuntos ordenados (ZSET)

- **ZADD**: Adiciona um elemento ao conjunto ordenado

  ```bash
  ./bin/client zadd conjunto pontuação elemento
  ```

- **ZREM**: Remove um elemento do conjunto ordenado

  ```bash
  ./bin/client zrem conjunto elemento
  ```

- **ZSCORE**: Obtém a pontuação de um elemento

  ```bash
  ./bin/client zscore conjunto elemento
  ```

- **ZQUERY**: Consulta elementos por pontuação
  ```bash
  ./bin/client zquery conjunto pontuação elemento offset limite
  ```

### Detalhes de implementação

- Utiliza tabelas hash para acesso rápido aos dados
- Conjuntos ordenados implementados com árvores AVL para consultas eficientes
- Sistema de TTL baseado em heap mínimo para expiração eficiente
- Arquitetura de E/S não-bloqueante usando `poll()` para alta concorrência
- Pool de threads para operações pesadas, evitando bloqueio do loop principal

### Características técnicas

- Armazenamento de strings e conjuntos ordenados
- Suporte a pipelining de comandos
- Gerenciamento eficiente de conexões com temporizadores de inatividade
- Rehashing progressivo da tabela hash para evitar pausas durante o redimensionamento

Este projeto demonstra conceitos avançados de programação em C++ e estruturas de dados, sendo útil para entender a implementação de bancos de dados em memória e sistemas de cache.
