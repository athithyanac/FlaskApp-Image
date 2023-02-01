FROM alpine:3.17
RUN mkdir /var/app
WORKDIR /var/app
COPY . .
RUN apk update && apk add --no-cache python3 && apk add --no-cache py-pip
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3" , "app.py"]