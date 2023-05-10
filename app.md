## Стандартный код app.js
```
import 'dotenv/config.js'
import express from 'express'
import next from 'next'
import cors from 'cors'
import cookieParser from 'cookie-parser'
import db from './server/db.js'
import logger from './server/utils/logger.js'
import auth from './server/middleware/auth.js'
import api from './server/api/api.js'


const dev = process.env.NODE_ENV !== 'production'
const server = next({ dev })
const handle = server.getRequestHandler()
const app = express()


app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(cookieParser())
app.use(auth)
app.use(api)
app.get(`*`, (req, res) => handle(req, res));


(async () => {
    try {
        await db.sync()
        await logger({ type: `info`, message: `DB's tables synchronization done!` })

    } catch (error) {
        console.log(`Can't synchronize with DB's tables`)
        console.log(error)
        process.exit(1)
    }

    try {
        await server.prepare()
        const port = process.argv.slice(2)[0] || process.env.PORT

        await startListen(port)
        await logger({ type: `info`, message: `Server listening ${port} port in ${process.env.NODE_ENV}` })

        

    } catch (error) {
        await logger({ type: `error`, message: error.message, stack: error.stack })
        process.exit(1)
    }
})()


const startListen = port => {
    return new Promise((res, rej) => {
        if (process.env.NODE_ENV !== `production`) {
            app.listen(port, err => {
                if (err) rej(err)
                else res()
            })
        } else {
            app.listen(port, `127.0.0.1`, err => {
                if (err) rej(err)
                else res()
            })
        }
    })
}
```
