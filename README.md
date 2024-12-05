# **Documentação da API Games Shelf API**

Esta é uma API RESTful para gerenciar usuários, listas e avaliações de jogos. A API permite criar, visualizar, atualizar e excluir recursos.

---

## **Base URL**
```
https://games-shelf-api.fly.dev/users
```

---

## **Entidades**

### **Usuário**
- **Atributos**:
  - `id` (integer): Identificador único.
  - `email` (string): Email do usuário (único).
  - `password` (string): Senha do usuário (criptografada internamente como `password_digest`).
  - `name` (string): Nome do usuário.

### **Lista**
- **Atributos**:
  - `id` (integer): Identificador único.
  - `name` (string): Nome da lista.
  - `user_id` (integer): Referência ao usuário que possui a lista.

### **Avaliação**
- **Atributos**:
  - `id` (integer): Identificador único.
  - `rating` (integer): Nota do jogo (de 1 a 10).
  - `game_name` (string): Nome do jogo.
  - `user_id` (integer): Referência ao usuário que fez a avaliação.

---

## **Rotas e Exemplos de Requisições**

### **Usuários**

#### **1. Criar um Usuário**
- **Endpoint**: `POST /users`
- **Exemplo de Requisição**:
  ```bash
  curl -X POST http://localhost:3000/users \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com", "password":"password123", "name":"John Doe"}'
  ```
- **Resposta** (HTTP 201):
  ```json
  {
    "id": 1,
    "email": "user@example.com",
    "name": "John Doe"
  }
  ```

#### **2. Listar todos os Usuários**
- **Endpoint**: `GET /users`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/users
  ```
- **Resposta** (HTTP 200):
  ```json
  [
    {
      "id": 1,
      "email": "user@example.com",
      "name": "John Doe"
    }
  ]
  ```

#### **3. Obter um Usuário específico**
- **Endpoint**: `GET /users/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/users/1
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "email": "user@example.com",
    "name": "John Doe"
  }
  ```

#### **4. Atualizar um Usuário**
- **Endpoint**: `PUT /users/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X PUT http://localhost:3000/users/1 \
  -H "Content-Type: application/json" \
  -d '{"email":"updated_user@example.com", "name":"Updated Name"}'
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "email": "updated_user@example.com",
    "name": "Updated Name"
  }
  ```

#### **5. Excluir um Usuário**
- **Endpoint**: `DELETE /users/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X DELETE http://localhost:3000/users/1
  ```
- **Resposta** (HTTP 204):
  Nenhum conteúdo.

---

### **Listas**

#### **1. Criar uma Lista**
- **Endpoint**: `POST /users/:user_id/lists`
- **Exemplo de Requisição**:
  ```bash
  curl -X POST http://localhost:3000/users/1/lists \
  -H "Content-Type: application/json" \
  -d '{"name":"Minha Lista"}'
  ```
- **Resposta** (HTTP 201):
  ```json
  {
    "id": 1,
    "name": "Minha Lista",
    "user_id": 1
  }
  ```

#### **2. Listar todas as Listas de um Usuário**
- **Endpoint**: `GET /users/:user_id/lists`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/users/1/lists
  ```
- **Resposta** (HTTP 200):
  ```json
  [
    {
      "id": 1,
      "name": "Minha Lista",
      "user_id": 1
    }
  ]
  ```

#### **3. Obter uma Lista específica**
- **Endpoint**: `GET /lists/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/lists/1
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "name": "Minha Lista",
    "user_id": 1
  }
  ```

#### **4. Atualizar uma Lista**
- **Endpoint**: `PUT /lists/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X PUT http://localhost:3000/lists/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Lista Atualizada"}'
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "name": "Lista Atualizada",
    "user_id": 1
  }
  ```

#### **5. Excluir uma Lista**
- **Endpoint**: `DELETE /lists/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X DELETE http://localhost:3000/lists/1
  ```
- **Resposta** (HTTP 204):
  Nenhum conteúdo.

---

### **Avaliações**

#### **1. Criar uma Avaliação**
- **Endpoint**: `POST /users/:user_id/evaluations`
- **Exemplo de Requisição**:
  ```bash
  curl -X POST http://localhost:3000/users/1/evaluations \
  -H "Content-Type: application/json" \
  -d '{"rating":9, "game_name":"The Legend of Zelda"}'
  ```
- **Resposta** (HTTP 201):
  ```json
  {
    "id": 1,
    "rating": 9,
    "game_name": "The Legend of Zelda",
    "user_id": 1
  }
  ```

#### **2. Listar todas as Avaliações de um Usuário**
- **Endpoint**: `GET /users/:user_id/evaluations`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/users/1/evaluations
  ```
- **Resposta** (HTTP 200):
  ```json
  [
    {
      "id": 1,
      "rating": 9,
      "game_name": "The Legend of Zelda",
      "user_id": 1
    }
  ]
  ```

#### **3. Obter uma Avaliação específica**
- **Endpoint**: `GET /evaluations/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X GET http://localhost:3000/evaluations/1
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "rating": 9,
    "game_name": "The Legend of Zelda",
    "user_id": 1
  }
  ```

#### **4. Atualizar uma Avaliação**
- **Endpoint**: `PUT /evaluations/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X PUT http://localhost:3000/evaluations/1 \
  -H "Content-Type: application/json" \
  -d '{"rating":10, "game_name":"The Legend of Zelda: Updated"}'
  ```
- **Resposta** (HTTP 200):
  ```json
  {
    "id": 1,
    "rating": 10,
    "game_name": "The Legend of Zelda: Updated",
    "user_id": 1
  }
  ```

#### **5. Excluir uma Avaliação**
- **Endpoint**: `DELETE /evaluations/:id`
- **Exemplo de Requisição**:
  ```bash
  curl -X DELETE http://localhost:3000/evaluations/1
  ```
- **Resposta** (HTTP 204):
  Nenhum conteúdo.

---
