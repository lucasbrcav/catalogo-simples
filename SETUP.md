# ⚡ SETUP RÁPIDO

## 1️⃣ Execute o SQL no Supabase

1. Acesse: https://app.supabase.com (faça login na sua conta e selecione seu projeto)
2. Copie e cole todo o conteúdo do arquivo `supabase-setup.sql`
3. Clique em **RUN** para executar

## 2️⃣ Configure Senha e WhatsApp

Após executar o SQL, altere estes valores:

**Alterar senha do admin:**
```sql
UPDATE settings 
SET value = 'SUA_SENHA_FORTE_AQUI' 
WHERE key = 'admin_password';
```

**Alterar número do WhatsApp:**
```sql
UPDATE settings 
SET value = 'SEU_NUMERO_AQUI' 
WHERE key = 'whatsapp_number';
```
*Formato: +55 (Brasil) + DDD + número (ex: +5511999999999)*

## 3️⃣ Execute o Projeto

```bash
npm run dev
```

Acesse: http://localhost:3000

## 🎯 Credenciais Padrão

- **Senha Admin:** `SUA_SENHA_FORTE_AQUI` (defina a sua!)
- **WhatsApp:** `SEU_NUMERO_AQUI` (defina o seu!)

## ✅ Pronto!

- **Catálogo público:** http://localhost:3000
- **Painel admin:** http://localhost:3000/admin

---

📖 Veja o **README.md** completo para mais detalhes
