FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers

RUN apk add --no-cache pkgconfig
RUN apk add --no-cache mariadb-dev
RUN apk add --no-cache python3-dev


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY web-src .
CMD ["flask", "run", "--debug"]
