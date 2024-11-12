## Install Netcat on CentOS
Використовується для перевірки використання портів під час zero-downtime deployment!

Update the package list (optional but recommended):

```
sudo yum update -y
```

Install Netcat:
```
sudo yum install nc -y
```

### Dumy example zero-downtime deployment
```
ssh root@142.93.xxx.xxx << 'ENDSSH'
DEPLOY_DIR="/home/project"
TEMP_DIR="/tmp/deploy/project"
GZIP_DIR="/home/project/static/gzip"
PORT_1=1000
PORT_2=2000

rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR
tar xf app.tar.gz -C $TEMP_DIR
rm -rf app.tar.gz

pm2 stop app_1 || true
redis-cli FLUSHALL
rm -rf $DEPLOY_DIR/*
cp -r $TEMP_DIR/* $DEPLOY_DIR/
cd $DEPLOY_DIR
npm install
pm2 start app.js --name app_1 -- $PORT_1

until nc -zv 127.0.0.1 $PORT_1; do
  echo "Waiting for app_1 to start on port $PORT_1..."
  sleep 5
done
echo "app_1 is now listening on port $PORT_1"

pm2 stop app_2 || true
redis-cli FLUSHALL
rm -rf $GZIP_DIR/*
pm2 start app.js --name app_2 -- $PORT_2

rm -rf $TEMP_DIR
ENDSSH
```
