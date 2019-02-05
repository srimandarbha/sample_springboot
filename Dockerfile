#
FROM java

ENV app_dir=/app

ENV app_port=8080

ARG appl_dir=${app_dir}

ARG appl_port=${app_port}

VOLUME $appl_dir

COPY target/*.jar $appl_dir

#WORKDIR $appl_dir

EXPOSE $appl_port

ENTRYPOINT java -jar $appl_dir/*.jar

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:$appl_port || exit 1
