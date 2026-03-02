⚡ Guia Rápido - iFood Clone
🎯 Início Rápido (5 minutos)
Pré-requisitos Instalados?

✅ Node.js 18+
✅ MySQL 8.0+
✅ Flutter 3.0+

Passo 1: Clone e Configure (2 min)
bash# Clone o repositório
git clone https://github.com/seu-usuario/ifood-clone.git
cd ifood-clone

# Torne os scripts executáveis
chmod +x setup.sh run-backend.sh run-frontend.sh

# Execute o setup automático
./setup.sh
Durante o setup, você será solicitado a:

Fornecer a senha do MySQL root
Confirmar a criação do banco de dados

Passo 2: Configure Variáveis de Ambiente (1 min)
Edite backend/.env:
envDB_PASSWORD=SUA_SENHA_MYSQL_AQUI
JWT_SECRET=mude_este_valor_para_algo_secreto
Passo 3: Inicie o Backend (1 min)
bash./run-backend.sh
Aguarde ver: ✅ Server running on port 3000
Passo 4: Inicie o App Flutter (1 min)
Em outro terminal:
bash./run-frontend.sh
Escolha o dispositivo (chrome/android/ios) quando solicitado.

🎉 Pronto!
Acesse:

🌐 Backend API: http://localhost:3000
📱 App: Automaticamente aberto no dispositivo escolhido

Credenciais de Teste
Use estes dados para login rápido:
Email: joao@email.com
Senha: 123456

🔧 Solução de Problemas Comuns
Erro: "Cannot connect to database"
bash# Verifique se MySQL está rodando
mysql -u root -p -e "SHOW DATABASES;"

# Se não estiver, inicie:
# macOS
brew services start mysql

# Linux
sudo systemctl start mysql

# Windows
net start MySQL80
Erro: "Port 3000 already in use"
bash# Encontre e mate o processo
lsof -ti:3000 | xargs kill -9

# Ou mude a porta em backend/.env
PORT=3001
Erro: Flutter "pub get failed"
bashcd frontend
flutter clean
flutter pub get
Erro: "Unauthorized" no app

Verifique se o backend está rodando
Confirme que a URL da API está correta em lib/core/services/api_service.dart
Tente fazer logout e login novamente


📱 Primeiros Passos no App
1. Crie uma Conta

Tela de Login → "Criar Conta"
Preencha nome, email, senha
Clique em "Registrar"

2. Explore Restaurantes

Veja a lista de restaurantes
Filtre por categoria
Use a busca

3. Faça um Pedido

Clique em um restaurante
Navegue pelo cardápio
Adicione itens ao carrinho
Vá para o carrinho (ícone no topo)
Clique em "Finalizar Pedido"
Preencha os dados de entrega
Confirme o pedido

4. Veja Histórico

Menu → "Meus Pedidos"
Clique em um pedido para detalhes


🧪 Testando a API Manualmente
Com cURL
bash# Registrar usuário
curl -X POST http://localhost:3000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Teste",
    "email": "teste@test.com",
    "password": "123456"
  }'

# Login
curl -X POST http://localhost:3000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "teste@test.com",
    "password": "123456"
  }'

# Listar restaurantes
curl http://localhost:3000/api/v1/restaurants
Com Postman/Insomnia

Importe a collection de /docs/api_collection.json
Configure a variável baseUrl como http://localhost:3000/api/v1
Execute as requisições na ordem


🎨 Personalizando
Mudar Cor Primária (Flutter)
lib/main.dart:
dartseedColor: const Color(0xFFEA1D2C), // Vermelho iFood
// Mude para sua cor preferida
Adicionar Novos Restaurantes
Execute SQL no MySQL:
sqlINSERT INTO restaurants (name, description, category, rating, delivery_time, delivery_fee) 
VALUES ('Seu Restaurante', 'Descrição', 'Categoria', 4.5, '30-40 min', 5.00);
Ou use a interface admin (se implementada).

📚 Próximos Passos
Aprendizado

Leia ARCHITECTURE.md para entender a estrutura
Explore o código dos providers
Veja como as rotas são configuradas
Entenda o fluxo de autenticação

Desenvolvimento

Adicione novos campos ao perfil do usuário
Implemente filtros avançados
Adicione favoritos
Crie cupons de desconto

Deploy

Configure variáveis de ambiente para produção
Use serviços como:

Backend: Heroku, Railway, AWS
Database: PlanetScale, AWS RDS
App: Play Store, App Store




🆘 Precisa de Ajuda?
Documentação

📖 README.md - Documentação completa
🏗️ ARCHITECTURE.md - Arquitetura detalhada
📋 API.md - Referência da API

Comunidade

🐛 GitHub Issues
💬 Discussions

Recursos

Flutter Cookbook
Express.js Guide
MySQL Tutorial


✅ Checklist de Verificação
Antes de começar o desenvolvimento:

 Backend rodando sem erros
 Banco de dados criado e populado
 App Flutter conectando à API
 Capaz de fazer login/registro
 Carrinho funcionando
 Pedidos sendo criados
 Código versionado no Git


🎓 Dicas Importantes
Para Iniciantes

Comece entendendo o fluxo de login
Depois explore a listagem de restaurantes
Por último, entenda carrinho e pedidos

Boas Práticas

Sempre commite com mensagens descritivas
Teste cada funcionalidade após mudanças
Documente código complexo
Use o Postman para testar API antes de integrar

Performance

Use const em widgets quando possível
Evite reconstruções desnecessárias
Otimize queries SQL com indexes
Cache imagens no app


🚀 Happy Coding!
Você agora tem um app completo e funcional. Explore, modifique e aprenda!
Lembre-se: Este é um projeto educacional. Sinta-se livre para experimentar e quebrar coisas - é assim que se aprende! 💪

Desenvolvido com ❤️ para a comunidade