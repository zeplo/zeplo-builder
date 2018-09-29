FROM alpine

COPY ./start.sh /start.sh
COPY ./builders /builders

RUN chmod +x /start.sh

CMD /start.sh