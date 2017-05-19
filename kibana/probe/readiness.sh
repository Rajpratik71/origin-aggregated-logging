#!/bin/bash
#
# Copyright 2017 Red Hat, Inc. and/or its affiliates
# and other contributors as indicated by the @author tags.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

KIBANA_REST_BASEURL=http://localhost:5601
EXPECTED_RESPONSE_CODE=200
max_time="${max_time:-4}"

response_code="$(
    curl --silent                          \
         --request HEAD                    \
         --max-time "${max_time}"          \
         --write-out '%{response_code}'    \
         "${KIBANA_REST_BASEURL}/"
)"

if [ "${response_code}" == "${EXPECTED_RESPONSE_CODE}" ]; then
    exit 0
else
    echo "Kibana node is not ready to accept HTTP requests yet [response code: ${response_code}]"
    exit 1
fi
