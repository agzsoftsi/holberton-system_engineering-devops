# Configure SSH client to use private key ~/.ssh/holberton and refuse to authenticate using a password
include stdlib

file_line { 'Use private key':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/holberton',
}

file_line { 'Refuse password':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}
