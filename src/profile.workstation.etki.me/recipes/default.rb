#
# Cookbook:: profile.workstation.etki.me
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2020, Etki
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

include_recipe 'profile.workstation.etki.me::arm'
include_recipe 'profile.workstation.etki.me::setup'
include_recipe 'profile.workstation.etki.me::ssh'

remote_file '/tmp/postman.tar.gz' do
  source 'https://dl.pstmn.io/download/latest/linux64'
end

archive_file '/tmp/postman.tar.gz' do
  destination ::File.expand_path('~/.local/opt/postman')
end

link ::File.expand_path('~/.local/bin/postman') do
  to ::File.expand_path('~/.local/opt/postman/Postman')
end
