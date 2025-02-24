FROM python:3.14.0a4-alpine3.21

LABEL maintainer="Zoma"

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt  /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app

EXPOSE 8000


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp & \
    adduser \
    --disabled-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user
