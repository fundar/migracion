<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Migración y transparencia - Login</title>
	<meta name="keywords" content="Migración, transparencia" />
    <meta name="description" content="Migración y transparencia" />
	<?php foreach($css_files as $file): ?>
		<link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
	<?php endforeach; ?>
	<?php foreach($js_files as $file): ?>
		<script src="<?php echo $file; ?>"></script>
	<?php endforeach; ?>
<style type='text/css'>
body
{
	font-family: Arial;
	font-size: 14px;
}
a {
    color: blue;
    text-decoration: none;
    font-size: 14px;
}
a:hover
{
	text-decoration: underline;
}
</style>
</head>
<body>
    <div>
		<form action="" method="">
			<p>email: <input type="text" name="email" id="email" /></p>
			<p>password: <input type="text" name="pwd" id="pwd" /></p>
			<p>
				<input type="submit" name="email" value="enviar" />
			</p>
		</form>
    </div>
</body>
</html>
