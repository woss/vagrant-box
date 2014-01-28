import "../default.pp"

# Setting up mysql DBs and usernames
$dbs = hiera('databases')
create_resources(mysql_database, $dbs)

# $db_users = hiera('db_users')
# create_resources(mysql_user,$db_users)
mysql_user { 'root@%':
  ensure                   => 'present',
  max_connections_per_hour => '0',
  max_queries_per_hour     => '0',
  max_updates_per_hour     => '0',
  max_user_connections     => '0',
  password_hash => mysql_password("root")
}
mysql_grant { 'root@%/*.*':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'root@%',
}