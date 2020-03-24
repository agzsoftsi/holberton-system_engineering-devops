# Kill an active process with pkill command:
#murder everything
exec { 'killmenow':
    command => '/usr/bin/pkill killmenow'
}
