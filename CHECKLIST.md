# 📋 CHECKLIST DE CONFIGURAÇÃO

Siga estes passos para deixar seu catálogo funcionando:

## ✅ Passo 1: Banco de Dados

- [ ] Acesse https://app.supabase.com (faça login e selecione seu projeto)
- [ ] Abra o arquivo `supabase-setup.sql` neste projeto
- [ ] Copie TODO o conteúdo do arquivo
- [ ] Cole no SQL Editor do Supabase
- [ ] Clique em **RUN** (ou Ctrl + Enter)
- [ ] Aguarde a mensagem de sucesso

**Se já tinha banco criado anteriormente:**
- [ ] Execute também o arquivo `supabase-migration-active.sql` para adicionar a coluna active

## ✅ Passo 2: Configurar Senha do Admin

Execute no SQL Editor:

```sql
UPDATE settings 
SET value = 'SUA_SENHA_FORTE_AQUI' 
WHERE key = 'admin_password';
```

⚠️ **IMPORTANTE:** Troque `'SUA_SENHA_FORTE_AQUI'` por uma senha forte e secreta!

## ✅ Passo 3: Configurar WhatsApp

Execute no SQL Editor:

```sql
UPDATE settings 
SET value = 'SEU_NUMERO_AQUI' 
WHERE key = 'whatsapp_number';
```

⚠️ **IMPORTANTE:** 
- Use SEU número real no formato: `+55` + DDD + número (ex: `+5511999999999`)
- O código `+55` é do Brasil, mantenha-o

## ✅ Passo 4: Executar o Projeto

```bash
npm run dev
```

Acesse: http://localhost:3000 (ou a porta que aparecer no terminal)

## ✅ Passo 5: Testar

### Teste o Catálogo Público:
- [ ] Veja os 5 produtos de exemplo
- [ ] Adicione produtos ao carrinho
- [ ] Ajuste quantidades
- [ ] Clique em "Enviar Pedido pelo WhatsApp"
- [ ] Verifique se abre o WhatsApp com a mensagem formatada

### Teste o Painel Admin:
- [ ] Clique no ícone **Admin** (canto superior direito)
- [ ] Entre com a senha que você configurou
- [ ] Teste criar um novo produto
- [ ] Teste editar um produto
- [ ] Teste excluir um produto

## 🎨 URLs para Imagens de Teste

Use estes exemplos para testar:

```
https://via.placeholder.com/300x300/FF6B6B/FFFFFF?text=Produto+1
https://via.placeholder.com/300x300/4ECDC4/FFFFFF?text=Produto+2
https://via.placeholder.com/300x300/FFE66D/000000?text=Produto+3
https://via.placeholder.com/300x300/95E1D3/000000?text=Produto+4
```

Ou busque imagens no Google:
1. Procure uma imagem no Google
2. Clique na imagem
3. Clique direito > "Copiar endereço da imagem"
4. Cole a URL no campo "URL da Imagem"

## ❌ Problemas Comuns

### Erro: "Failed to fetch"
- Verifique se executou o SQL no Supabase
- Verifique se as credenciais no `.env` estão corretas

### WhatsApp não abre
- Verifique se configurou o número no formato correto: `+5511999999999`
- O número deve incluir o código do país (+55)

### Senha não funciona
- Verifique se executou o UPDATE da senha no SQL Editor
- A senha padrão é `admin123` (se não alterou)

## 🚀 Próximos Passos

Depois que tudo estiver funcionando:

1. **Adicione seus produtos reais**
   - Entre no painel admin
   - Delete os produtos de exemplo
   - Adicione seus produtos com imagens reais

2. **Personalize as cores** (opcional)
   - Edite `app/globals.css` para mudar as cores do tema

3. **Faça deploy** (quando estiver pronto)
   - Push para GitHub
   - Deploy na Vercel (grátis)
   - Configure as variáveis de ambiente na Vercel

---

**Precisa de ajuda?** Revise o README.md completo!
