FROM alpine:3.17
ENV FLASK_PATH /var/app
ENV FLASK_USER FLASKUSER
RUN mkdir $FLASK_PATH
RUN adduser -h $FLASK_PATH -s /bin/sh -D $FLASK_USER
WORKDIR $FLASK_PATH
COPY . .
RUN chown -R $FLASK_USER:$FLASK_USER $FLASK_PATH
RUN apk update && apk add --no-cache python3 && apk add --no-cache py-pip
RUN pip install -r requirements.txt
USER $FLASK_USER
EXPOSE 5000
CMD ["python3" , "app.py"]
