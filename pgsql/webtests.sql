--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE webadmin;
ALTER ROLE webadmin WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION PASSWORD 'md58dd32da7a80d335f51182ffe99aa406b';

--
-- Database creation
--

CREATE DATABASE webtests WITH TEMPLATE = template0 OWNER = webadmin;
