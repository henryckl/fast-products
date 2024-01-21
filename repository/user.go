package repository

import (
	"context"
	"database/sql"

	"github.com/henryckl/fast-products/internal/models"
	_ "github.com/lib/pq"
)

type UserRepository struct {
	db *sql.DB
}

func NewUserRepository(db *sql.DB) *UserRepository {
	return &UserRepository{db}
}

func (ur *UserRepository) CreateUser(ctx context.Context, user *models.User) (string, error) {
	// Use the generated query from sqlc

	return "", nil
}
