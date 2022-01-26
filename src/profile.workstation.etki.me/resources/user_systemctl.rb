provides :user_systemctl

property :name, [String, Symbol], name_property: true
property :arguments, [Array, NilClass], required: false, default: nil

action :run do
  expansion = new_resource.arguments || [new_resource.name]
  arguments = ['systemctl', '--user', *expansion]
  execute "user-systemctl.#{new_resource.name}" do
    command arguments
  end
end