FROM python:2.7.13

ENV DEPLOYMENT_TARGET=/home/site/wwwroot
ENV NGINX_VERSION 1.12.0-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y libpcre3-dev build-essential \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs \
						gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN mkdir -p /home/LogFiles/docker \
	&& ln -sf /dev/stdout /home/LogFiles/docker/access.log \
	&& ln -sf /dev/stderr /home/LogFiles/docker/error.log

COPY init_container.sh /bin/
COPY nginx.conf /etc/nginx/nginx.conf

RUN chmod 777 /bin/init_container.sh

EXPOSE 80 443
CMD ["/bin/init_container.sh"]
