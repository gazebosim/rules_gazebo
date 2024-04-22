# Copyright (C) 2024 Open Source Robotics Foundation
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
"""Core rules for building Gazebo libraries"""

load(
    "//gz/private:gz_configure_file.bzl",
    _gz_configure_header = "gz_configure_file",
)
load(
    "//gz/private:gz_export_header.bzl",
    _gz_export_header = "gz_export_header",
)

gz_configure_header = _gz_configure_header
gz_configure_file = _gz_configure_header
gz_export_header = _gz_export_header
