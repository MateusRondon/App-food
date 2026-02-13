require('dotenv').config();
const express = require('express');
const cors = require('cors');
const {body} = require('express-validator');
const {testConnection} = require('./config/database');
const logger = require('./middlewares/logger'); // possivel erro
const authMiddleware = require('./middlewares/auth');
const {errorHandler,notFound} = require('./middlewares/errorHandler');

const authController = require('./controllers/authController');
const restaurantController = require('./controllers/restaurantController');
const cartController = require('./controllers/cartController');
const orderController = require('./controllers/orderController');

const app = express();

app.use(cors({
    origin: process.env.CORS_ORIGIN?.split(',') || '*',
}));
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.get('/health', (req, res) => {
    res.send('API de Entrega de Comida funcionando!');
    res.json({status: 'ok', timestamp: new Date().toISOString()});
});

// Rotas de autenticação

const API_PREFIX = process.env.API_PREFIX || '/api/v1';

    //Auth Rota 
//Registro
app.post('${API_PREFIX}/auth/register', [
    body('name').notEmpty().withMessage('Nome é obrigatório'),
    body('email').isEmail().withMessage('Email inválido'),
    body('password').isLength({min: 6}).withMessage('A senha deve conter no mínimo 6 caracteres')
],authController.register);

//Login
app.post('${API_PREFIX}/auth/login',[
    body('email').isEmail().withMessage('Email inválido'),
    body('password').notEmpty().withMessage('Senha é obrigatória')
],authController.login);

// Rotas de restaurantes
app.get('${API_PREFIX}/restaurants', restaurantController.getAll);
app.get('${API_PREFIX}/restaurants/:id', restaurantController.getById);
app.get('${API_PREFIX}/restaurants/:id/menu', restaurantController.getMenu);
app.get('${API_PREFIX}/restaurants/search', restaurantController.search);
app.get('${API_PREFIX}/restaurants/category', restaurantController.getByIdCategory);

// carrinho cart (Protected)
app.get(`${API_PREFIX}/cart`, authMiddleware, cartController.getCart);
app.post(`${API_PREFIX}/cart/items`, authMiddleware, cartController.addItem);
app.put(`${API_PREFIX}/cart/items/:itemId`, authMiddleware, cartController.updateItem);
app.delete(`${API_PREFIX}/cart/items/:itemId`, authMiddleware, cartController.removeItem);
app.delete(`${API_PREFIX}/cart`, authMiddleware, cartController.clearCart);

// Order Routes (Protected)
app.post(`${API_PREFIX}/orders`, authMiddleware, orderController.create);
app.get(`${API_PREFIX}/orders`, authMiddleware, orderController.getUserOrders);
app.get(`${API_PREFIX}/orders/:id`, authMiddleware, orderController.getById);
app.patch(`${API_PREFIX}/orders/:id/status`, authMiddleware, orderController.updateStatus);
app.post(`${API_PREFIX}/orders/:id/cancel`, authMiddleware, orderController.cancel);

// Middleware de tratamento de erros
app.use(notFound);
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
async function startServer() {
    try {
        await testConnection();
        app.listen(PORT, () => {
            logger.info(`🚀 Server running on port ${PORT}`);
            logger.info(`📱 API URL: http://localhost:${PORT}${API_PREFIX}`);
            logger.info(`🌍 Environment: ${process.env.NODE_ENV}`);
        });
    } catch (error) {
        logger.error('Erro ao iniciar o servidor:', error);
        process.exit(1);
    }
}
startServer();
module.exports = app;
