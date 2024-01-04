# Configure a Nginx server with puppet

exec { 'nginx install':
path    => '/usr/bin',
command => 'sudo apt update && sudo apt-get -y install nginx',
}

# exec { 'Make file':
# path    => '/usr/bin',
# command => 'echo "Hello World!" > /var/www/html/index.html'
# }

file { '/var/www/html/index.html':
mode    => '0755',
content => 'Hello World!',
}

exec { 'block server':
path    => '/usr/bin',
command => 'echo "
server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
 
        location /redirect_me {
                return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
}" | sudo tee /etc/nginx/sites-available/default'
}

exec { 'Restart nginx':
path    => '/usr/bin',
command => 'sudo service nginx restart',
}
