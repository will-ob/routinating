
Reverse Proxy
=============

For the time being, we'll use nginx as our reverse proxy. SNI is freee and easy.


```
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
docker run -d -v $DIR/reverse-proxy/sites-enabled:/etc/nginx/sites-enabled -v $DIR/reverse-proxy/certs:/etc/nginx/certs dockerfile/nginx
```


