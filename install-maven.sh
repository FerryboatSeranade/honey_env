#! /bin/shell

# Copyright 2019-2029 geekidea(https://github.com/geekidea)
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

#======================================================================
# 快速安装maven shell脚本
#
# author: chenkun
# date: 2019-08-30
#======================================================================

hasMaven(){
    mvn -version &> /dev/null
    return $?;
}

hasMaven
if [ $? != 0 ]
then
    echo "Not Found maven"
    echo "Installing maven..."

    apt-get install -y maven
    hasMaven
    if [ $? == 0 ]
    then
      echo "install maven successfully"
      mvn -version
      echo "Config Aliyun Maven Mirror..."
      # 下载 maven aliyun mirror settings.xml
      wget -O settings.xml https://springboot.plus/config/settings.xml
      rm -rf /etc/maven/settings.xml
      cp settings.xml /etc/maven/
    else
      echo "Install maven Failed"
    fi
else
    echo "Maven has already installed"
    mvn -version
fi

