#!/usr/local/php_fastcgi/bin/php
<?php
/*
Last_Error:
stop slave; SET GLOBAL SQL_SLAVE_SKIP_COUNTER =1; start slave;
show slave status;
*/
$dbh = mysql_connect('localhost', 'root', '');
$r = mysql_query('SHOW SLAVE STATUS', $dbh);
while ($t = mysql_fetch_assoc($r)) {
    if ($t['Last_Errno'] != 0) {
        //echo $t['Last_Error'] . "\n";
        mysql_query('STOP SLAVE', $dbh);
        mysql_query('SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1', $dbh);
        mysql_query('START SLAVE', $dbh);
        $r = mysql_query('SHOW SLAVE STATUS', $dbh);
    }
}
mysql_close($dbh);
?>
