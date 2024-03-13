# syntax=docker/dockerfile:1

# base python image for custom image
FROM python:3.9.13-slim-buster

# create working directory and install pip dependencies
WORKDIR /codon-optimization

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

# copy python project files from local to /codon-optimization image working directory
COPY . .

# run the flask server  
CMD [ "sh" , "run.sh"]