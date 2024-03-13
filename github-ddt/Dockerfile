#Use a lightweight Linux distribution
FROM alpine:latest 
RUN apk add curl jq
COPY ./upload-results-s3.sh /usr/local/bin/upload-results-s3.sh
RUN chmod a+x /usr/local/bin/upload-results-s3.sh
ENTRYPOINT ["/bin/sh"]
