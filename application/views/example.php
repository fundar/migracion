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
	<div>
		<!--
		<a href='<?php echo site_url('examples/customers_management')?>'>Customers</a> |
		<a href='<?php echo site_url('examples/orders_management')?>'>Orders</a> |
		<a href='<?php echo site_url('examples/products_management')?>'>Products</a> |
		<a href='<?php echo site_url('examples/offices_management')?>'>Offices</a> | 
		<a href='<?php echo site_url('examples/employees_management')?>'>Employees</a> |		 
		<a href='<?php echo site_url('examples/film_management')?>'>Films</a> | 
		<a href='<?php echo site_url('examples/film_management_twitter_bootstrap')?>'>Twitter Bootstrap Theme [BETA]</a> | 
		<a href='<?php echo site_url('examples/multigrids')?>'>Multigrid [BETA]</a>
		-->
		
		<a href='<?php echo site_url('requests/index')?>'>Solicitudes</a> |
		<a href='<?php echo site_url('requests/aditional_information')?>'>Informaci&oacute;n Adicional</a> |
		<a href='<?php echo site_url('requests/responses')?>'>Respuestas</a> |
		<a href='<?php echo site_url('requests/reviews')?>'>Recursos de revisión</a> |
		<a href='<?php echo site_url('requests/allegations')?>'>Alegatos</a> |
		<a href='<?php echo site_url('requests/resolutions')?>'>Resoluciones</a> |
		<a href='<?php echo site_url('requests/cumplimiento')?>'>Cumplimiento</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<a href='<?php echo site_url('requests/keywords')?>'>Keywords</a> |
		<a href='<?php echo site_url('requests/quality')?>'>Calidad de respuestas</a> |
		<a href='<?php echo site_url('requests/acts')?>'>Actos que se recurren</a> |
		<!-- <a href='<?php echo site_url('requests/documents')?>'>Documentos</a> | -->
		<a href='<?php echo site_url('requests/categories')?>'>Categor&iacute;as</a> |
		<a href='<?php echo site_url('requests/dependencies')?>'>Dependencias</a> |
		<a href='<?php echo site_url('requests/organizations')?>'>Organizaciones</a>
		<!-- <a href='<?php echo site_url('requests/areas')?>'>Areas</a> | -->
		<!-- <a href='<?php echo site_url('requests/users')?>'>Users</a> | -->
		
		<?php if(isset($_SESSION['admin'])) { ?>
			| <a href='<?php echo site_url('requests/users')?>'>Users</a>
		<?php } ?>
		
		<?php if(isset($_SESSION['user_id'])) { ?>
			| <a href='<?php echo site_url('requests/logout')?>'>Logout</a>
		<?php } ?>
	</div>
	<div style='height:20px;'></div>  
    <div>
		<?php echo $output; ?>
    </div>
</body>
</html>
