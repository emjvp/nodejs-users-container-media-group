const mysql = require('mysql2');

const serverParams = async() => {

    return mysql.createConnection({
        host: 'localhost',
        user: 'root',
        database: 'users_app'
      });

}


const foo = async () => {
    await serverParams();
}

module.exports = {
    foo
}