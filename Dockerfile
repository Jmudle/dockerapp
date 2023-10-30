FROM python:3.8

WORKDIR /dockerapp

COPY . /dockerapp

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
