FROM python:2.7.13

COPY init_container.sh /bin/
ENV DEPLOYMENT_TARGET=/home/site/wwwroot
RUN chmod 755 /bin/init_container.sh
EXPOSE 80
CMD ["/bin/init_container.sh"]