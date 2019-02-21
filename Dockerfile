FROM alpine

LABEL maintainer="calum@zeplo.io"
LABEL organization="zeplo"

COPY ./start.sh /start.sh
COPY ./builders /builders

RUN chmod +x /start.sh

CMD /start.sh