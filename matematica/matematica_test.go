package matematica

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSoma(t *testing.T) {
	resultado := Soma(5, 5)
	esperado := 10
	assert.Equal(t, esperado, resultado, "Soma(5, 5) deveria ser 10")
}
