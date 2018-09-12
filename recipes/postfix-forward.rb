template '/home/mailuser/.forward' do
  action :nothing
  source 'forward.erb'
  user 'mailuser'
  group 'mailuser'
  subscribes :create, 'user[mailuser]'
end
