- [nginx-loadbalancer](#nginx-loadbalancer)

# nginx-loadbalancer

```
docker run -ti -e CONFD_PREFIX=/lb lb
```

Backend should follow this rules in order to provide to nginx all required information:

```
/lb
  /settings '{
    "workerProcesses": "auto",
    "workerConnections": "1024"
  }'
  /settings
  /hosts
    /lisa.contoso.com
      /listeners
        /ls1 '{ "protocol": "http", "address": "0.0.0.0:80" }'
      /locations
        /loc2 '{ "path": "/api/.*", "upstreamId": "up1" }'
        /loc2 '{ "path": "/.*", "upstreamId": "up2" }'
  /upstreams
    /up1
      /endpoints
        /e1 '{ "url": "10.10.10.10:8085" }'
        /e2 '{ "url": "10.10.10.11:8085" }'
    /up2
      /endpoints
        /e1 '{ "url": "10.10.10.10:8086" }'
        /e2 '{ "url": "10.10.10.11:8086" }'
```
