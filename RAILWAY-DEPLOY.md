# 🚀 Deploy QuePasa no Railway

## 📋 Pré-requisitos
- Conta no [Railway](https://railway.app)
- Redis, PostgreSQL e RabbitMQ criados no Railway

## 🛠️ Configuração

### 1. Clone e prepare o projeto
```bash
git clone <seu-repo>
cd quepasa-zionic

# Os arquivos de configuração já estão prontos:
# - Dockerfile (otimizado para Railway)
# - nixpacks.toml (configurado)
# - .dockerignore (otimizado)
```

### 2. Deploy no Railway

1. **Conecte seu repositório** no Railway
2. **Configure as variáveis de ambiente**:
   - Copie todo o conteúdo do arquivo `env-railway.example`
   - Cole nas **Environment Variables** do Railway
3. **Configure o Build**:
   - **Source**: Dockerfile
   - **Dockerfile Path**: `Dockerfile`

### 3. ⚠️ IMPORTANTE - Troque as chaves de segurança
```bash
# GERE SUAS PRÓPRIAS CHAVES:
SIGNING_SECRET=gere-uma-chave-de-32-caracteres-aqui
MASTERKEY=sua-senha-admin-aqui
```

## 🔧 Configurações de Banco

### PostgreSQL
```env
DBDRIVER=postgres
DBHOST=postgres.railway.internal
DBDATABASE=railway
DBPORT=5432
DBUSER=postgres
DBPASSWORD=sua-senha-aqui
DBSSLMODE=require
```

### RabbitMQ
```env
RABBITMQ_CONNECTIONSTRING=amqp://usuario:senha@rabbitmq.railway.internal:5672
RABBITMQ_QUEUE=quepasa_messages
RABBITMQ_CACHELENGTH=1000
```

## 🚦 Status do Deploy

### ✅ Deploy Bem-Sucedido
- ✅ Build do Go 1.24 com CGO
- ✅ SQLite3 compatível com Alpine
- ✅ FFmpeg para processamento de mídia
- ✅ Migrações automáticas do banco
- ✅ Porta 31000 exposta

### 🌐 Acesso
Após deploy bem-sucedido:
- **Interface Web**: `https://seu-app.railway.app/`
- **API**: `https://seu-app.railway.app/v1/`
- **Health Check**: `https://seu-app.railway.app/health`

## 🔑 Primeiro Acesso

1. **Acesse a interface web**
2. **Crie sua primeira conta WhatsApp**
3. **Configure o QR Code**
4. **Teste o envio de mensagens**

## 🐛 Troubleshooting

### Build Falha
- ✅ Verifique se todas as variáveis estão corretas
- ✅ Confirme se os serviços PostgreSQL/RabbitMQ estão ativos
- ✅ Troque SIGNING_SECRET e MASTERKEY

### Aplicação não inicia
- ✅ Verifique logs no Railway
- ✅ Confirme conexão com banco de dados
- ✅ Verifique se porta 31000 está livre

## 📝 Próximos Passos

Após deploy:
1. **Configure webhooks** para receber mensagens
2. **Teste integrações** com seu sistema
3. **Configure notificações** via RabbitMQ
4. **Ajuste configurações** conforme necessidade

---
**🎯 Deploy concluído com sucesso!**
