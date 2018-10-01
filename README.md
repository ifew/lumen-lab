# lumen-lab
For learning and test create lumen api framework



# Using for no docker

## Start Server
php -S localhost:8000 -t public



# Using for one dockerfile, conbined server and sourcecode

## Build image Docker
docker build -t lumen-lab .

## Run image Docker
docker run -p 8081:8081 --name lumen-lab lumen-lab



# Using for separate dockerfile server and sourcecode

## Build image Docker Server
docker build -t lumen-server -f Dockerfile_server .

## Build image Docker Sourcecode
docker build -t lumen-lab -f Dockerfile .

## Run image Docker
docker run -p 8081:8081 --name lumen-lab lumen-lab



# Using for separate dockerfile server and sourcecode mapping from external drive

## Build image Docker Server
docker build -t lumen-server -f Dockerfile_server .

## Build image Docker Sourcecode
docker build -t lumen-lab -f Dockerfile .

## Run image Docker (mapping sourcecode path to local drive)
docker run -p 8081:8081 -v /Users/ifew/www_test/test-php/lumen-lab:/app --name lumen-lab lumen-lab