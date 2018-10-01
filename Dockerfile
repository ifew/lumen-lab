FROM php:7.1
RUN apt-get update -y && apt-get install -y openssl zip unzip git zlib1g-dev libmemcached-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring 

# Install the php memcached extension
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/v3.0.4.tar.gz" \
  && mkdir -p memcached \
  && tar -C memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
  && ( \
    cd memcached \
    && phpize \
    && ./configure \
    && make -j$(nproc) \
    && make install \
  ) \
  && rm -r memcached \
  && rm /tmp/memcached.tar.gz \
  && docker-php-ext-enable memcached

# Install the php redis extension
RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/3.0.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

WORKDIR /app
COPY . /app
# RUN cd /app/vendor \
#     && rm -Rf *
# RUN useradd docker
# USER docker
# RUN composer install
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add tzdata openntpd

CMD ["php", "-S", "0.0.0.0:8081", "-t", "public/"]
EXPOSE 8081