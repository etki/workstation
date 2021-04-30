provides :package, platform: 'manjaro'

property :package_name, [String, Array], name_property: true
property :options, [String, Hash]
property :source, String
property :timeout, [String, Integer]
property :version, [String, Array]

%i[install purge reconfig remove upgrade].each do |action_name|
  action action_name do
    pacman_package new_resource.name do
      package_name new_resource.package_name
      options new_resource.options
      source new_resource.source
      timeout new_resource.timeout
      version new_resource.version
      action action_name
    end
  end
end
