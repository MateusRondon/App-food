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
        }catch (error) { 
            next(error);
        }
    }
}
module.exports = new OrderController();