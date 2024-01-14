package matematica

import (
	"testing"
)

func TestSoma(t *testing.T) {
	resultado := Soma(5, 5)
	esperado := 10
	if resultado != esperado {
		t.Errorf("Soma(5, 5) = %d; esperado %d", resultado, esperado)
	}
}
