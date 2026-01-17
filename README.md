# Catálogo Simples

Um catálogo de produtos online com carrinho de compras e integração com WhatsApp, construído com Next.js e Supabase.

## 🚀 Funcionalidades

- ✅ Página pública de catálogo com produtos
- ✅ **Filtro por categorias** com contador de produtos
- ✅ **Busca em tempo real** por nome e descrição
- ✅ Carrinho de compras (armazenado no navegador)
- ✅ Envio de pedidos via WhatsApp
- ✅ Painel administrativo protegido por senha
- ✅ CRUD completo de produtos
- ✅ Imagens via URL (Google, etc.)
- ✅ Responsivo (mobile-first)
- ✅ Interface moderna e intuitiva

## 📋 Pré-requisitos

- Node.js 18+ instalado
- Conta no [Supabase](https://supabase.com)
- Projeto criado no Supabase

## 🔧 Instalação

### 1. Configure o Banco de Dados Supabase

1. Acesse o [Supabase Dashboard](https://app.supabase.com)
2. Vá em **SQL Editor**
3. Execute o conteúdo do arquivo `supabase-setup.sql` (na raiz do projeto)
4. **IMPORTANTE:** Altere a senha de admin e o número do WhatsApp no SQL ou depois pelo código

### 2. Configure as Variáveis de Ambiente


O arquivo `.env` deve ser configurado com **suas** credenciais:

```env
NEXT_PUBLIC_SUPABASE_URL=SUA_URL_DO_SUPABASE_AQUI
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=SUA_CHAVE_PUBLISHABLE_AQUI
```

### 3. Instale as Dependências e Execute

```bash
npm install
npm run dev
```

Acesse: `http://localhost:3000`

## 📱 Como Usar

### Para Clientes (Página Pública)

1. Acesse a página inicial
2. **Use a busca** para encontrar produtos específicos
3. **Filtre por categoria** clicando nos botões de categoria
4. Navegue pelos produtos
5. Clique em "Adicionar" para adicionar produtos ao carrinho
6. Ajuste as quantidades no carrinho
7. Clique em "Enviar Pedido pelo WhatsApp"
8. O pedido será formatado e enviado para o WhatsApp configurado

### Para Administração

1. Clique no ícone **Admin** no canto superior direito
2. Digite a senha definida por você (no setup do banco)
3. Gerencie produtos:
   - **Adicionar:** Clique em "Novo Produto"
   - **Editar:** Clique no ícone de lápis
   - **Excluir:** Clique no ícone de lixeira

## ⚙️ Configurações Importantes

### Alterar Senha de Admin


Execute no SQL Editor do Supabase:

```sql
UPDATE settings 
SET value = 'SUA_SENHA_FORTE_AQUI' 
WHERE key = 'admin_password';
```

### Alterar Número do WhatsApp


Execute no SQL Editor do Supabase:

```sql
UPDATE settings 
SET value = 'SEU_NUMERO_AQUI' 
WHERE key = 'whatsapp_number';
```

**Formato do número:** `+55` (código do país) + DDD + número (ex: `+5511999999999`)

### Adicionar Imagens de Produtos

Use URLs públicas de imagens. Exemplos:

- Google Images (clique direito > Copiar endereço da imagem)
- Imgur: `https://i.imgur.com/xxxxx.jpg`
- Placeholder: `https://via.placeholder.com/300x300?text=Produto`

## 🎨 Estrutura do Projeto

```
catalogo-simples/
├── app/
│   ├── page.tsx           # Página principal (catálogo)
│   ├── admin/
│   │   └── page.tsx       # Painel administrativo
│   ├── layout.tsx
│   └── globals.css
├── components/
│   ├── ProductCard.tsx    # Card de produto
│   └── Cart.tsx           # Carrinho de compras
├── lib/
│   └── supabase.ts        # Cliente Supabase + tipos
├── supabase-setup.sql     # Script de configuração do banco
├── .env                   # Variáveis de ambiente
└── package.json
```

## 🗄️ Estrutura do Banco de Dados

### Tabela: `products`

- `id` (UUID) - Primary Key
- `name` (TEXT) - Nome do produto
- `description` (TEXT) - Descrição
- `price` (DECIMAL) - Preço
- `image_url` (TEXT) - URL da imagem
- `category` (TEXT) - Categoria
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### Tabela: `settings`

- `key` (TEXT) - Primary Key
- `value` (TEXT) - Valor da configuração
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

**Configurações padrão:**
- `admin_password` - Senha do admin
- `whatsapp_number` - Número do WhatsApp para pedidos

## 🔒 Segurança

⚠️ **IMPORTANTE:** Este é um projeto simples para uso básico.

**Recomendações para produção:**

1. **Altere a senha padrão** imediatamente
2. Use autenticação adequada (Supabase Auth) em vez de senha simples
3. Implemente Row Level Security (RLS) mais rigorosa no Supabase
4. Considere usar variáveis de ambiente para senhas
5. Adicione validação e sanitização de inputs

## 📦 Deploy

### Vercel (Recomendado)

1. Faça push do código para o GitHub
2. Importe o projeto no [Vercel](https://vercel.com)
3. Configure as variáveis de ambiente no Vercel
4. Deploy automático!

### Outras Plataformas

O projeto pode ser deployado em qualquer plataforma que suporte Next.js:
- Netlify
- Railway
- AWS Amplify
- etc.

## 🛠️ Tecnologias Utilizadas

- **Next.js 16** - Framework React
- **TypeScript** - Tipagem estática
- **Tailwind CSS** - Estilização
- **Supabase** - Banco de dados e backend
- **Lucide React** - Ícones

## 📝 Melhorias Futuras

- [ ] Upload de imagens direto para o Supabase Storage
- [ ] Autenticação com Supabase Auth
- [ ] Paginação de produtos
- [ ] Analytics de vendas
- [ ] Sistema de estoque
- [ ] Multi-usuários admin
- [ ] Histórico de pedidos
- [ ] Notificações por email

## 📚 Guias Adicionais

- [DEPLOY.md](DEPLOY.md) - Como publicar na Vercel
- [CATEGORIAS.md](CATEGORIAS.md) - Sugestões de categorias para seu catálogo
- [CHECKLIST.md](CHECKLIST.md) - Checklist de configuração
- [SETUP.md](SETUP.md) - Guia rápido de setup

## 📄 Licença

Este projeto é de código aberto para uso pessoal e educacional.

---

Desenvolvido com ❤️ usando Next.js e Supabase

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
