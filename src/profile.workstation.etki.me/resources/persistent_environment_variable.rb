provides :persistent_environment_variable

property :name, [String, Symbol], name_property: true
property :value, [String, Symbol], required: true

action :add do
  edit_resource(:file, ::File.join(ENV['HOME'], '.config', 'environment')) do
    current = content ? content.split(/\n/) : []
    current << "#{new_resource.name}=#{new_resource.value}"
    content(current.map { |line| line + "\n" }.join)
  end

  edit_resource(:file, ::File.join(ENV['HOME'], '.config', 'environment.exported')) do
    current = content ? content.split(/\n/) : []
    current << "export #{new_resource.name}=#{new_resource.value}"
    content(current.map { |line| line + "\n" }.join)
  end
end