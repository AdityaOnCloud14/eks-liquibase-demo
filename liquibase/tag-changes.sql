--liquibase formatted sql

--changeset dev_team:003
--sqlfluff: disable=all
tagDatabase v1.0;
--sqlfluff: enable=all
