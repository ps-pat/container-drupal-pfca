FROM docker.io/drupal:11.1.7
LABEL maintainer="Patrick Fournier p_fournier@hushmail.com"

ARG user="drupal"
ARG uid=1000

RUN set -eux; \
        useradd -G www-data -u $uid -d /home/$user $user; \
        mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user; \
        chown -R $user:$user /opt/drupal;

RUN set -eux; \
        apt update && apt install -y git unzip;

USER drupal

RUN set -eux; \
        composer require \
        drush/drush \
        drupal/fontawesome \
        drupal/mathjax \
        drupal/bootstrap5 \
        drupal/simple_search_form \
        drupal/gin \
        drupal/editor_advanced_link \
        drupal/simple_sitemap;

USER root
