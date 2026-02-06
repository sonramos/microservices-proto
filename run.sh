#!/bin/bash

# Script para gerar os stubs Go a partir dos arquivos .proto
# Modifique os parâmetros abaixo conforme necessário

GITHUB_USERNAME="sonramos"
GITHUB_EMAIL="sonramos@users.noreply.github.com"

# Diretório raiz do projeto (onde está microservices-proto)
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"

# Instalar protoc se não estiver instalado
if ! command -v protoc &> /dev/null; then
    echo "Instalando protoc..."
    PROTOC_VERSION="25.1"
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        PROTOC_ARCH="linux-x86_64"
    elif [ "$ARCH" = "aarch64" ]; then
        PROTOC_ARCH="linux-aarch_64"
    fi
    curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-${PROTOC_ARCH}.zip"
    sudo unzip -o "protoc-${PROTOC_VERSION}-${PROTOC_ARCH}.zip" -d /usr/local
    rm -f "protoc-${PROTOC_VERSION}-${PROTOC_ARCH}.zip"
fi

# Instalar plugins Go para protoc
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Adicionar GOPATH/bin ao PATH
export PATH="$PATH:$(go env GOPATH)/bin"

# Criar diretório de saída
mkdir -p "$PROJECT_ROOT/golang/order"

# Gerar código Go a partir do .proto
protoc \
    --proto_path="$PROJECT_ROOT" \
    --go_out="$PROJECT_ROOT" \
    --go-grpc_out="$PROJECT_ROOT" \
    "$PROJECT_ROOT/order/order.proto"

echo "Stubs Go gerados com sucesso em golang/order/"
