FROM public.ecr.aws/docker/library/python:3.10-alpine

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 80

CMD ["python", "app.py"]
CMD python app.py