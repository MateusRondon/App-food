const ordemService = require('../services/orderService');

class orderController {
    async create (req, res, next) {
        try {
            const {paymentMethod, deliveryAddress} = req.body;
            if(!paymentMethod || !deliveryAddress){
                return res.status(400).json({
                    success: false,
                    message: 'Método de pagamento e endereço são obrigatórios'
                });
            }
            const order = await ordemService.createOrder(req.body, req.user.id); 
            return res.status(201).json({
            success: true,
            message: 'Pedido Criado com sucesso',
            data: order
        });
        }catch (error) { 
            if(error.message ==='carrinho vazio'){
                return res.status(400).json({
                    success: false,
                    message: error.message
                });
            }
            next(error);
        }
        

    }
    async getbyId (req, res, next) {
        try{
            const {id} = req.params;
            const order = await ordemService.getOrderById(id, req.user.id);
            res.json({
                success: true,
                data: order
            });
        }catch (error) {
            if(error.message === 'Pedido não encontrado'){
                return res.status(404).json({
                    success: false,
                    message: error.message
                });
            }
            next(error);
        }
    }

    getUserOrders (req, res, next) {
        try{
            const {limit} = req.query;
            const orders = ordemService.getUserOrders(req.user.id, limit? parseInt(limit) : 20);
            res.json({
                success: true,
                data: orders
            });
        }catch (error) {
            next(error);
        }
    }
    async updateStatus (req, res, next) {
        try{
            const {id} = req.params;
            const {status} = req.body;
            if(!status){
                return res.status(400).json({
                    success: false,
                    message: 'Status é obrigatório'
                });
            }
            const order = await ordemService.updateOrderStatus(id, status);
            res.json({
                success: true,
                message: error.message,
                data: order
            });
        }catch (error) {
            if(error.message === 'status inválido'){
                return res.status(400).json({
                    success: false,
                    message: error.message
                });
            }
            next(error);
        }
    }
    async cancel (req, res, next) {
        try{
            const {id} = req.params;
            const order = await ordemService.cancelOrder(id, req.user.id);
            res.json({
                success: true,
                message: 'Pedido cancelado com sucesso',
                data: order
            });
        }catch (error) {
            if(error.message.includes('não pode ser cancelado')){
                return res.status(404).json({
                    success: false,
                    message: error.message
                });
            }
            next(error);
        }
    }
}
module.exports = new OrderController();