# ⚡ Atualização: Campo Active

## 🎯 Nova Funcionalidade: Controle de Visibilidade

Agora você pode **ativar/desativar** produtos sem excluí-los!

### ✨ O que mudou?

**Antes:**
- Produto criado = visível para todos
- Para ocultar = tinha que excluir

**Agora:**
- Produto criado = visível por padrão ✅
- Para ocultar = desativar (mantém no banco) 🔄
- Para mostrar = ativar novamente ✅

## 📋 Como Usar

### No Painel Admin

1. Acesse `/admin`
2. Na tabela de produtos, você verá uma nova coluna **Status**
3. Clique no botão de status para alternar:
   - 🟢 **Ativo** = Produto visível no catálogo público
   - ⚪ **Inativo** = Produto oculto (só você vê no admin)

### Ao Criar/Editar Produto

1. No formulário, você verá um checkbox:
   ```
   ☑ Produto Ativo (visível para clientes)
   ```
2. Marcado = Produto aparece no catálogo
3. Desmarcado = Produto fica oculto

## 🚀 Casos de Uso

### 1. Preparar Lançamentos
```
Criar produto → Deixar inativo → Quando pronto → Ativar
```

### 2. Produto Esgotado
```
Produto acabou → Desativar → Chegou estoque → Ativar
```

### 3. Produtos Sazonais
```
Natal → Ativar decorações → Janeiro → Desativar
Verão → Ativar roupas de praia → Inverno → Desativar
```

### 4. Teste de Produtos
```
Criar produto teste → Inativo → Testar internamente → Ativar para público
```

## 🔧 Configuração do Banco de Dados

### Para Banco NOVO (primeira vez)

Execute o arquivo atualizado:
```
supabase-setup.sql
```

### Para Banco EXISTENTE (já tem produtos)

Execute este script para adicionar a coluna:
```sql
-- supabase-migration-active.sql
ALTER TABLE products ADD COLUMN active BOOLEAN DEFAULT true NOT NULL;
UPDATE products SET active = true;
```

Ou use o arquivo completo:
```
supabase-migration-active.sql
```

## 📊 Impacto no Catálogo Público

### Página Principal (`/`)
- Mostra **apenas** produtos ativos
- Produtos inativos = invisíveis
- Filtros e busca = só produtos ativos

### Painel Admin (`/admin`)
- Mostra **todos** os produtos (ativos e inativos)
- Status visível na coluna
- Pode alternar com um clique

## 💡 Dicas

### Organização
Use produtos inativos para:
- ✅ Preparar catálogo antes de abrir loja
- ✅ Guardar produtos descontinuados
- ✅ Manter histórico sem poluir catálogo
- ✅ Testar preços e descrições

### Workflow Recomendado
```
1. Criar produto (ativo por padrão)
2. Adicionar foto e descrição
3. Se não estiver pronto → Desativar
4. Quando pronto → Ativar
5. Produto esgotou → Desativar (não excluir!)
6. Chegou estoque → Ativar novamente
```

## 🎨 Visual no Admin

**Botão Ativo:**
```
[🔌 Ativo] (verde)
```

**Botão Inativo:**
```
[🔌 Inativo] (cinza)
```

Clique para alternar instantaneamente!

## ⚙️ Detalhes Técnicos

### Estrutura do Banco
```sql
products (
  ...
  active BOOLEAN DEFAULT true NOT NULL
)
```

### Query Pública (Catálogo)
```typescript
// Busca apenas produtos ativos
.eq('active', true)
```

### Query Admin
```typescript
// Busca todos os produtos
.select('*')
```

## 🔄 Migração Automática

O script `supabase-migration-active.sql` faz:

1. ✅ Verifica se a coluna já existe
2. ✅ Se não, cria a coluna
3. ✅ Define todos os produtos existentes como ativos
4. ✅ Mostra resultado

**Seguro para executar múltiplas vezes!**

## 📝 Checklist de Atualização

Se você já tem o banco configurado:

- [ ] Execute `supabase-migration-active.sql` no SQL Editor
- [ ] Atualize o código (já feito se está vendo isso!)
- [ ] Faça rebuild: `npm run build`
- [ ] Teste no admin: ative/desative um produto
- [ ] Verifique no catálogo: produto inativo não aparece
- [ ] Deploy na Vercel

## 🎉 Pronto!

Agora você tem controle total sobre quais produtos mostrar!

---

**Dúvidas?** Veja o código em:
- `lib/supabase.ts` - Tipo Product com active
- `app/page.tsx` - Filtro de produtos ativos
- `app/admin/page.tsx` - Gerenciamento de status
