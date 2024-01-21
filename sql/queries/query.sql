
-- name: ListUsers :many
SELECT * FROM users;

-- name: CreateUser :one
INSERT INTO users (id, email, password) VALUES ($1, $2, $3) RETURNING id;