Sobre
=====

Código fonte do Site http://arquiteturajava.com.br disponível para estudo.

É um exemplo de **Responsive Design** usando **media queries**. Funciona em mobile e Desktop.

Build
=====

O build é feito pelo Grunt. Se não tiver instalado, faça:
   
   npm install grunt -g

Em desenvolvimento, pra buildar o less, rode:

   grunt watch

Pra buildar a versão final de deploy, faça:

   ./build/build.sh


Suporte e testes
================

Não suportamos IE6 e IE7 (esses usuários verão a página ie.html).

IE 8 é suportado minimamente e sem media queries através de CSS específico (ver ie8.less).

Testado em:

* Firefox 3.6+
* Chrome
* Safari 5
* Opera Desktop
* IE 9
* iOS 4.2+ (iPhone e iPad)
* Android 2.2+
* Amazon Silk
* Opera Mini (Java ME)
* Nokia S60 e S40
* Opera Mobile (android)

Licença
=======

As técnicas de CSS/HTML/JS podem ser copiadas livremente para outros projetos e inspirar novos sites. 

Design, textos e o site em si com copyright da Caelum exclusivo. **Proibido deployar o site do livro como está aqui em um domínio próprio, ou copiar seu design**.