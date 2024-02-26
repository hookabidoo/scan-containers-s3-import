FROM returntocorp/semgrep:sha-62354d5-nonroot
# base semgrep image is alpine linux w/ jq and curl already installed
COPY ./upload-results-s3.sh /usr/local/bin/upload-results-s3.sh
RUN chmod a+x /usr/local/bin/upload-results-s3.sh
ENTRYPOINT ["/bin/sh"]
