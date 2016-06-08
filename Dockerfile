FROM drupal:7

# Install xdebug
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

# Install mysql-client
RUN apt-get update && apt-get install -y mysql-client

# Install drupal console
RUN curl https://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal
RUN chmod +x /usr/local/bin/drupal

# Install drush console
RUN curl http://files.drush.org/drush.phar > drush.phar
RUN chmod +x drush.phar
RUN mv drush.phar /usr/local/bin/drush
