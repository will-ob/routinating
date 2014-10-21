consul: /opt/consul/consul agent -server -bootstrap-expect 1 -data-dir /opt/consul/data -ui-dir /opt/consul/dist
haproxy: haproxy -f /etc/haproxy/haproxy.cfg
consul-haproxy: sudo bin/consul-haproxy -f /home/will/haproxy-conf/config.json
registrator: sudo docker run --net="host"   -v /var/run/docker.sock:/tmp/docker.sock  progrium/registrator consul://127.0.0.1:8500
