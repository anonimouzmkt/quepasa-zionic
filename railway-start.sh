#!/bin/sh

# Script de inicialização para Railway
echo "🚀 Iniciando QuePasa no Railway..."

# Verificar variáveis essenciais
if [ -z "$SIGNING_SECRET" ]; then
    echo "❌ ERRO: SIGNING_SECRET não configurada!"
    exit 1
fi

if [ -z "$MASTERKEY" ]; then
    echo "❌ ERRO: MASTERKEY não configurada!"
    exit 1
fi

# Verificar conexão com banco PostgreSQL
if [ -z "$PGHOST" ] || [ -z "$PGDATABASE" ]; then
    echo "❌ ERRO: Variáveis do PostgreSQL não encontradas!"
    echo "Certifique-se de ter adicionado o plugin PostgreSQL ao projeto."
    exit 1
fi

echo "✅ Configurações validadas!"
echo "🌐 Servidor iniciando na porta $PORT..."

# Executar a aplicação
exec ./main
