<?php
if ($_FILES['photo']) {
	sleep(rand(0, 2));
	if (preg_match('/(\.jpg|png|jpeg)$/i', $_FILES['photo']['name'])) {
		$status = 2;
		move_uploaded_file($_FILES['photo']['tmp_name'], 'images/test.jpg');
	} else {
		$status = 3;
	}
	sleep(rand(1, 3));
?>
<html>
<head>
<title>uploaded file</title>
	<script>
	parent.window.Upload.done('images/test.jpg', <?php echo $status; echo $status == 3 ? ', "upload file failed..."' : '' ?>);
	</script>
</head>
<body>
uploaded photo successful.
</body>
</html>
<?php
	var_dump($_FILES);
} else {
	echo "please select a photo for upload";
}
?>
