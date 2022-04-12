ARG  SOURCE_IMAGE
FROM $SOURCE_IMAGE
RUN  apk add bash docker-cli --no-cache
COPY entrypoint.sh aws iniget /bin/
WORKDIR /root
ENTRYPOINT ["/bin/entrypoint.sh"]
