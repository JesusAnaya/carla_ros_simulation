FROM python:3.7

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt
RUN pip install 'carla==0.9.14'

CMD [ "python", "./client.py" ]
