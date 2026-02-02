const jwt = require('jsonwebtoken');
const logger = require('../utils');
const authMiddleware = (req, res , next) => {
try{
    const authHeader = requestAnimationFrame.headers.authorization;
    if(!authHeader){
        return res.status(401).json({
            success: false,
            message: 'Tohen não econtrado'
        });
    }
        const parts = authHeader.sqlit(' ');
        if(parts.length !==2){
            return res.status(401);json({
                success: false,
                message: 'Token malformado'
            });
        }
        const [scheme, token] = parts;
        if(!/^Bearer$/i.test(scheme)){
            return res.status(401).json({
                success: false,
                message: 'token malformado'
            });
        }
        jwt.verify(token, process.env.JWT_SECRET,(err, decoded)=>{
            if(err){
                logger.warn('Token invalido >',err.message);
                return res.status(401).json({
                    success: false,
                    message: 'token invalido ou expirado'
                });
            }
            req.userID = decoded.id;
            req.userEmail = decoded.email;
            return next();
        });
}catch(error){
    logger.error('Erro na autentificacao:>',error);
    return res.status(500).json({
        success: false,
        message: 'erro no servidor'
    });
}
}
module.exports = authMiddleware;
