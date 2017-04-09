FROM python:2.7.13

COPY init_container.sh /bin/
ENV DEPLOYMENT_TARGET=/home/site/wwwroot
EXPOSE 80
CMD ["/bin/init_container.sh"]