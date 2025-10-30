<?php
/* Servers configuration */
$i = 0;

/* Server: MariaDB */
$i++;
$cfg['Servers'][$i]['host'] = 'mariadb';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'PMA-PASSWORD';
$cfg['Servers'][$i]['auth_type'] = 'cookie'; 
$cfg['Servers'][$i]['hide_db'] = '^(information_schema|performance_schema|mysql)$';

/* End of servers configuration */
$cfg['Servers'][$i]['hide_db'] = '^(information_schema)$';
$cfg['Servers'][$i]['hide_db'] = '^(performance_schema|mysql)$';