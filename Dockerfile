FROM ubuntu:14.04
MAINTAINER Machine Intellegence Lab at SCU "http://www.machineilab.org"

RUN apt-get update

RUN apt-get install -y build-essential 

RUN apt-get install -y python python-dev python-setuptools

# install nginx
RUN apt-get install -y nginx

RUN apt-get install -y python-pip

# install uwsgi
RUN pip install uwsgi

RUN pip install Flask

# Add nginx conf 
RUN rm /etc/nginx/nginx.conf
ADD Example/nginx.conf /etc/nginx/

# Add uwsgi ini  testserver.ini runserver.ini
RUN mkdir ~/example
ADD Example/testserver.ini ~/example/
ADD Example/runserver.ini ~/example/

# Add example Example.py
RUN mkdir ~/example/WebApp
ADD Example/WebApp/Example.py ~/example/WebApp/

# Add readme
ADD Example/Readme ~/example/ 

WORKDIR ~/example/

# CMD ["nginx"]

EXPOSE 80





