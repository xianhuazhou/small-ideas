<?php
  $memcache = new Memcache;
  $memcache->connect('localhost', 11211);

  $version = $memcache->getVersion();
  echo "Server's version: ".$version."\n";
  print_r($memcache->getStats());
?>
