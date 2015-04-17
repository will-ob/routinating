
# HTTPS server
#

upstream c_example_com {
	server 172.17.42.1:7777;
}

server {
	listen 80;
	server_name c.example.com;
	return 302 https://$host$request_uri;
}

server {
	listen 443 ssl spdy;
	server_name c.example.com;

	root html;
	index index.html index.htm;

	ssl on;
	ssl_certificate /etc/nginx/certs/c.example.com/server.crt;
	ssl_certificate_key /etc/nginx/certs/c.example.com/server.key;

	ssl_session_timeout 5m;

	ssl_protocols SSLv3 TLSv1;
	ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA;
	ssl_prefer_server_ciphers on;

	location / {
		proxy_pass http://c_example_com;
	}
}


