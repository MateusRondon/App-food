const cartservice = require('../services/cartService');


class cartController {
    //adicionar item ao carrinho
    async getCart(req, res, next) {
        try {
           const cart = await cartservice.getCart(req.userId);

           res.json({
            success: true,
            data: cart
           });
        }catch (error) {
            next(error);
        }
    }
    async addItem(req, res, next) {
        try {
            const {produtId, quantity} = req.body;

            if(!produtId){
                return res.status(400).json({
                    success: false,
                    message: "ProdutoId é obrigatório"
                });
            }
            const cart = await cartservice.addItem(req.userId, produtId, quantity||1);
            res.json({
                success: true,
                message: "Item adicionado ao carrinho",
                data: cart
            });
        }catch (error) {
            if(error.message.includes("Produto não encontrado")){
                return res.status(404).json({
                    success: false,
                    message: error.message
                });
            }
            next(error);
        }
    }

   async removeItem(req, res, next) {
        try {
            const cart = await cartservice.removeItem(req.userId, itemId);
            res.json({
                success: true,
                message: "Item removido do carrinho",
                data: cart
            });
        }catch (error) {
            next(error);
        }
   }
   
   async clearCart(req, res, next) {
        try {
            const cart = await cartservice.clearCart(req.userId);
            res.json({
                success: true,
                message: "Carrinho limpo",
                data: cart
            });
        }catch (error) {
            next(error);
        }
   }
}
module.exports = new cartController();