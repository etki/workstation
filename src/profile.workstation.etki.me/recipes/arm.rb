user_systemctl 'systemd.reload' do
  arguments ['daemon-reload']
  action :nothing
end