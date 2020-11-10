FROM python:3.8.6-slim

ENV PYTHONPATH "/opt/python/library"

COPY requirements.txt /tmp/requirements.txt

RUN set -x && \
    pip install -U pip && \
    pip install -r /tmp/requirements.txt && \
    mkdir -p /opt/python/library && \
    mkdir -p /opt/python/jupyter && \
    mkdir -p /opt/python/jupyterlab && \
    mkdir ~/.jupyter && \
    mkdir -p /usr/share/fonts && \
    rm /tmp/requirements.txt

COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY $PWD/fonts /usr/share/fonts

EXPOSE 8888
CMD ["jupyter", "lab", "--allow-root"]
