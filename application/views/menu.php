<div>
	<a href="<?php echo site_url('requests/index')?>">
		<?php if($this->uri->segment(2) == "index") { ?><strong>Solicitudes</strong><?php } else { ?>Solicitudes<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/responses')?>">
		<?php if($this->uri->segment(2) == "responses") { ?><strong>Respuestas</strong><?php } else { ?>Respuestas<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/reviews')?>">
		<?php if($this->uri->segment(2) == "reviews") { ?><strong>Recursos de revisión</strong><?php } else { ?>Recursos de revisión<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/resolutions')?>">
		<?php if($this->uri->segment(2) == "resolutions") { ?><strong>Resoluciones</strong><?php } else { ?>Resoluciones<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/cumplimiento')?>">
		<?php if($this->uri->segment(2) == "cumplimiento") { ?><strong>Cumplimiento</strong><?php } else { ?>Cumplimiento<?php } ?>
	</a> |
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="<?php echo site_url('requests/keywords')?>">
		<?php if($this->uri->segment(2) == "keywords") { ?><strong>Palabras clave</strong><?php } else { ?>Palabras clave<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/quality')?>">
		<?php if($this->uri->segment(2) == "quality") { ?><strong>Calidad de respuestas</strong><?php } else { ?>Calidad de respuestas<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/acts')?>">
		<?php if($this->uri->segment(2) == "acts") { ?><strong>Actos que se recurren</strong><?php } else { ?>Actos que se recurren<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/documents_types')?>">
		<?php if($this->uri->segment(2) == "documents_types") { ?><strong>Tipos de documentos</strong><?php } else { ?>Tipos de documentos<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/categories')?>">
		<?php if($this->uri->segment(2) == "categories") { ?><strong>Categor&iacute;as</strong><?php } else { ?>Categor&iacute;as<?php } ?>
	</a> |
	<a href="<?php echo site_url('requests/dependencies')?>">
		<?php if($this->uri->segment(2) == "dependencies") { ?><strong>Dependencias</strong><?php } else { ?>Dependencias<?php } ?>
	</a> |
		
	<?php if(isset($_SESSION['admin'])) { ?>
		<a href="<?php echo site_url('requests/organizations')?>">
			<?php if($this->uri->segment(2) == "organizations") { ?><strong>Organizaciones</strong><?php } else { ?>Organizaciones<?php } ?>
		</a> |
	<?php } ?>
	
	<?php if(isset($_SESSION['admin'])) { ?>
		<a href="<?php echo site_url('requests/areas')?>">
			<?php if($this->uri->segment(2) == "areas") { ?><strong>Areas</strong><?php } else { ?>Areas<?php } ?>
		</a> |
	<?php } ?>
	
	<?php if(isset($_SESSION['admin'])) { ?>
		<a href="<?php echo site_url('requests/users')?>">
			<?php if($this->uri->segment(2) == "users") { ?><strong>Usuarios</strong><?php } else { ?>Usuarios<?php } ?>
		</a>
	<?php } ?>
	
	<?php if(isset($_SESSION['user_id'])) { ?>
		| <a href='<?php echo site_url('requests/logout')?>'>Cerrar sesión</a>
	<?php } ?>
</div>
