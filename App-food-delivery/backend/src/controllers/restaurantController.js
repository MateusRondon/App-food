const restaurantService = require('../services/restaurantService');
const { validationResult } = require('express-validator');

class restaurantController {
    //criar restaurante
    async getall(req, res, next) {
        try {
            //categoria e isOpen
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
    getMenu(req, res, next) {
        try {
            const id = req.params.id;
            const menu = restaurantService.getRestaurantMenu(id);
            res.status(200).json({
                success: true,
                data: menu
            });
            // if(!menu.isOpen) {
            //     res.status(404).json({
            //         success: false,
            //         message: "Menu is not open"
            //     });
            // }
        } catch (error) {
            next(error);
        }
    }
    async search(req, res, next) {
        try{
            const { q } = req.query;
            if(!q){
                return res.status(400).json({
                    success: false,
                    message: "Parametro de busca nao fornecido"
                });
            }
            const restaurants = await restaurantService.searchRestaurants(q); 
            res.status(200).json({
                success: true,
                data: restaurants
            });
        }catch(error){
            next(error);
        }
    }
    getcategories(req, res, next) {
        try {
            const categories = restaurantService.getAllCategories();
            res.status(200).json({
                success: true,
                data: categories
            });
        } catch (error) {
            next(error);
        }
    }
}
module.exports = new restaurantController();