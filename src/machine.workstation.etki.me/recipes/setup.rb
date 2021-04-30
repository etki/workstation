pacman_group 'base-devel' if platform?('arch', 'manjaro')

file '/etc/sysctl.conf' do
  action :touch
end

sysctl 'fs.inotify.max_user_watches' do
  value '524288'
end

sysctl 'vm.max_map_count' do
  value '262144'
end

package_bundle 'setup.hardware' do
  packages %w[dmidecode]
end

file '/etc/chef/client.rb' do
  content 'ohai.disabled_plugins = [:shard_seed]'
end
