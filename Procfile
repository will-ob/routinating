consul: ./bin/consul agent -server -bootstrap-expect 1 -data-dir ./build/consul/data -ui-dir ./assets/consul/dist
haproxy: sudo haproxy -d -f ./build/haproxy.cfg -p ./pids/haproxy.pid
consul-template: sudo ./bin/consul-template -consul 127.0.0.1:8500 -template "./haproxy.ctmpl:./build/haproxy.conf:haproxy -f ./build/haproxy.cfg -p ./pids/haproxy.pid -sf $(cat ./pids/haproxy.pid)"
registrator: sudo docker run --net="host"   -v /var/run/docker.sock:/tmp/docker.sock  progrium/registrator consul://127.0.0.1:8500
