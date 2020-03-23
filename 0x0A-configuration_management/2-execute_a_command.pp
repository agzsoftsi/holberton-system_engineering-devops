# Task2 - Using Puppet, create a manifest that kills a process named killmenow.
exec { 'Killprocess':
  command => 'pkill killmenow',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
}
