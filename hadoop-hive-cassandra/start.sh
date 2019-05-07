if [ `id -u` -ne 0 ]; then
    echo "You need root privileges to run this script(try sudo)"
    exit 1
fi

bash -c  'echo "\n" | ssh-keygen -q -t rsa -P "" -f /root/.ssh/id_rsa'
bash -c "cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys"
chmod 600 /root/.ssh/authorized_keys
service ssh restart

hdfs namenode -format
start-all.sh
/opt/mdp/hadoop-2.7.6/bin/hdfs dfs -mkdir -p /user/hive/warehouse
/opt/mdp/hadoop-2.7.6/bin/hdfs dfs -mkdir /tmp
/opt/mdp/hadoop-2.7.6/bin/hdfs dfs -chmod g+w /user/hive/warehouse
/opt/mdp/hadoop-2.7.6/bin/hdfs dfs -chmod g+w /tmp
