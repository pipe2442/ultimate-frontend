#!/bin/bash

echo ""
echo "🔧 Iniciando Chrome con debugging..."
echo ""

# Matar Chrome completamente
pkill -9 "Google Chrome" 2>/dev/null
sleep 2

# Iniciar Chrome
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  > /dev/null 2>&1 &

echo "Chrome iniciándose..."
echo ""
echo "⚠️  IMPORTANTE:"
echo "   Si Chrome te muestra un selector de perfiles,"
echo "   selecciona tu perfil AHORA."
echo ""
echo "   Una vez que Chrome cargue completamente,"
echo "   el debugging se activará."
echo ""
echo "Esperando 30 segundos..."
echo ""

# Esperar hasta 30 segundos
for i in {1..30}; do
  if curl -s --max-time 1 http://localhost:9222/json/version > /dev/null 2>&1; then
    echo ""
    echo "✅ ¡Debugging activo!"
    echo ""
    echo "Ahora puedes correr: npm run dev inspect"
    echo ""
    exit 0
  fi
  
  # Mostrar progreso cada 5 segundos
  if [ $((i % 5)) -eq 0 ]; then
    echo "  Esperando... ($i/30 segundos)"
  fi
  
  sleep 1
done

echo ""
echo "❌ El debugging no se activó después de 30 segundos"
echo ""
echo "Por favor:"
echo "1. Verifica que Chrome esté completamente abierto"
echo "2. Si Chrome pidió elegir perfil, asegúrate de haberlo seleccionado"
echo "3. Intenta correr este comando manualmente:"
echo ""
echo "   curl http://localhost:9222/json/version"
echo ""
echo "   Si ves JSON, ¡funciona! Corre: npm run dev inspect"
echo ""

exit 1
