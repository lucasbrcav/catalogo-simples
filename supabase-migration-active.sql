-- IMPORTANTE: Execute este SQL se você JÁ TEM um banco de dados criado
-- Este script adiciona a coluna 'active' aos produtos existentes

-- Adicionar coluna active (se não existir)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'products' AND column_name = 'active'
    ) THEN
        ALTER TABLE products ADD COLUMN active BOOLEAN DEFAULT true NOT NULL;
        
        -- Atualizar todos os produtos existentes para ativos
        UPDATE products SET active = true WHERE active IS NULL;
        
        RAISE NOTICE 'Coluna active adicionada com sucesso!';
    ELSE
        RAISE NOTICE 'Coluna active já existe.';
    END IF;
END $$;

-- Verificar se funcionou
SELECT id, name, active FROM products LIMIT 5;
