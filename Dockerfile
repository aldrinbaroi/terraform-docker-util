ARG  SOURCE_IMAGE
FROM $SOURCE_IMAGE
RUN  apk add bash docker-cli --no-cache
COPY entrypoint.sh /bin
COPY aws /bin
ENTRYPOINT ["/bin/entrypoint.sh"]
