# Variáveis para configuração
MIGRATIONS_PATH = migrations/
DATABASE_URL=postgres://postgres:your-postgres-password@postgres-products:5432/products?sslmode=disable

.PHONY: migrate-up migrate-down create-migration

# Executa todas as migrações
migrate-up:
	migrate -path $(MIGRATIONS_PATH) -database "$(DATABASE_URL)" up

# Reverte todas as migrações
migrate-down:
	migrate -path $(MIGRATIONS_PATH) -database "$(DATABASE_URL)" down

# Executa uma migração específica
migrate-up-one:
	migrate -path $(MIGRATIONS_PATH) -database "$(DATABASE_URL)" up 1

# Reverte uma migração específica
migrate-down-one:
	migrate -path $(MIGRATIONS_PATH) -database "$(DATABASE_URL)" down 1

create-migration:
	@read -p "Enter migration name: " migration_name; \
	migrate create -ext sql -dir $(MIGRATIONS_PATH) -seq $$migration_name