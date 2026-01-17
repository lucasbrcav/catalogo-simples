# 🚀 Deploy na Vercel

Guia passo a passo para publicar seu catálogo na Vercel (grátis!)

## 📋 Pré-requisitos

- [ ] Conta no [GitHub](https://github.com) (gratuita)
- [ ] Conta na [Vercel](https://vercel.com) (gratuita)
- [ ] Banco de dados Supabase configurado
- [ ] Projeto funcionando localmente

## 1️⃣ Preparar o Projeto

### Criar arquivo .env.example

Crie um arquivo `.env.example` (sem suas credenciais reais):

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url_here
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=your_supabase_key_here
```

### Verificar .gitignore

Certifique-se que o `.gitignore` está ignorando o `.env`:

```
.env
.env.*
```

✅ Seu `.gitignore` já está configurado corretamente!

## 2️⃣ Subir para o GitHub

### Opção A: Via VS Code (Recomendado)

1. Clique no ícone de **Source Control** (Ctrl + Shift + G)
2. Clique em **Publish to GitHub**
3. Escolha **Public** ou **Private** repository
4. Confirme os arquivos
5. Aguarde o upload

### Opção B: Via Terminal

```bash
git init
git add .
git commit -m "Initial commit - Catálogo Simples"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/catalogo-simples.git
git push -u origin main
```

## 3️⃣ Deploy na Vercel

### Passo 1: Conectar Repositório

1. Acesse [vercel.com](https://vercel.com)
2. Clique em **Add New** → **Project**
3. **Import Git Repository**
4. Escolha seu repositório `catalogo-simples`
5. Clique em **Import**

### Passo 2: Configurar Variáveis de Ambiente

Na seção **Environment Variables**, adicione:

```
NEXT_PUBLIC_SUPABASE_URL = sua_url_do_supabase_aqui
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY = sua_chave_publishable_aqui
```

**Importante:** Use suas credenciais reais do Supabase! (NUNCA compartilhe chaves secretas ou dados sensíveis em repositórios públicos)

### Passo 3: Deploy

1. Clique em **Deploy**
2. Aguarde 1-2 minutos
3. Vercel vai construir e publicar automaticamente

## 4️⃣ Após o Deploy

### Seu catálogo estará online!

A Vercel vai gerar uma URL como:
```
https://catalogo-simples.vercel.app
```

### Testar Funcionalidades

- [ ] Página principal carrega os produtos
- [ ] Adicionar ao carrinho funciona
- [ ] Filtros de categoria funcionam
- [ ] Busca funciona
- [ ] WhatsApp abre com a mensagem
- [ ] Página admin funciona (`/admin`)
- [ ] Login admin funciona
- [ ] CRUD de produtos funciona

## 5️⃣ Domínio Personalizado (Opcional)

Se você tem um domínio próprio:

1. No dashboard da Vercel, vá em **Settings** → **Domains**
2. Adicione seu domínio (ex: `meucatalogo.com.br`)
3. Configure o DNS conforme instruções da Vercel
4. Aguarde propagação (até 48h)

## 🔄 Atualizações Futuras

Toda vez que você fizer push para o GitHub, a Vercel vai:

1. Detectar automaticamente
2. Fazer rebuild do projeto
3. Publicar a nova versão

```bash
# Fazer mudanças no código
git add .
git commit -m "Descrição das mudanças"
git push
```

Pronto! Deploy automático! 🎉

## ⚙️ Configurações Avançadas

### Build Settings (já configurado automaticamente)

```
Framework Preset: Next.js
Build Command: npm run build
Output Directory: .next
Install Command: npm install
```


### Variáveis de Ambiente por Ambiente

Você pode ter diferentes configurações para:
- **Production** (site principal)
- **Preview** (branches de teste)
- **Development** (local)

---

**Atenção:**
- Nunca compartilhe dados sensíveis (URLs, chaves, senhas, números de WhatsApp reais) em repositórios públicos.
- Sempre utilize placeholders e instrua o usuário a preencher com seus próprios dados.

---

## 🐛 Problemas Comuns

### Erro: "Module not found"
**Solução:** Verifique se todas as dependências estão no `package.json`

```bash
npm install
git add package.json package-lock.json
git commit -m "Fix dependencies"
git push
```

### Erro: "Failed to fetch from Supabase"
**Solução:** Verifique as variáveis de ambiente na Vercel

1. Vá em **Settings** → **Environment Variables**
2. Confirme que estão corretas
3. **Redeploy** o projeto

### Erro: "Build failed"
**Solução:** Veja os logs no dashboard da Vercel

1. Clique no deploy com erro
2. Leia a mensagem de erro
3. Corrija localmente
4. Faça push novamente

## 📊 Monitoramento

A Vercel oferece (grátis):

- **Analytics** - Número de visitantes
- **Speed Insights** - Performance do site
- **Logs** - Erros e avisos em tempo real

Acesse em: **Project** → **Analytics**

## 💰 Plano Gratuito da Vercel

O que está incluído:

✅ Deploy ilimitado
✅ Domínio `.vercel.app` grátis
✅ SSL/HTTPS automático
✅ 100GB de largura de banda/mês
✅ Builds ilimitados
✅ Domínio personalizado (1 por projeto)

**Perfeito para pequenos negócios e projetos pessoais!**

## 🎉 Pronto!

Seu catálogo está no ar e profissional!

Compartilhe a URL com seus clientes:
```
https://seu-catalogo.vercel.app
```

---

**Precisa de ajuda?** Entre em contato ou veja a [documentação da Vercel](https://vercel.com/docs)
