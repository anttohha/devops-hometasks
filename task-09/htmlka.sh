docker run -d -p 8081:80 --name htmlka hometask-image
docker cp index.html htmlka:/var/www/html/
docker exec htmlka rm -rf /var/www/html/index.php
