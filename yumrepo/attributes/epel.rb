#
# Cookbook Name:: yumrepo
# Attributes:: epel 
#
# Copyright 2011, Eric G. Wolfe 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default["repo"]["epel"]["url"] = "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node[:platform_version].split('.')[0]}&arch=$basearch"

if node["platform_version"].to_i >= 6
  set["repo"]["epel"]["key"] = "RPM-GPG-KEY-EPEL-6"
else
  set["repo"]["epel"]["key"] = "RPM-GPG-KEY-EPEL"
end
default["repo"]["epel"]["key_url"] = "http://download.fedora.redhat.com/pub/epel/#{node["repo"]["epel"]["key"]}"
