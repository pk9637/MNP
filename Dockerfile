FROM nginx
RUN echo "<h1>Hello Prasanta</h1>" > /usr/share/nginx/html/index.html
RUN echo "<h3>System IP : `hostname -I`</h3>" >> /usr/share/nginx/html/index.html
RUN echo "<h3>Version is : `cat /sys/class/dmi/id/product_version`</h3>" >> /usr/share/nginx/html/index.html
RUN echo "<h3>Date is : `date`</h3>" >> /usr/share/nginx/html/index.html
