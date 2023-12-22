exec { 'killmenow':
  command     => 'pkill -f killmenow',
  path        => '/usr/bin:/bin',
  refreshonly => true,
}

file { '/path/to/killmenow':
  ensure  => present,
  content => "#!/bin/bash\nwhile [[ true ]]; do sleep 2; done\n",
  mode    => '0755',
}
