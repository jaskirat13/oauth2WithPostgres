

CREATE TABLE IF NOT EXISTS   public.tablename (
   colname SERIAL 
);

CREATE TABLE IF NOT EXISTS    public.oauth_client_details (
  client_id varchar(255) not null,
  client_secret varchar(255) not null,
  web_server_redirect_uri varchar(2048) default null,
  scope varchar(255) default null,
  access_token_validity int default null,
  refresh_token_validity int default null,
  resource_ids varchar(1024) default null,
  authorized_grant_types varchar(1024) default null,
  authorities varchar(1024) default null,
  additional_information varchar(4096) default null,
  autoapprove varchar(255) default null,
  primary key (client_id)
) ;
CREATE TABLE IF NOT EXISTS    public.permission (
  id SERIAL not null,
  name varchar(512) default null,
  primary key (id),
  unique  (name)
) ;

CREATE TABLE IF NOT EXISTS   public.role (
  id SERIAL not null,
  name varchar(255) default null,
  primary key (id),
  unique  (name)
); 

CREATE TABLE IF NOT EXISTS   public.user (
  id SERIAL not null,
  username varchar(100) not null,
  password varchar(1024) not null,
  email varchar(1024) not null,
  enabled  int not null,
  accountNonExpired int not null,
  credentialsNonExpired int not null,
  accountNonLocked int not null,
  primary key (id),
  unique (username)
);


CREATE TABLE IF NOT EXISTS    public.permission_role (
  permission_id int default null,
  role_id int default null,
  constraint permission_role_ibfk_1 foreign key (permission_id) references  public.permission (id),
  constraint permission_role_ibfk_2 foreign key (role_id) references  public.role (id)
);



CREATE TABLE IF NOT EXISTS   public.role_user (
  role_id int default null,
  user_id int default null,
  constraint role_user_ibfk_1 foreign key (role_id) references  public.role (id),
  constraint role_user_ibfk_2 foreign key (user_id) references  public.user (id)
);

-- token store
CREATE TABLE IF NOT EXISTS   public.oauth_client_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS   public.oauth_access_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication bytea,
  refresh_token VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS   public.oauth_refresh_token (
  token_id VARCHAR(256),
  token bytea,
  authentication bytea
);

CREATE TABLE IF NOT EXISTS   public.oauth_code (
  code VARCHAR(256), authentication bytea
);

CREATE TABLE IF NOT EXISTS   public.oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);






