FROM alpine:3.17
RUN mkdir /var/app
RUN adduser -h /var/app -s /bin/sh -D flaskapp
WORKDIR /var/app
COPY . .
RUN chown -R flaskapp:flaskapp
RUN apk update && apk add --no-cache python3 && apk add --no-cache py-pip
RUN pip install -r requirements.txt
USER flaskapp
EXPOSE 5000
CMD ["python3" , "app.py"]
