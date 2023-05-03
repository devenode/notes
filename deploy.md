# Пример файла deploy.sh

#!/bin/bash

```
rm -rf prod/* prod/.*
touch prod/.env
cp -v prod.env prod/.env

cp -R api prod
cp -R middleware prod
cp -R models prod
cp -R static prod
cp -R utils prod
cp -R views prod
cp app.js prod
cp db.js prod
cp package.json prod

cd prod
npm install
tar czf app.tar.gz api/ middleware/ models/ node_modules/ static/ utils/ views/ app.js db.js package.json .env

scp app.tar.gz user@111.111.111.111:~/project_dir
rm app.tar.gz

ssh user@111.111.111.111 << 'ENDSSH'
pm2 stop app
rm -rf project_dir/* project_dir/.*
tar xf app.tar.gz -C project_dir
rm app.tar.gz
pm2 start app
ENDSSH
```
