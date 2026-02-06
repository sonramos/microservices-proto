# Microservices Proto

Definições Protocol Buffers e stubs Go gerados para os microserviços Order, Payment e Shipping.

## Estrutura

```
microservices-proto/
├── order/
│   └── order.proto          # Definição do serviço Order
├── payment/
│   └── payment.proto        # Definição do serviço Payment
├── shipping/
│   └── shipping.proto       # Definição do serviço Shipping
└── github/sonramos/microservices-proto/golang/
    ├── order/               # Stubs Go gerados
    ├── payment/             # Stubs Go gerados
    └── shipping/            # Stubs Go gerados
```

## Uso

### Importar nos microserviços

```go
import (
    "github.com/sonramos/microservices-proto/golang/order"
    "github.com/sonramos/microservices-proto/golang/payment"
    "github.com/sonramos/microservices-proto/golang/shipping"
)
```

### Regenerar stubs (se modificar .proto)

```bash
# Instalar protoc e plugins Go
# https://grpc.io/docs/languages/go/quickstart/

# Gerar stubs
protoc --proto_path=. \
  --go_out=. --go-grpc_out=. \
  order/order.proto

protoc --proto_path=. \
  --go_out=. --go-grpc_out=. \
  payment/payment.proto

protoc --proto_path=. \
  --go_out=. --go-grpc_out=. \
  shipping/shipping.proto
```

## Serviços

### Order
```protobuf
service Order {
  rpc Create(CreateOrderRequest) returns (CreateOrderResponse)
}
```

### Payment
```protobuf
service Payment {
  rpc Create(CreatePaymentRequest) returns (CreatePaymentResponse)
}
```

### Shipping
```protobuf
service Shipping {
  rpc Create(CreateShippingRequest) returns (CreateShippingResponse)
}
```

## Licença

Projeto acadêmico - IFPB Programação Distribuída
