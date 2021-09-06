FROM continuumio/miniconda3:4.9.2

RUN apt-get update --allow-releaseinfo-change && apt-get install -y libgl1-mesa-dev

RUN conda install -y -c conda-forge minian

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD . $APP_ROOT
