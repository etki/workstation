provides :package_bundle

property :packages, Array, required: true
property :extras, Hash, default: {}
property :overrides, Hash, default: {}

%i[install remove].each do |action_name|
  action action_name do
    attributes = node['machine.workstation.etki.me']&.[]('packages')
    segments = new_resource.name.split('.')

    configuration = segments.reduce(attributes) do |cursor, segment|
      cursor&.[](segment)
    end

    next if configuration&.[]('disabled')

    new_resource.packages.each do |package_name|
      override = new_resource.overrides[node['platform']]&.[](package_name)
      next if false.eql?(override)

      resolved = override || package_name

      next if configuration&.[]('package')&.[](resolved)&.[]('disabled')

      package resolved do
        action action_name
      end
    end

    extras = new_resource.extras[node['platform']] || []
    extras.each do |package_name|
      package package_name do
        action action_name
      end
    end
  end
end
