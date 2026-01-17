'use client';

import { CartItem } from '@/lib/supabase';
import { X, ShoppingCart, Send } from 'lucide-react';

interface CartProps {
  items: CartItem[];
  onUpdateQuantity: (productId: string, quantity: number) => void;
  onRemoveItem: (productId: string) => void;
  onSendWhatsApp: () => void;
}

export default function Cart({ items, onUpdateQuantity, onRemoveItem, onSendWhatsApp }: CartProps) {
  const total = items.reduce((sum, item) => sum + item.price * item.quantity, 0);

  if (items.length === 0) {
    return (
      <div className="bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg p-6 sticky top-4">
        <div className="flex items-center gap-2 mb-4">
          <ShoppingCart className="w-6 h-6 text-gray-400 dark:text-gray-500" />
          <h2 className="text-xl font-bold text-gray-900 dark:text-white">Carrinho</h2>
        </div>
        <p className="text-gray-500 dark:text-gray-400 text-center py-8">Seu carrinho está vazio</p>
      </div>
    );
  }

  return (
    <div className="bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg p-6 sticky top-4">
      <div className="flex items-center gap-2 mb-4">
        <ShoppingCart className="w-6 h-6 text-blue-600 dark:text-blue-400" />
        <h2 className="text-xl font-bold text-gray-900 dark:text-white">Carrinho</h2>
        <span className="ml-auto bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 text-sm font-medium px-2.5 py-0.5 rounded-full">
          {items.length}
        </span>
      </div>

      <div className="space-y-4 mb-4 max-h-96 overflow-y-auto">
        {items.map((item) => (
          <div key={item.id} className="border-b border-gray-100 dark:border-gray-700 pb-4">
            <div className="flex items-start justify-between mb-2">
              <div className="flex-1">
                <h3 className="font-medium text-gray-900 dark:text-white">{item.name}</h3>
                <p className="text-sm text-gray-500 dark:text-gray-400">R$ {item.price.toFixed(2)}</p>
              </div>
              <button
                onClick={() => onRemoveItem(item.id)}
                className="text-red-500 hover:text-red-700 dark:text-red-400 dark:hover:text-red-300 p-1"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="flex items-center gap-2">
              <button
                onClick={() => onUpdateQuantity(item.id, item.quantity - 1)}
                className="w-8 h-8 border border-gray-300 dark:border-gray-600 rounded hover:bg-gray-100 dark:hover:bg-gray-700 font-bold dark:text-white"
                disabled={item.quantity <= 1}
              >
                -
              </button>
              <span className="w-12 text-center font-medium dark:text-white">{item.quantity}</span>
              <button
                onClick={() => onUpdateQuantity(item.id, item.quantity + 1)}
                className="w-8 h-8 border border-gray-300 dark:border-gray-600 rounded hover:bg-gray-100 dark:hover:bg-gray-700 font-bold dark:text-white"
              >
                +
              </button>
              <span className="ml-auto font-semibold text-gray-900 dark:text-white">
                R$ {(item.price * item.quantity).toFixed(2)}
              </span>
            </div>
          </div>
        ))}
      </div>

      <div className="border-t border-gray-200 dark:border-gray-700 pt-4 mb-4">
        <div className="flex justify-between items-center mb-2">
          <span className="text-gray-600 dark:text-gray-400">Subtotal:</span>
          <span className="font-semibold dark:text-white">R$ {total.toFixed(2)}</span>
        </div>
        <div className="flex justify-between items-center text-lg font-bold">
          <span className="dark:text-white">Total:</span>
          <span className="text-green-600 dark:text-green-400">R$ {total.toFixed(2)}</span>
        </div>
      </div>

      <button
        onClick={onSendWhatsApp}
        className="w-full bg-green-600 hover:bg-green-700 dark:bg-green-500 dark:hover:bg-green-600 text-white py-3 px-4 rounded-lg font-medium flex items-center justify-center gap-2 transition-colors"
      >
        <Send className="w-5 h-5" />
        Enviar Pedido pelo WhatsApp
      </button>
    </div>
  );
}
