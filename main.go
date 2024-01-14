package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

const (
	host     = "host.docker.internal"
	port     = 5432
	user     = "postgres"
	password = "your-postgres-password"
	dbname   = "products"
)

func main() {
	// Construa a string de conexão
	connStr := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)

	// Abra uma conexão com o banco de dados
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Teste a conexão
	err = db.Ping()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Conexão com o banco de dados PostgreSQL estabelecida com sucesso!")

	// Aqui você pode realizar operações no banco de dados usando o objeto 'db'
	// por exemplo, criar tabelas, realizar consultas, etc.
}
