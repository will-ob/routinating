
<p align="center">
  <img width="320px" height="320px" src="https://raw.githubusercontent.com/will-ob/routinating/master/crossroads.jpg" />
</p>
<p align="center">Image creds to <a href="http://dcinfinite.com/">DC Infinite</a> via <a href="http://clxrrr.com/2014/05/02/mapping-the-streets/">CLXRRR</a></p>

Routinating
===============

An unreasonably complicated way to get my http's to where where they need to go.

Overview
------------

HTTP traffic accepted on port 80. Traffic distributed to appropriate backend docker containers.
Containers are auto-discovered as they spin up and removed from rotation when they are spun down.

### Constituents

 - [h.a. proxy](http://www.haproxy.org/) - Reverse proxy that gathers requests from port 80.
 - [consul](http://www.consul.io/) - Maintains a directory of services.
 - [registrator](https://github.com/progrium/registrator) - Detects container life-cycle events and updates the consul registry.
 - [consul-template](https://github.com/hashicorp/consul-template) - Detects changes in consul's directory of services and reconfigures haproxy.

Install
-----------------

```
make install
```

Run
------------------

```
make run
```

