# docker_compose

To start reversed proxy do the following:

1. Switch Docker to Linux containers on Windows.
2. Copy reversed_proxy folder somewhere on Windows server.
3. Open PowerShell/cmd and change location to copied folder.
4. Run "docker build -t <image_name> ."
5. Stop iis or other apps on ports 80, 443.
   Run "docker run -d --restart=always -p 80:80 -p 443:443 --name <container_name> <image_name>".
6. Run "docker ps".
7. Run "docker exec -it <container_id> bash" to start bash on reverse proxy server.
8. Run "certbot --nginx --non-interactive --register-unsafely-without-email --agree-tos --redirect -d <domain_name>"
For example:
"certbot --nginx --non-interactive --register-unsafely-without-email --agree-tos --redirect -d simple-dms.test.sovarto.com -d api.simple-dms.test.sovarto.com"
9. Run "certbot renew --dry-run" to set up certificates auto renewal

Reverse proxy should be up and running.

Octopus changes environment variables inside .env file.
.env file is used by docker-compose.yml file.


Get-Process -Id (Get-NetTCPConnection -LocalPort 80).OwningProcess
netstat -a -b

Error starting userland proxy: Bind for 0.0.0.0:80: unexpected error Permission denied
I solved my issue on Windows 10 Pro, turned out I had the World Wide Web Publishing Service turned on somehow. Took me a while to find that, after noting via netstat -a -n that I had a :80 listener somewhere/somehow. Silly me. Shut it down, and I was fine with port 80.
https://stackoverflow.com/questions/46533482/error-starting-userland-proxy-bind-for-0-0-0-080-unexpected-error-permission

Error response from daemon: driver failed programming external connectivity on endpoint 
Error starting userland proxy: Bind for 0.0.0.0:80: unexpected error Permission denied.
https://superuser.com/questions/352017/pid4-using-port-80

Error response from daemon: driver failed programming external connectivity on endpoint 
Bind for 0.0.0.0:443 failed: port is already allocated
vpnkit
