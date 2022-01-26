provides :user_systemd_service

property :name, [String, Symbol], name_property: true
property :source, [String, Symbol], required: true

action_class do
  def service_name
    new_resource.name.gsub(/\.service$/, '')
  end

  def location
    ::File.join(ENV['HOME'], '.config', 'systemd', 'user', service_name + '.service')
  end
end

action :install do
  user_systemctl "#{service_name}.enable" do
    arguments ['enable', service_name]
    action :nothing
  end
  user_systemctl "#{service_name}.start" do
    arguments ['start', service_name]
    action :nothing
  end

  directory ::File.dirname(location) do
    recursive true
    action :create
  end

  cookbook_file location do
    source new_resource.source
    notifies :run, 'user_systemctl[systemd.reload]', :immediately
    notifies :run, "user_systemctl[#{service_name}.enable]", :immediately
    notifies :run, "user_systemctl[#{service_name}.start]", :immediately
  end
end

action :delete do
  user_systemctl "#{service_name}.stop" do
    arguments ['stop', service_name]
    action :nothing
  end
  user_systemctl "#{service_name}.disable" do
    arguments ['disable', service_name]
    action :nothing
  end

  cookbook_file location do
    action :delete

    notifies :run, "user_systemctl[#{service_name}.stop]", :before
    notifies :run, "user_systemctl[#{service_name}.disable]", :before
    notifies :run, 'user_systemctl[systemd.reload]', :immediately
  end
end