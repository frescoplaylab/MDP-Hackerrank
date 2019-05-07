sudo sudo PATH=$PATH
bash -c  'echo "\n" | ssh-keygen -q -t rsa -P "" -f /root/.ssh/id_rsa'
bash -c "cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys"
chmod 600 /root/.ssh/authorized_keys
service ssh restart
/opt/mdp/hadoop-2.7.6/bin/hadoop dfs -mkdir -p /user/hive/warehouse
/opt/mdp/hadoop-2.7.6/bin/hadoop dfs -mkdir /tmp
/opt/mdp/hadoop-2.7.6/bin/hadoop dfs -chmod g+w /user/hive/warehouse
/opt/mdp/hadoop-2.7.6/bin/hadoop dfs -chmod g+w /tmp
