FROM buildpack-deps:wheezy
RUN apt-get update && apt-get install -y python python-pip python-dev libldap2-dev libsasl2-dev
ENV PYTHONUNBUFFERED 1
ADD . /code
WORKDIR /code
RUN pip install -U setuptools
RUN pip install -r requirements/dev.txt