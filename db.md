## Стандартный код db.js
```
const { Sequelize, Op, DataTypes } = require('sequelize');
const LogsModel = require('./models/logs');
const PersonsModel = require('./models/persons');
const AppealsModel = require('./models/appeals');

const db = new Sequelize({
    database: process.env.DB_NAME,
    username: process.env.DB_USER,
    password: process.env.DB_PASS,
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT,
    logging: false,
    dialectOptions: {
        supportBigNumbers: true,
    },
    define: {
        timestamps: false,
        freezeTableName: true,
    },
    pool: {
        max: 5,
        min: 0,
        idle: 30000,
        acquire: 60000,
    },
});

const Logs = LogsModel(db, DataTypes);
const Persons = PersonsModel(db, DataTypes);
const Appeals = AppealsModel(db, DataTypes);

Persons.hasMany(Appeals);
Appeals.belongsTo(Persons);

module.exports = {
    db,
    Sequelize,
    Op
}
```
