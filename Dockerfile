FROM lumen-server:latest

WORKDIR /app
COPY . /app

CMD ["php", "-S", "0.0.0.0:8081", "-t", "public/"]
EXPOSE 8081