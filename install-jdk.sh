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
# 快速安装JDK
# CentOS7 中已成功验证
# 使用yum方式安装
#
# author: sy
# date: 2019-8-29
#======================================================================
hasJdk(){
	java -version &> /dev/null
	return $?
}

jdk=openjdk-8-jdk
#dpkg -s $jdk &> /dev/null
java -version &> /dev/null
if [ $? != 0 ]
then
    echo "Not Found jdk"
    echo "Installing jdk..."
    apt-get install -y $jdk
    if [ $? == 0 ]
    then
	echo "successfully install jdk"
	java -version
    else
	echo "install jdk failed"
    fi
else
    echo "Jdk has installed"
    java -version
fi




