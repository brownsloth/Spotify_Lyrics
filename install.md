brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk8

echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)' >> ~/.zshrc
source ~/.zshrc

Download hadoop binary and unzip

sudo mv /path/to/hadoop-2.10.2 /usr/local/hadoop

subl ~/.zshrc
```sh
# Hadoop environment variables
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export JAVA_HOME=$(/usr/libexec/java_home)
```
```
source ~/.zshrc
```

nano $HADOOP_HOME/etc/hadoop/hadoop-env.sh
```language
export JAVA_HOME=$(/usr/libexec/java_home)
```
nano $HADOOP_HOME/etc/hadoop/core-site.xml

nano $HADOOP_HOME/etc/hadoop/hdfs-site.xml

cp $HADOOP_HOME/etc/hadoop/mapred-site.xml.template $HADOOP_HOME/etc/hadoop/mapred-site.xml


stop-all.sh
start-dfs.sh
start-yarn.sh
hadoop fs -ls /

stop-dfs.sh
stop-yarn.sh


Logs in http://localhost:8088/cluster/apps 



