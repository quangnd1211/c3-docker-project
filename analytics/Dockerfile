FROM public.ecr.aws/docker/library/python:3.14.0a2-slim-bullseye

WORKDIR /app

COPY . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]