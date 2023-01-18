FROM python:3.10-slim-buster


ENV PYTHONBUFFERED=1
ENV WEBAPP_DIR=/inventoySystem


WORKDIR /app
COPY ./inventoySystem ./

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt

#CMD [ "python3","manage.py","runserver","0.0.0.0:8000"]

CMD [ "gunicorn", "inventoySystem.wsgi:application", "--bind", "0.0.0.0:8000"]