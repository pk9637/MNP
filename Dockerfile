FROM centos:7
RUN yum install -y httpd \
	zip \
	unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/startup.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip startup.zip
RUN cp -rvf startup-website-template/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
