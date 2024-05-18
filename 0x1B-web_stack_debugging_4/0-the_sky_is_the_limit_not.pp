# Install Nginx package (if not already installed)
package { 'nginx':
  ensure  => installed,
}

# Configure Nginx upstream server
file { '/etc/nginx/conf.d/upstream.conf':
  ensure  => present,
  content => '
    upstream my_upstream {
      server 127.0.0.1:8080; # Adjust the IP and port as needed
    }
  ',
}

# Configure Nginx site without the invalid rate limiting directive
file { '/etc/nginx/sites-available/mywebsite':
  ensure  => present,
  content => '
    server {
      listen 80;
      server_name mywebsite.com;

      location / {
        proxy_pass http://my_upstream;
        # Remove rate limiting directive
      }
    }
  ',
}

# Create symbolic link to enable the site
file { '/etc/nginx/sites-enabled/mywebsite':
  ensure  => link,
  target  => '/etc/nginx/sites-available/mywebsite',
}

# Validate Nginx configuration
exec { 'nginx-config-test':
  command => 'nginx -t',
  path    => '/usr/sbin',
  onlyif  => '/usr/bin/test -f /etc/nginx/sites-available/mywebsite',
}

# Restart Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [File['/etc/nginx/sites-enabled/mywebsite'], File['/etc/nginx/conf.d/upstream.conf']],
}

