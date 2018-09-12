user 'mailuser' do
  name 'mailuser'
  home '/home/mailuser'
  manage_home true
  action :create
end

directory '/opt/postfix_redis' do
  mode 0755
end

template '/opt/postfix_redis/store.py' do
  source 'store.py.erb'
  mode 0755
  notifies :run, 'execute[chcon-postfix]'
end

template '/opt/postfix_redis/get.py' do
  source 'get.py.erb'
  mode 0755
end

execute 'chcon-postfix' do
  command 'chcon -t postfix_local_exec_t /opt/postfix_redis/store.py'
  action :nothing
end
