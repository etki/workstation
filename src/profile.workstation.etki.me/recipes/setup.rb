require 'etc'

directory ::File.join(ENV['HOME'], '.local/bin') do
  recursive true
end
