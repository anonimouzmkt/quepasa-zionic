# 🚀 Deploy QuePasa no Railway

Este guia mostra como fazer o deploy da API QuePasa no Railway de forma simples e rápida.

## 📋 Pré-requisitos

- Conta no [Railway](https://railway.app)
- GitHub account (para conectar o repositório)

## 🚀 Passo a Passo

### 1. Preparar o Repositório

Certifique-se de que seu repositório contém os arquivos necessários:

```bash
# Arquivos necessários na raiz do projeto:
# - Dockerfile (já criado)
# - railway.json (já criado)
# - railway-env.example (já criado)
# - generate-keys.sh (já criado)
# - src/ (código fonte)
```

### 2. Gerar Chaves de Segurança

Execute o script para gerar chaves seguras:

```bash
chmod +x generate-keys.sh
./generate-keys.sh
```

**IMPORTANTE:** Guarde essas chaves em um local seguro!

### 3. Deploy no Railway

#### Opção A: Deploy via GitHub (Recomendado)

1. **Acesse o Railway:**
   - Vá para [railway.app](https://railway.app)
   - Faça login com sua conta

2. **Crie um novo projeto:**
   - Clique em "New Project"
   - Selecione "Deploy from GitHub repo"
   - Conecte sua conta GitHub
   - Selecione o repositório do QuePasa

3. **Configure o banco de dados:**
   - No painel do projeto, clique em "Add Plugin"
   - Selecione "PostgreSQL"
   - O Railway criará automaticamente as variáveis de ambiente do banco

#### Opção B: Deploy Manual

1. **Crie um novo projeto vazio:**
   - Clique em "New Project"
   - Selecione "Empty Project"

2. **Adicione PostgreSQL:**
   - No painel, clique em "Add Plugin"
   - Selecione "PostgreSQL"

3. **Faça upload do código:**
   - No painel, clique em "Deploy"
   - Selecione "Upload Files" ou conecte via Git

### 4. Configurar Variáveis de Ambiente

No painel do Railway, vá para **Variables** e adicione:

```bash
# Chaves de segurança (geradas no passo 2)
SIGNING_SECRET=sua-chave-secreta-super-segura-aqui
MASTERKEY=sua-master-key-super-segura-aqui

# Configurações do servidor
WEBAPIHOST=0.0.0.0
WEBAPIPORT=31000
WEBSOCKETSSL=false

# Configurações WhatsApp
READUPDATE=true
READRECEIPTS=false
CALLS=false
GROUPS=false
BROADCASTS=false
PRESENCE=unavailable

# Logs
LOGLEVEL=INFO
WHATSMEOW_LOGLEVEL=WARN
WHATSMEOW_DBLOGLEVEL=WARN
HTTPLOGS=false

# Cache
CACHELENGTH=1000
CACHEDAYS=7

# Configurações gerais
MIGRATIONS=true
ACCOUNTSETUP=true
TESTING=false
DISPATCHUNHANDLED=false
APP_TITLE=QuePasa-Railway
```

### 5. Configurar Domínio (Opcional)

1. **No painel do Railway:**
   - Vá para "Settings" > "Domains"
   - Clique em "Generate Domain" ou "Custom Domain"

2. **Para domínio customizado:**
   - Adicione seu domínio
   - Configure os registros DNS conforme instruído

### 6. Verificar Deploy

Após o deploy, você verá:

1. **URL da aplicação:** `https://seu-projeto.railway.app`
2. **Status do banco:** PostgreSQL conectado
3. **Logs da aplicação:** Acompanhe no painel do Railway

### 7. Primeiro Acesso

1. **Acesse a URL:** `https://seu-projeto.railway.app`
2. **Página inicial:** Interface web do QuePasa
3. **API Docs:** `https://seu-projeto.railway.app/swagger/index.html`

## 🔧 Configurações Avançadas

### Health Check

O Railway fará health checks automaticamente na rota `/health`.

### Escalabilidade

- **Hobby Plan:** 1 instância
- **Pro Plan:** Até 10 instâncias
- Configure via "Settings" > "Scaling"

### Backups

- PostgreSQL tem backups automáticos
- Configure retenção em "Settings" do banco

## 🐛 Troubleshooting

### Problemas Comuns:

1. **Erro de build:**
   - Verifique se o Dockerfile está na raiz
   - Confirme Go version 1.24+

2. **Erro de banco:**
   - Verifique variáveis PG*
   - Confirme DBSSLMODE=require

3. **Aplicação não inicia:**
   - Verifique logs no painel
   - Confirme todas as variáveis obrigatórias

### Logs

Para ver logs detalhados:
1. No painel do Railway
2. Vá para "Deployments"
3. Clique no deployment atual
4. Veja a aba "Logs"

## 📚 Documentação da API

- **Swagger UI:** `https://seu-projeto.railway.app/swagger/index.html`
- **Postman Collection:** Disponível no README principal
- **Webhooks:** Configure via interface web

## 💡 Dicas

1. **Monitoramento:** Use o painel do Railway para monitorar uso de recursos
2. **Backups:** Configure backups automáticos do banco
3. **Segurança:** Mantenha as chaves de segurança privadas
4. **Updates:** Faça deploy de updates via GitHub automaticamente

## 🆘 Suporte

- **Documentação oficial:** [QuePasa GitHub](https://github.com/nocodeleaks/quepasa)
- **Comunidade:** [Telegram Group](https://t.me/quepasa_api)
- **Issues:** Abra issues no repositório para bugs

---

**🎉 Pronto!** Sua API QuePasa está rodando no Railway!
