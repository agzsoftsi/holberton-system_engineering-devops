# Create Use Puppet to run SED to change ".phpp" to ".php"
exec { 'fixer':
    command  => 'sed -i "s|class-wp-locale.phpp|class-wp-locale.php|g" /var/www/html/wp-settings.php',
    provider => shell,
}
