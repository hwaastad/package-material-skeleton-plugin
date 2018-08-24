From maven:3.5-alpine as builder
WORKDIR /opt/plugin
COPY code .
RUN mvn clean package

From gocd/gocd-server:v18.7.0
WORKDIR /godata/plugins/external/
COPY --from=builder /opt/plugin/target/docker-poller-plugin-1.2.0.jar .
