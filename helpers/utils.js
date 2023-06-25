const mysql = require('mysql2/promise');

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


module.exports = {
    connection,
    getUsersByCompnyId
}