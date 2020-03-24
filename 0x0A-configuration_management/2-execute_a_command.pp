# Kill an active process with pkill command:
    exec {'Kill process':
      command => 'pkill -f ./killmenow',
      path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
    }
