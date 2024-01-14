FROM golang:1.21

WORKDIR /app

# Instalar o gopls
RUN go install golang.org/x/tools/gopls@latest
# Instalar o Delve
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Adicionar /go/bin ao PATH para acessar facilmente o gopls
ENV PATH="${PATH}:/go/bin"

# Mantém o container em execução
CMD ["tail", "-f", "/dev/null"]
