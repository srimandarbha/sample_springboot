#
FROM java

ARG appl_dir=/tmp

ARG appl_port=8080

ENV appl_dir=$appl_dir

ENV appl_port=$appl_port

RUN  mkdir -p $appl_dir && useradd ecom

USER ecom

COPY target/*.jar $appl_dir

WORKDIR $appl_dir

EXPOSE $appl_port

ENTRYPOINT java -jar $appl_dir/*.jar

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:$appl_port || exit 1
