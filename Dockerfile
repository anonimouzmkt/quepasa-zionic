# Dockerfile otimizado para Railway
FROM golang:1.24-alpine AS builder

# Instalar dependências necessárias para build
RUN apk add --no-cache git ca-certificates

WORKDIR /app

# Copiar arquivos go.mod e go.sum primeiro para cache de dependências
COPY src/go.mod src/go.sum ./

# Baixar dependências
RUN go mod download

# Copiar código fonte
COPY src/ ./

# Compilar a aplicação
RUN CGO_ENABLED=1 GOOS=linux go build -a -installsuffix cgo -o main .

# Stage final - imagem de produção
FROM alpine:latest

# Instalar ffmpeg e outras dependências necessárias
RUN apk add --no-cache \
    ffmpeg \
    ca-certificates \
    tzdata \
    && rm -rf /var/cache/apk/*

# Criar usuário não-root
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

WORKDIR /app

# Copiar binário do builder
COPY --from=builder /app/main .

# Copiar script de inicialização
COPY railway-start.sh .
RUN chmod +x railway-start.sh

# Copiar assets necessários
COPY src/assets ./assets
COPY src/views ./views

# Mudar para usuário não-root
USER appuser

# Expor porta
EXPOSE 31000

# Comando para executar
CMD ["./railway-start.sh"]
