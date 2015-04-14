# nginx-loadbalancer

```
docker run -ti -e CONFD_PREFIX=/lb lb
```

Backend should follow this rules in order to provide to nginx all required information:

```
/lb
  /hosts
    /lisa.contoso.com
      /listeners
        /ls1 '{ "Protocol":"http", "Address": "0.0.0.0:80" }'
      /locations
        /loc1
          /path '/api/.*'
          /upstream 'up1'
        /loc2
          /options
          /path '/.*'
          /upstream 'up2'
  /upstreams
    /up1
      /options
      /endpoints
        /e1 '10.10.10.10:8085'
        /e2 '10.10.10.11:8085'
    /up2
      /options
      /endpoints
        /e1 '10.10.10.10:8086'
        /e2 '10.10.10.11:8086'
```