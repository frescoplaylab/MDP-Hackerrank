#hackerrank run->install can use this script
if [ `id -u` -ne 0 ]; then
    echo "You need root privileges to run this script(try sudo)"
    exit 1
fi
echo "\n" | ssh-keygen -q -t rsa -P "" -f /root/.ssh/id_rsa
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
service ssh restart

echo "yes" | /opt/mdp/hadoop-2.7.6/bin/hdfs namenode -format
echo "yes\n" | /opt/mdp/hadoop-2.7.6/sbin/start-dfs.sh
echo "yes\n" | /opt/mdp/hadoop-2.7.6/sbin/start-yarn.sh


service cassandra start