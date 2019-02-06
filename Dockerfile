#
FROM java

ARG app_dir=/tmp

ARG app_port=8080

ENV appl_dir=${app_dir}

ENV appl_port=${app_port}

#VOLUME $appl_dir

COPY target/*.jar $appl_dir

#WORKDIR $appl_dir
#WORKDIR /app/

EXPOSE $appl_port

ENTRYPOINT java -jar $appl_dir/*.jar

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:$appl_port || exit 1
