#!/bin/bash
# Script de build simples que minifica e ajeita arquivos para deploy
#   ArquiteturaJava.com.br - by Sérgio Lopes

rm -rf static_files/*

# Copia arquivos normais
cp -R src/img src/livro src/favicon.ico src/robots.txt static_files
mkdir -p static_files/css
cp src/css/ie8.css static_files/css/

# Embute JS no html
sed -e "s/<script .* class=\"embed\".*<\/script>/<script>\/\*INCLUDEJS\*\/\\`echo -e '\n\r'`<\/script>/" src/index.html | sed -e '/\/\*INCLUDEJS\*\//r src/js/script.js' > static_files/temp

# Embute CSS no html
sed -e "s/<link .* class=\"embed\".*>/<style class=estilo>\/\*INCLUDECSS\*\/\\`echo -e '\n\r'`<\/style>/" static_files/temp | sed -e '/\/\*INCLUDECSS\*\//r src/css/style.css' > static_files/index.html

# Ajusta path das imagens
sed -e 's/..\/img\//img\//g' static_files/index.html > static_files/temp
mv static_files/temp static_files/index.html

# Comprime index.html
java -cp build/yuicompressor-2.4.7.jar -jar build/htmlcompressor-1.5.3.jar --compress-js --compress-css	static_files/index.html > static_files/temp
mv static_files/temp static_files/index.html

# Comprime ie.html
java -cp build/yuicompressor-2.4.7.jar -jar build/htmlcompressor-1.5.3.jar --compress-js --compress-css	src/ie.html > static_files/ie.html