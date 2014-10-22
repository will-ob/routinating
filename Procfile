consul: /opt/consul/consul agent -server -bootstrap-expect 1 -data-dir /opt/consul/data -ui-dir /opt/consul/dist
haproxy: haproxy -f /etc/haproxy/haproxy.cfg
consul-template: sudo ./bin/consul-template -consul 127.0.0.1:8500 -template "./haproxy.ctmpl:/etc/haproxy/haproxy.conf:service haproxy reload"
registrator: sudo docker run --net="host"   -v /var/run/docker.sock:/tmp/docker.sock  progrium/registrator consul://127.0.0.1:8500
