FROM python:2.7.13

RUN mkdir -p /home/site/wwwroot

WORKDIR /home/site/wwwroot
COPY requirements.txt ./
RUN pip install -r requirements.txt

EXPOSE 80
CMD ["python", "index.py"]
