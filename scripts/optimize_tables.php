<?php
require_once 'config.inc.php';
$conn = mysql_connect($server, $user, $pass);
mysql_select_db($db_name, $conn);
$res = mysql_query("SHOW TABLES");
while($row = mysql_fetch_array($res)) {
  echo "Optimizing table: " . $row[0] . "\n";
  mysql_query("OPTIMIZE TABLE `" . $row[0] . "`");
}
mysql_close($conn);
?>
