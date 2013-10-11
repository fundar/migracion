<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
<?php 
foreach($css_files as $file): ?>
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
		
		<a href='<?php echo site_url('requests/index')?>'>Requests</a> |
		<a href='<?php echo site_url('requests/aditional_information')?>'>Aditional information</a> |
		<a href='<?php echo site_url('requests/responses')?>'>Responses</a> |
		<a href='<?php echo site_url('requests/reviews')?>'>Reviews</a> |
		<a href='<?php echo site_url('requests/allegations')?>'>Allegations</a> |
		<a href='<?php echo site_url('requests/resolutions')?>'>Resolutions</a> |
		<a href='<?php echo site_url('requests/cumplimiento')?>'>Cumplimiento</a> |
		
		
		<a href='<?php echo site_url('requests/keywords')?>'>Keywords</a> |
		<a href='<?php echo site_url('requests/documents')?>'>Documents</a> |
		<a href='<?php echo site_url('requests/categories')?>'>Categories</a> |
		<a href='<?php echo site_url('requests/dependencies')?>'>Dependencies</a> |
		<!-- <a href='<?php echo site_url('requests/organizations')?>'>Organizations</a> | -->
		<!-- <a href='<?php echo site_url('requests/areas')?>'>Areas</a> | -->
		<!-- <a href='<?php echo site_url('requests/users')?>'>Users</a> | -->
	</div>
	<div style='height:20px;'></div>  
    <div>
		<?php echo $output; ?>
    </div>
</body>
</html>
