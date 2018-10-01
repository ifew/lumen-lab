# lumen-lab
For learning and test create lumen api framework

## Start Server
php -S localhost:8000 -t public

## Build image Docker
docker build -t lumen-lab .

## Run image Docker
docker run -p 8081:8081 --name lumen-lab lumen-lab