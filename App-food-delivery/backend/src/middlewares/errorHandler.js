const logger = require ('../utils/logger');
const errorHandler = (err, req , res , next) => {
    logger.error('Error: ',
        {
            message: err.message,
            stack: err.message,
            url: req.url,
            method: req.method
        }
    );
    if(err.name === 'ValidationError'){
        return res.status(400).json({
            sucess: false,
            message: 'Erro na validadcao:',
            errors: err.errors
        });
    }
    if(err.name === 'UnauthorizedError'){
        return res.status(401).json({
            sucess: false,
            message: 'Nao autorizado',
        });
    }
    if(err.code === 'ER_DUP_ENTRY'){
        return res.status(409).json({
            sucess: false,
            message: 'Registro duplicado>',
        });
    }
    res.status(err.status|| 500).json({
        sucess: false,
            message: err.message ||'Erro interno servidor',
            ...(process.env.NODE_ENV === 'development' && {stack: err.stack})
    });
};
const notFound = (res,res) => {
    res.status(404).json({
        sucess: false,
            message: 'Rota nao encontrada',
    });
};
module.exportsb = {
    errorHandler,
    notFound
};