FROM python:3.8

WORKDIR /dockerapp

COPY . /dockerapp

RUN pip install -r requirements.txt
RUN pip install --upgrade flask werkzeug

EXPOSE 5000

ENTRYPOINT ["python", "app.py"]
