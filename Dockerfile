FROM continuumio/miniconda3:4.9.2

# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y libgl1-mesa-dev

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD . $APP_ROOT

RUN conda install -y -c conda-forge minian

# RUN jupyter notebook --generate-config
# RUN echo "c.NotebookApp.kernel_spec_manager_class='environment_kernels.EnvironmentKernelSpecManager'" >> /root/.jupyter/jupyter_notebook_config.py
# RUN echo "c.EnvironmentKernelSpecManager.env_dirs=['/opt/conda/envs/minian']" >> /root/.jupyter/jupyter_notebook_config.py
