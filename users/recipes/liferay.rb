#
# Cookbook Name:: users
# Recipe:: liferay
#
# Copyright 2009-2011, Opscode, Inc.
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

include_recipe "sudo"

liferay_user = "liferay"

users_manage_noid liferay_user do
  action [ :remove, :create ]
end


# add sudoers
sudo liferay_user do
  template "app.erb"
  variables(
            {
              "name" => liferay_user,
              "service" => liferay_user
            }
            )
end


