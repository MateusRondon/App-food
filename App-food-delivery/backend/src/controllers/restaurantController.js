const restaurantService = require('../services/restaurantService');
const { validationResult } = require('express-validator');

class restaurantController {
    //criar restaurante
    async getall(req, res, next) {
        try {
            const{ category , isOpen} = req.query;
            const filter = {};
            if(category)filter.category = category;
            if(isOpen!== undefined) filter.isOpen = isOpen === 'true';
            
            //restaurante filtrado
            const result = await restaurantService.getAll(filter);
            res.status(200).json({
                success: true,
                data: result
            });


        }catch (error) {
            next(error);
        }
    }
}
module.exports = new restaurantController();