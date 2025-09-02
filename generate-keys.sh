#!/bin/bash

echo "Gerando chaves seguras para o QuePasa..."
echo ""

# Gerar SIGNING_SECRET
SIGNING_SECRET=$(openssl rand -hex 32)
echo "SIGNING_SECRET: $SIGNING_SECRET"

# Gerar MASTERKEY
MASTERKEY=$(openssl rand -hex 32)
echo "MASTERKEY: $MASTERKEY"

echo ""
echo "============================================"
echo "INSTRUÇÕES PARA RAILWAY:"
echo "============================================"
echo "1. Copie essas chaves para as variáveis de ambiente do Railway:"
echo "   - SIGNING_SECRET = $SIGNING_SECRET"
echo "   - MASTERKEY = $MASTERKEY"
echo ""
echo "2. No painel do Railway, vá para:"
echo "   Project > Variables"
echo ""
echo "3. Adicione essas variáveis de ambiente"
echo "============================================"
