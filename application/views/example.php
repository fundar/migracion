<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Migración y transparencia</title>
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
	<div id="container">
		<?php $this->load->view('menu.php', $output); ?>
		<div style='height:20px;'></div>  
		<div>
			<?php echo $output; ?>
		</div>
    </div>
</body>
</html>
