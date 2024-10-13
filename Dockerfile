FROM --platform=linux/amd64 python:3.11
FROM python:3.11

ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN chmod +x /usr/local/bin/gunicorn
EXPOSE 8000
CMD ["gunicorn", "django_kubernetes_tutorial.wsgi:application", "--bind", "0.0.0.0:8000"]
