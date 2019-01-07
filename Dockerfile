FROM nginx
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' >> /etc/apt/sources.list.d/backports.list
RUN apt-get update
RUN apt-get -y install python-certbot-nginx -t stretch-backports
COPY ./nginx.conf /etc/nginx/nginx.conf
