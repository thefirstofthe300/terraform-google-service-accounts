# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

control "gcp" do
  title "GCP Resources"

  describe google_service_account(name: "projects/#{attribute("project_id")}/serviceAccounts/#{attribute("email")}") do
    its('project_id') { should eq attribute('project_id') }
  end

  describe google_project_iam_binding(project: "#{attribute("project_id")}",  role: 'roles/viewer') do
    its('members') {should include attribute('iam_email') }
  end

end
