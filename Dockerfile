FROM liquibase/liquibase:latest
WORKDIR /liquibase
COPY ./liquibase/ .