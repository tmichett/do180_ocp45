FROM ubi7/ubi:7.7

MAINTAINER Your Name <tmichett@redhat.com>

# Environment variable for Apache Port
ENV PORT 8080

RUN yum install -y httpd && \
    yum clean all

# Change configuration of Apache WS to listen on the port specified as an environment variable in the Dockerfile

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/

USER apache

# Expose the custom port that you provided in the ENV var
EXPOSE ${PORT}

# Copy all files under src/ folder to Apache DocumentRoot (/var/www/html)
COPY ./src/ /var/www/html/

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
