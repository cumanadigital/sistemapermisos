-- CREATE USER 'userpermisos'@'localhost' IDENTIFIED WITH mysql_native_password;
-- GRANT ALL PRIVILEGES ON *.* TO 'userpermisos'@'localhost' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
-- SET PASSWORD FOR 'userpermisos'@'localhost' = '1234';
-- GRANT ALL PRIVILEGES ON `bdpermisos`.* TO 'userpermisos'@'localhost';


CREATE USER 'userpermisos'@'localhost' IDENTIFIED WITH mysql_native_password;
GRANT ALL PRIVILEGES ON *.* TO 'userpermisos'@'localhost' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
SET PASSWORD FOR 'userpermisos'@'localhost' = '1234';
GRANT ALL PRIVILEGES ON `bdpermisos`.* TO 'userpermisos'@'localhost'
