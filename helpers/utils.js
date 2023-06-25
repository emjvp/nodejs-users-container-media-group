const mysql = require('mysql2/promise');
const jwt = require('jsonwebtoken');

const connection = async() => {

    return await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        database: 'users_app'
      });

}


const getUsersByCompnyId = async (companyId) => {
    const con = await connection();
    
    const [ users ] = await con.execute(
        'SELECT * FROM users WHERE id_comp = ? AND is_active_usrs = ?', [companyId, 1]
    );

    const [ data ] = (await con.execute(
        'SELECT sum(money_usrs) as total FROM users WHERE id_comp = ? AND is_active_usrs = ?', [companyId, 1]
    ))[0];

    users.push({ total_money: data.total});

    
    return users;
}


getAllRelData = async () => {
    const con = await connection();

    const [ rows ] = await con.execute(`select u.*, r.*, c.* from users u 
    left join roles r on u.id_rol = r.id_rol
    left join companies c on c.id_comp = u.id_comp`);

    return rows;
}


getUsrsNFruits = async () => {
    const con = await connection();

    const [ dataFruits ] = (await con.execute(`SELECT COUNT(id_fruts) total FROM users_fruits`))[0];

    const [ dataUsrs ] = (await con.execute(`SELECT COUNT(id_usrs) total FROM users`))[0];
    
    return {
        total_fruit: dataFruits.total,
        cuantity_persons: dataUsrs.total
    }
}


const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
  
    console.log(req.headers.authorization);
    if (token == null) {
      return res.sendStatus(401);
    }
  
    jwt.verify(token, 'UsersApp-2023-Genius', (err, user) => {
      if (err) {
        return res.sendStatus(403);
      }
      req.user = user;
      next();
    });
}

module.exports = {
    connection,
    getUsersByCompnyId,
    getAllRelData,
    getUsrsNFruits,
    authenticateToken
}