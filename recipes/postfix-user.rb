user 'mailuser' do
  name 'mailuser'
  home '/home/mailuser'
  manage_home true
  notifies :create, 'template[/home/mailuser/store.py]'
  notifies :create, 'template[/home/mailuser/get.py]'
  action :create
end

template '/home/mailuser/store.py' do
  source 'store.py.erb'
  user 'mailuser'
  group 'mailuser'
  mode 0755
  notifies :run, 'execute[chcon-postfix]'
end

template '/home/mailuser/get.py' do
  source 'get.py.erb'
  user 'mailuser'
  group 'mailuser'
  mode 0755
end

execute 'chcon-postfix' do
  command 'chcon -t postfix_local_exec_t /home/mailuser/store.py'
  action :nothing
end

directory '/home/mailuser' do
  mode 0755
end
