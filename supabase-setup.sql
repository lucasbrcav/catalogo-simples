-- IMPORTANTE: Execute este SQL no SQL Editor do Supabase Dashboard
-- https://app.supabase.com/project/YOUR_PROJECT/sql

-- Criar tabela de produtos
CREATE TABLE IF NOT EXISTS products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  image_url TEXT NOT NULL,
  category TEXT,
  active BOOLEAN DEFAULT true NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Criar tabela de configurações (para senha de admin, etc)
CREATE TABLE IF NOT EXISTS settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- Inserir senha de admin padrão (MUDAR ISSO!)
-- Senha: admin123 (você deve mudar isso no código ou aqui)
INSERT INTO settings (key, value) 
VALUES ('admin_password', 'admin123')
ON CONFLICT (key) DO NOTHING;

-- Inserir número de WhatsApp (MUDAR para seu número)
-- Formato: +5511999999999
INSERT INTO settings (key, value) 
VALUES ('whatsapp_number', '+5511999999999')
ON CONFLICT (key) DO NOTHING;

-- Habilitar Row Level Security
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE settings ENABLE ROW LEVEL SECURITY;

-- Política: Todos podem ler produtos
CREATE POLICY "Produtos são visíveis para todos"
  ON products FOR SELECT
  USING (true);

-- Política: Qualquer um pode inserir/atualizar/deletar produtos (simplificado)
-- Em produção, você deve adicionar autenticação adequada
CREATE POLICY "Permitir todas as operações em produtos"
  ON products FOR ALL
  USING (true);

-- Política: Todos podem ler configurações
CREATE POLICY "Configurações são visíveis para todos"
  ON settings FOR SELECT
  USING (true);

-- Política: Permitir atualização de configurações
CREATE POLICY "Permitir todas as operações em settings"
  ON settings FOR ALL
  USING (true);

-- Inserir alguns produtos de exemplo
INSERT INTO products (name, description, price, image_url, category, active) VALUES
('Camiseta Básica', 'Camiseta 100% algodão, várias cores disponíveis', 49.90, 'https://via.placeholder.com/300x300?text=Camiseta', 'Vestuário', true),
('Calça Jeans', 'Calça jeans moderna, corte regular', 129.90, 'https://via.placeholder.com/300x300?text=Calça', 'Vestuário', true),
('Tênis Esportivo', 'Tênis confortável para corrida e caminhada', 199.90, 'https://via.placeholder.com/300x300?text=Tênis', 'Calçados', true),
('Mochila', 'Mochila resistente com vários compartimentos', 89.90, 'https://via.placeholder.com/300x300?text=Mochila', 'Acessórios', true),
('Relógio Digital', 'Relógio digital à prova dágua', 149.90, 'https://via.placeholder.com/300x300?text=Relógio', 'Acessórios', true);
