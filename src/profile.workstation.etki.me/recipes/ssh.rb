require 'etc'

# A shameless ripoff from https://unix.stackexchange.com/questions/339840/how-to-start-and-use-ssh-agent-as-systemd-service

directory ::File.join(ENV['HOME'], '.ssh') do
  recursive true
end

cookbook_file ::File.join(ENV['HOME'], '.ssh', 'config') do
  source 'ssh/config.dist'
  action :create_if_missing
end

user_systemd_service 'ssh-agent' do
  source 'ssh/agent.service'
end

persistent_environment_variable :SSH_AUTH_SOCK do
  value "#{ENV['XDG_RUNTIME_DIR']}/ssh-agent.socket"
end
