## Пример POST запроса через curl
```
curl -X POST http://localhost:3000/login
    -H 'Content-Type: application/json'
    -d '{"email":"test@test.com","password":"my_password"}'
```
