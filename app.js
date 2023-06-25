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
  getUsrsNFruits
} = require('./helpers/utils');

app.get('/get-users-by-company/:companyId', async (req, res) => {
  try {
    
    res.send(await getUsersByCompnyId(req.params.companyId));
  } catch (error) {
    console.error(error);
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
    console.error(error);
  }

})

app.get('/get-all-rel-data', async (req, res) => {

  try {  
    res.send(await getAllRelData());
  } catch (error) {
    console.error(error);
  }

})

app.get('/get-usrs-n-fruits', async (req, res) => {

  try {  
    res.send(await getUsrsNFruits());
  } catch (error) {
    console.error(error);
  }

})

app.post('/login', async (req, res) => {

  try {  

    const { email, password } = req.body;

    if (!email || !password) {
      console.error("Error no ingresó el email o la contraseña");
    }

    const con = await connection();
    
    const [ user ] = (await con.execute(`SELECT * FROM users WHERE email_usrs = ?`, [email]))[0];
    
    if (!user) {
      console.error("Empty data");
    }
   

    if (!user.is_active_usrs) {      
      console.log("user inactive");
    }

    // user.password = '123456';
    if (!user.password_usrs) {
      console.log("password is not defined");
    }

    const passMatch = await bcrypt.compare(password, user.password_usrs);
    // console.log(passMatch);

    if (!passMatch) {
      console.log('Incorrect password');
    }

    const id_rol = user.id_rol;
    const token = jwt.sign({id:user.id_usrs,id_rol},'UsersApp-2023-Genius',{ expiresIn: '24h' });

    res.send({ token });
  } catch (error) {
    console.error(error);
  }

})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})