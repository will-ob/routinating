consul: ./bin/consul agent -server -bootstrap-expect 1 -data-dir ./build/consul/data -ui-dir ./assets/dist
haproxy: $(rm -f ./pids/haproxy.pid && sudo haproxy -d -f ./build/haproxy.cfg -p ./pids/haproxy.pid)
consul-template: $(sleep 10 &&  sudo ./bin/consul-template -consul 127.0.0.1:8500 -template "./haproxy.ctmpl:./build/haproxy.cfg:./scripts/haproxy-reload")
registrator: $(sleep 10 && sudo docker run --net="host"   -v /var/run/docker.sock:/tmp/docker.sock  progrium/registrator consul://127.0.0.1:8500)
