<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Migración y transparencia - Login</title>
	<meta name="keywords" content="Migración, transparencia" />
    <meta name="description" content="Migración y transparencia" />
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
		<?php die(var_dump($error)); ?>
		<form action="" method="POST">
			<p>email: <input type="text" name="email" id="email" /></p>
			<p>password: <input type="password" name="pwd" id="pwd" /></p>
			<p>
				<input type="submit" name="submit" value="enviar" />
			</p>
		</form>
    </div>
</body>
</html>
