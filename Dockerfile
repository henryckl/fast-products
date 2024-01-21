FROM golang:1.21


# Define as variáveis para a versão, sistema operacional e arquitetura
# Substitua estes valores conforme necessário
ARG version=v4.15.1
ARG os=linux
ARG arch=amd64

# Instala curl
RUN apt-get update && \
    apt-get install -y curl

# Baixa e descompacta o migrate
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/${version}/migrate.${os}-${arch}.tar.gz | tar xvz

# Move o binário para um local no PATH
RUN mv migrate /usr/local/bin/migrate


WORKDIR /app

# Instalar o gopls
RUN go install golang.org/x/tools/gopls@latest
# Instalar o Delve
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Adicionar /go/bin ao PATH para acessar facilmente o gopls
ENV PATH="${PATH}:/go/bin"

# Install SQLc
RUN go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
# Mantém o container em execução
CMD ["tail", "-f", "/dev/null"]
