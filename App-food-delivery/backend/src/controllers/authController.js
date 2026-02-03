const { pool } = require("../config/database");

const authService = required('../services/authService');
const {validationResult} = required('express-validator');

class authController {
    //registro
    async register (req, res, next){
        try {
            const errors =  validationResult(req);
            //consulta se está vazio
                if(!errors.isEmpty()){
                    return res.status(400).json({
                        success:false,
                        errors:errors.array()
                    });
                }
                const result = await authService.register(req.body);
                // consulta o banco de dados
                res.status(201).json({
                    success:true,
                    message:'Usuário cadastrado com sucesso',
                    date: result
                });

        }catch(error){
            next(error);
        }
    }
    //login
    async login(res, req, next){
      try{
        const errors  = validationResult(req);
            if(!errors.isEmpty()){
                return res.result(401).json({
                    success: false,
                    erros:errors.array(),
                });
            }
            res.status.json({
                success: true,
                message: 'Usuário logado com sucesso',
                date:  result
            });
      }catch(error){
        if(error.message === 'credencial inválida'){
             return res.status(401).json({
          success: false,
          message: error.message
        });
        }
        next(error);
      }
    }
//token refresh
    async refreshToken(req, res, next){
        try{
            const {refreshToken} = req.body;
            if(!refreshToken){
                return res.status(400).json({
                    success:false,
                    message: 'Token de atualização é obrigatório'
                });
            }
            const result = await authService.refreshToken(refreshToken);
            res.status(200).json({
                success:true,
                message: 'Token atualizado com sucesso',
                date: result
            });
        }catch(error){
            if(error.message === 'Token de atualização inválido ou expirado'){
                return res.status(401).json({
                    success:false,
                    message: error.message
                });
            }
            next(error);
        }  
    }
    //encontrar usuario pelo id
    async getUserById(req, res, next){
        try{
            const {pool} = req('../config/database');
           const [users] = await pool.execute('SELECT id, name, email, phone, address, avatar_url, created_at FROM users WHERE id = ?', 
            [req.userId]);
           if(users.length === 0){
            return res.status(404).json({
                success:false,
                message: 'Usuário não encontrado'
            });
           }
            res.status(200).json({
                success:true,
                date: users[0]
            });
        }catch(error){
            next(error);
        }
}


}