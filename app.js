"use strict";
const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');

const app = express()
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

const port = 3000
const { 
  connection, 
  getUsersByCompnyId,
  getAllRelData,
  getUsrsNFruits,
  authenticateToken
} = require('./helpers/utils');

app.get('/get-users-by-company/:companyId', async (req, res) => {
  try {
    
    res.send(await getUsersByCompnyId(req.params.companyId));
  } catch (error) {
    res.status(500).json({ error: error.message });    
  }

})

app.post('/user', async (req, res) => {

  try {

    const con = await connection();
    const insrtdRow = (await con.execute(`INSERT INTO users (
        name_usrs,
        is_active_usrs,
        money_usrs,
        age_usrs,
        gender_usrs,
        latitude_usrs,
        longitude_usrs,
        friends_usrs,
        id_rol,
        id_comp
      )
      VALUES 
      (
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?,
        ?
      )`, Object.values(req.body)))[0];

    const [ user ] = (await con.execute(`SELECT * FROM users WHERE id_usrs = ?`, [insrtdRow.insertId]))[0];
    res.send(user);

  } catch (error) {
    res.status(500).json({ error: error.message });    
  }

})

app.get('/get-all-rel-data', authenticateToken, async (req, res) => {

  try {  
    res.send(await getAllRelData());
  } catch (error) {
    res.status(500).json({ error: error.message });    
  }

})

app.get('/get-usrs-n-fruits', async (req, res) => {

  try {  
    res.send(await getUsrsNFruits());
  } catch (error) {
    res.status(500).json({ error: error.message });    
  }

})

app.post('/login', async (req, res) => {

  try {  

    const { email, password } = req.body;

    if ( !email || !password ) {
      return res.status(400).json({ error: 'Debe proporcionar nombre de usuario y contraseña' });
    }

    const con = await connection();
    
    const [ user ] = (await con.execute(`SELECT * FROM users WHERE email_usrs = ?`, [email]))[0];
    
    if (!user) {
      return res.status(404).json({ error: 'Usuario no existe' });
    }
       
    if (!user.is_active_usrs) {      
      return res.status(400).json({ error: 'Usuario inactivo' })
    }

    const passMatch = await bcrypt.compare(password, user.password_usrs);

    if (!passMatch) {
      return res.status(400).json({ error: 'Contraseña incorrecta' })
    }

    const id_rol = user.id_rol;
    const token = jwt.sign({id:user.id_usrs,id_rol},'UsersApp-2023-Genius',{ expiresIn: '24h' });

    res.send({ token: `Bearer ${token}` });
  } catch (error) {
    res.status(500).json({ error: error.message });    
  }

})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})