FROM continuumio/anaconda3

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD . $APP_ROOT

RUN pip install --upgrade setuptools && pip install -r requirements.txt

RUN conda create -y --name minian python=3.8
RUN echo "conda activate minian" >> /root/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

RUN conda install -y -c conda-forge -n minian minian

RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.kernel_spec_manager_class='environment_kernels.EnvironmentKernelSpecManager'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.EnvironmentKernelSpecManager.env_dirs=['/opt/conda/envs/minian']" >> /root/.jupyter/jupyter_notebook_config.py
