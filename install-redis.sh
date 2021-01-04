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
# 快速安装redis shell脚本
#
# author: chenkun
# date: 2019-08-30
#======================================================================

hasRedis(){
    redis-server -v
    return $?
}

hasRedis
if [ $? != 0 ]
then
    echo "Not Found redis"
    echo "Installing redis..."
    apt-get install -y redis
    if [ $? == 0 ]
    then
      echo "Install Redis successfully"
      redis-server -v
    else
      echo "Install Redis failed"
    fi
else
    echo "redis has already installed"
    redis-server -v
fi

# 设置redis开机启动
systemctl enable redis
# 在后台启动redis服务
systemctl start redis
# 测试redis-cli是否能正常连接，如果输出PONG，则连接成功
redis-cli ping

