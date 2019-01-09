# docker_compose

To start reversed proxy do the following:

1. Switch Docker to Linux containers on Windows.
2. Copy reversed_proxy folder somewhere on Windows server.
3. Open PowerShell/cmd and change location to copied folder.
4. Run "docker build -t <image_name> ."
5. Run "docker run -d -p 80:80 -p 443:443 --name <container_name> <image_name>".
6. Run "docker ps".
7. Run "docker exec -it <container_id> bash" to start bash on reverse proxy server.
8. Run "certbot --nginx --register-unsafely-without-email --agree-tos --redirect --staging -d <domain_name>"
For example:
"certbot --nginx --register-unsafely-without-email --agree-tos --redirect --staging -d simple-dms.test.sovarto.com -d api.simple-dms.test.sovarto.com"
9. Run "certbot renew --dry-run" to set up certificates auto renewal

Reverse proxy should be up and running.

Octopus changes environment variables inside .env file.
.env file is used by docker-compose.yml file.
