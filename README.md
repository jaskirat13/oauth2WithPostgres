# oauth2WithPostgres
oauth2 Server in Memory using postgres DB with password , authorization code and refresh token

Required Appication Spring Boot2 and postgres  9.3 or above

IDE used can be STS or eclipse with spring boot configuration

Lombok is option - I have used getter and setter in Model Entity 
using lombok - you can remove boilerplate code.

Steps to run
1.the database is configured in application.yam file under src/main/resouces
2.use schema.sql to create table - autoconfigured
3.use data.txt to insert the records

Password are encrypted by bcrypt- Encoder
so default username is jaskirat and password is jaskirat123
and for authorization username is mobile and secret is pin


