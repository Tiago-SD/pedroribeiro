exec { "yum update":
	command => "/usr/bin/yum update",
}

package { "httpd":
	require => Exec["yum update"],
}

file { "/etc/httpd/conf.d/000-hosts.conf":
	ensure => link,
	target => "../files/000-hosts.conf",
	force => true,
}
