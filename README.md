This project aims to broaden your knowledge of system administration by using Docker and Docker-compose.

Mandatory part(done):
• Docker container containing NGINX with TLSv1.2 or TLSv1.3 only.
• Docker container containing WordPress + php-fpm (it must be installed and
configured) only without nginx.
• Docker container containing only MariaDB without nginx.
• The volume containing your WordPress database.
• The second volume containing your WordPress website files.
• The Docker network, which establishes a connection between your containers.

<img width="599" alt="Screen Shot 2022-08-26 at 20 06 45" src="https://user-images.githubusercontent.com/78385823/186957963-d849603c-5667-4eb6-8a79-64679a09705c.png">


Bonus part(done):
• Set up redis cache for your WordPress website in order to properly manage the
cache.
• Set up a FTP server container pointing to the volume of your WordPress website.
• Create a simple static website in the language of your choice except PHP (Yes, PHP
is excluded!). For example, a showcase site or a site for presenting your resume.
• Set up Adminer.
• Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice. (In my "Inception" it is Portainer)
