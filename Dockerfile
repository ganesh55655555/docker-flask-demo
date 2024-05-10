FROM httpd:latest
COPY . /usr/local/apache2/htdocs/
EXPOSE 8083
CMD ["apachectl", "-D", "FOREGROUND"]
