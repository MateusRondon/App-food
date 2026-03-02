🏗️ Arquitetura do Sistema - iFood Clone
Visão Geral
Este documento detalha a arquitetura técnica completa do aplicativo de delivery, incluindo padrões de design, fluxo de dados e decisões arquiteturais.
📊 Diagrama de Arquitetura Geral
┌─────────────────────────────────────────────────────────────────┐
│                         CAMADA DE APRESENTAÇÃO                   │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              Flutter Application (Dart)                  │   │
│  │                                                           │   │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │   │
│  │  │  Views   │  │ Widgets  │  │  Router  │  │  Theme  │ │   │
│  │  └────┬─────┘  └────┬─────┘  └────┬─────┘  └────┬────┘ │   │
│  │       │             │             │             │       │   │
│  │  ┌────┴──────────────┴─────────────┴─────────────┴────┐ │   │
│  │  │              Providers (State Management)          │ │   │
│  │  │  • AuthProvider    • RestaurantProvider            │ │   │
│  │  │  • CartProvider    • OrderProvider                 │ │   │
│  │  └────────────────────────┬───────────────────────────┘ │   │
│  │                           │                             │   │
│  │  ┌────────────────────────┴───────────────────────────┐ │   │
│  │  │                 Models (Entities)                   │ │   │
│  │  │  User • Restaurant • Product • Cart • Order        │ │   │
│  │  └────────────────────────┬───────────────────────────┘ │   │
│  │                           │                             │   │
│  │  ┌────────────────────────┴───────────────────────────┐ │   │
│  │  │              API Service (HTTP Client)             │ │   │
│  │  └────────────────────────────────────────────────────┘ │   │
│  └───────────────────────────┼───────────────────────────────┘
└────────────────────────────┼─────────────────────────────────┘
                             │
                             │ HTTP/REST + JSON
                             │ Authorization: Bearer <JWT>
                             │
┌────────────────────────────┼─────────────────────────────────┐
│                            │      CAMADA DE API              │
│  ┌─────────────────────────┴─────────────────────────────┐  │
│  │          Node.js + Express REST API                    │  │
│  │                                                         │  │
│  │  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐  │  │
│  │  │   Routes    │→ │ Controllers  │→ │  Middleware  │  │  │
│  │  │  (Routing)  │  │  (Handlers)  │  │  (Auth/Val)  │  │  │
│  │  └─────────────┘  └──────┬───────┘  └──────────────┘  │  │
│  │                          │                             │  │
│  │  ┌───────────────────────┴─────────────────────────┐  │  │
│  │  │               Services (Business Logic)         │  │  │
│  │  │  • AuthService      • RestaurantService         │  │  │
│  │  │  • CartService      • OrderService              │  │  │
│  │  └───────────────────────┬─────────────────────────┘  │  │
│  │                          │                             │  │
│  │  ┌───────────────────────┴─────────────────────────┐  │  │
│  │  │           Repositories (Data Access)            │  │  │
│  │  │  UserRepo • RestaurantRepo • OrderRepo          │  │  │
│  │  └───────────────────────┬─────────────────────────┘  │  │
│  │                          │                             │  │
│  │  ┌───────────────────────┴─────────────────────────┐  │  │
│  │  │              Database Configuration             │  │  │
│  │  │         MySQL Pool + Connection Manager         │  │  │
│  │  └─────────────────────────────────────────────────┘  │  │
│  └─────────────────────────┼─────────────────────────────┘  │
└────────────────────────────┼───────────────────────────────┘
                             │
                             │ SQL Queries
                             │
┌────────────────────────────┼───────────────────────────────┐
│                            │     CAMADA DE DADOS           │
│  ┌─────────────────────────┴─────────────────────────────┐ │
│  │                   MySQL Database 8.0                  │ │
│  │                                                        │ │
│  │  ┌─────────┐ ┌──────────┐ ┌─────────┐ ┌──────────┐  │ │
│  │  │  users  │ │restaurants│ │products │ │categories│  │ │
│  │  └─────────┘ └──────────┘ └─────────┘ └──────────┘  │ │
│  │                                                        │ │
│  │  ┌─────────┐ ┌──────────┐ ┌─────────┐ ┌──────────┐  │ │
│  │  │  carts  │ │cart_items│ │ orders  │ │order_items│ │ │
│  │  └─────────┘ └──────────┘ └─────────┘ └──────────┘  │ │
│  │                                                        │ │
│  │  Indexes • Foreign Keys • Transactions                │ │
│  └────────────────────────────────────────────────────────┘ │
└──────────────────────────────────────────────────────────────┘
🔄 Fluxo de Dados
1. Autenticação
User Input → LoginScreen
         ↓
    AuthProvider.login()
         ↓
    ApiService.login()
         ↓
    POST /api/v1/auth/login
         ↓
    AuthController → AuthService
         ↓
    Validate credentials
         ↓
    Generate JWT Token
         ↓
    Return {user, token}
         ↓
    Store token locally
         ↓
    Navigate to Home
2. Listagem de Restaurantes
HomeScreen.initState()
         ↓
    RestaurantProvider.loadRestaurants()
         ↓
    ApiService.getRestaurants()
         ↓
    GET /api/v1/restaurants
         ↓
    RestaurantController → RestaurantService
         ↓
    Query database
         ↓
    Return restaurant list
         ↓
    Update UI with data
3. Adicionar ao Carrinho
Product Detail → Add to Cart
         ↓
    CartProvider.addItem(productId)
         ↓
    ApiService.addToCart()
         ↓
    POST /api/v1/cart/items
         ↓
    CartController → CartService
         ↓
    Validate restaurant
         ↓
    Add/Update cart_items
         ↓
    Return updated cart
         ↓
    Update cart badge
4. Finalizar Pedido
Checkout → Create Order
         ↓
    OrderProvider.createOrder()
         ↓
    ApiService.createOrder()
         ↓
    POST /api/v1/orders
         ↓
    OrderController → OrderService
         ↓
    Begin Transaction
         ↓
    Create order + order_items
         ↓
    Clear cart
         ↓
    Commit Transaction
         ↓
    Return order details
         ↓
    Navigate to Order Success
🎯 Padrões de Design Implementados
Backend
1. MVC (Model-View-Controller)
Request → Route → Controller → Service → Repository → Database
2. Repository Pattern
Separa a lógica de acesso aos dados da lógica de negócio.
javascript// Repository - Data Access Layer
class UserRepository {
  async findByEmail(email) {
    const [users] = await pool.execute(
      'SELECT * FROM users WHERE email = ?',
      [email]
    );
    return users[0];
  }
}

// Service - Business Logic
class AuthService {
  async login(email, password) {
    const user = await userRepository.findByEmail(email);
    // Validation logic here
    return generateToken(user);
  }
}
3. Dependency Injection
Services são instanciados uma vez e reutilizados.
javascript// services/authService.js
class AuthService {
  // Service implementation
}

module.exports = new AuthService(); // Singleton
4. Middleware Pattern
Funções encadeadas processam requisições.
javascriptapp.use(cors());
app.use(express.json());
app.use('/api/v1/cart', authMiddleware);
Frontend
1. MVVM (Model-View-ViewModel)
View (Screen) → ViewModel (Provider) → Model (Entity)
2. Provider Pattern (State Management)
dartclass CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  
  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // Atualiza UI
  }
}
3. Repository Pattern
dartclass ApiService {
  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse('$baseUrl/restaurants'));
    return parseRestaurants(response.body);
  }
}
4. Observer Pattern
Consumer widgets observam mudanças nos Providers.
dartConsumer<CartProvider>(
  builder: (context, cart, child) {
    return Text('Items: ${cart.itemCount}');
  },
)
🔒 Segurança
1. Autenticação JWT
┌─────────────┐
│   Client    │
└──────┬──────┘
       │ POST /auth/login
       │ {email, password}
       ↓
┌──────────────┐
│   Backend    │
│ Validate     │
│ Generate JWT │
└──────┬───────┘
       │ {token: "eyJ..."}
       ↓
┌─────────────┐
│   Client    │
│ Store Token │
└──────┬──────┘
       │ GET /cart
       │ Authorization: Bearer eyJ...
       ↓
┌──────────────┐
│   Backend    │
│ Verify Token │
│ Extract User │
│ Process      │
└──────────────┘
2. Password Hashing (Bcrypt)
javascript// Registration
const hashedPassword = await bcrypt.hash(password, 10);

// Login
const isValid = await bcrypt.compare(password, user.password);
3. SQL Injection Prevention
javascript// ❌ VULNERÁVEL
const query = `SELECT * FROM users WHERE email = '${email}'`;

// ✅ SEGURO
const [users] = await pool.execute(
  'SELECT * FROM users WHERE email = ?',
  [email]
);
4. Input Validation
javascriptbody('email').isEmail(),
body('password').isLength({ min: 6 }),
📈 Performance & Otimização
Backend

Connection Pooling

javascriptconst pool = mysql.createPool({
  connectionLimit: 10,
  waitForConnections: true
});

Database Indexing

sqlCREATE INDEX idx_email ON users(email);
CREATE INDEX idx_restaurant ON products(restaurant_id);

Query Optimization


Joins otimizados
Limit em queries de listagem
Campos selecionados específicos

Frontend

Image Caching

dartCachedNetworkImage(
  imageUrl: url,
  memCacheWidth: 400,
);

Lazy Loading

dartListView.builder( // Constrói apenas itens visíveis
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(),
);

Estado Otimizado

dart// Apenas rebuild quando necessário
Consumer<CartProvider>(
  builder: (context, cart, child) => Text('${cart.itemCount}'),
);
🧪 Testabilidade
Backend
javascript// Unit Test Example
describe('AuthService', () => {
  it('should hash password correctly', async () => {
    const hashed = await authService.hashPassword('123456');
    expect(hashed).not.toBe('123456');
  });
});
Frontend
dart// Widget Test Example
testWidgets('Cart shows item count', (tester) async {
  await tester.pumpWidget(CartScreen());
  expect(find.text('0'), findsOneWidget);
});
🔄 Versionamento da API
/api/v1/restaurants  ← Versão atual
/api/v2/restaurants  ← Futuras mudanças
Permite evolução sem quebrar clientes existentes.
📊 Monitoramento
Logs Estruturados
javascriptlogger.info('User logged in', { userId: user.id, email: user.email });
logger.error('Database error', { error: err.message, stack: err.stack });
Métricas

Tempo de resposta das APIs
Taxa de erro
Uso de memória/CPU
Conexões ativas no pool

🚀 Escalabilidade
Horizontal Scaling
       Load Balancer
            │
    ┌───────┼───────┐
    ↓       ↓       ↓
  API-1   API-2   API-3
    │       │       │
    └───────┼───────┘
            ↓
       MySQL DB
Caching Strategy (Futuro)
Client → CDN → Redis Cache → API → Database
📝 Convenções de Código
Backend

camelCase para variáveis e funções
PascalCase para classes
Async/await para operações assíncronas
Try/catch para tratamento de erros

Frontend

camelCase para variáveis e métodos
PascalCase para classes e widgets
Private fields com _underscore
Const constructors quando possível

🎓 Decisões Arquiteturais
Por que Provider?
✅ Oficial do Flutter
✅ Simples e performático
✅ Boa para apps médios
❌ Para apps gigantes, considere Riverpod/Bloc
Por que MySQL?
✅ Relacional - bom para e-commerce
✅ ACID transactions
✅ Amplamente suportado
❌ Para escala massiva, considere PostgreSQL
Por que Express?
✅ Minimalista e flexível
✅ Grande ecossistema
✅ Fácil de aprender
❌ Para TypeScript nativo, considere NestJS
📚 Referências

Flutter Documentation
Express.js Guide
MySQL Documentation
Clean Architecture
REST API Best Practices