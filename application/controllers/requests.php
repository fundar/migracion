<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Requests extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//Helpers
		$this->load->helper('url');
		$this->load->helper('slug');
		$this->load->helper('date');
		
		$this->load->library('grocery_CRUD');
		
		session_start();
	}

	public function _example_output($output = null) {
		$this->load->view('example.php', $output);
	}
	
	/*Users*/
	private function isUser($redirect = true, $admin = false) {
		if(isset($_SESSION['user_id'])) {
			$user_id = $_SESSION['user_id'];
			
			$this->load->model('migracion_model');
			$user = $this->migracion_model->getUser($_SESSION['user_id']);
			
			if($user) {
				if($admin) {
					if($user->type == "admin") {
						return $user;
					} else {
						if($redirect) {
							header('Location: http://migracion.fundarlabs.mx/requests/index');
						}
						
						return false;
					}
				}
				
				return $user;
			} else {
				if($redirect) {
					header('Location: http://migracion.fundarlabs.mx/requests/login');
				}
				
				return false;
			}
		} else {
			if($redirect) {
				header('Location: http://migracion.fundarlabs.mx/requests/login');
			}
			
			return false;
		}
	}
	
	public function login() {
		if($this->isUser(false)) {
			header('Location: http://migracion.fundarlabs.mx/requests/index');
		} else {
			$vars["error"] = false;
			
			if(isset($_POST["submit"])) {
				$this->load->model('migracion_model');
				$user = $this->migracion_model->isUser(trim(str_replace("'","",$_POST["email"])), md5($_POST["pwd"]));
				
				if($user) {
					if($user->type == "admin") {
						$_SESSION['admin'] = true;
					}
					
					$_SESSION['user_id'] = $user->id_user;
					$_SESSION['email'] = $user->email;
					
					header('Location: http://migracion.fundarlabs.mx/requests/index');
				}
				
				$vars["error"] = "datos incorrectos";
			}
			
			$this->load->view('login.php', $vars);
		}
	}
	
	public function logout() {
		session_unset(); 
		session_destroy();
		
		header('Location: http://migracion.fundarlabs.mx/requests/login');
	}
	
	/*solicitudes*/
	public function index() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
			
		$crud->set_table('requests');
		$crud->set_subject('Solicitudes');
		
		$crud->columns('id', 'name', 'folio', 'id_category', 'file_url', 'id_dependecy', 'question', 'description', 'date_published' , 'date_limit', 'id_organization');
		$crud->fields('id', 'name', 'id_user', 'short_name', 'slug', 'folio', 'id_category', 'id_document', 'file_url', 'id_dependecy', 'question', 'description', 'id_keyword', 'date_published' , 'date_limit', 'date_last_modified', 'id_organization');
		$crud->order_by('date_last_modified','desc');
		   
		$crud->change_field_type('slug','invisible');
		$crud->change_field_type('id_document','invisible');
		$crud->change_field_type('id','invisible');
		$crud->change_field_type('date_last_modified','invisible');
		$crud->change_field_type('id_user','invisible');
		
		$crud->display_as('file_url', 'Documento');
		$crud->set_field_upload('file_url','assets/uploads/files');
		
		$action = $this->uri->segment(3);
		
		$crud->display_as('short_name', 'Nombre corto');
		$crud->display_as('question', 'Pregunta');
		$crud->display_as('description', 'Descripción');
		$crud->display_as('date_published', 'Fecha publicada');
		$crud->display_as('date_limit', 'Fecha límite');
		
		$crud->display_as('name', 'Título');
		$crud->display_as('description', 'Resumen');
		
		$crud->display_as('id_category', 'Categoría');
		$crud->set_relation('id_category','categories','name');
		
		$crud->display_as('id_dependecy', 'Dependencia');
		$crud->set_relation('id_dependecy', 'dependencies', 'name');
		
		$crud->display_as('id_organization', 'Organización');
		$crud->set_relation('id_organization', 'organizations', 'name');
		
		$crud->required_fields('name', 'folio', 'id_category', 'id_dependecy', 'description', 'date_published' , 'date_limit');
		
		//keywords relations
		$crud->display_as('id_keyword', 'Palabras clave');
		$crud->set_relation_n_n('id_keyword', 'keywords2requests', 'keywords', 'id_request', 'id_keyword', 'value');

		$crud->callback_before_insert(array($this, 'saveDocument'));
		$crud->callback_before_insert(array($this, 'getFolioID'));
		$crud->callback_before_update(array($this, 'updateRequest'));
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	
	/*función para guardar documento*/
	function saveDocument($post_array) {
		if(isset($post_array['id_document']) and $post_array['id_document'] != "") {
			$this->load->model('migracion_model');
			
			//Save document and keywords in database
			$id_document = $this->migracion_model->saveRequest($post_array);
			
			$post_array['id_document'] = $id_document;
		}

		$post_array['slug']     = slug($post_array['name']);
		
		return $post_array;
	}
	
	/*Find count records = folio*/
	public function getFolioID($post_array) {
		$this->load->model('migracion_model');
		$id = $this->migracion_model->getIDFolio($post_array['folio']);
		
		$post_array['folio']              = trim($post_array['folio']);
		$post_array['id']                 = $id;
		$post_array['id_user']            = $_SESSION['user_id'];
		$post_array['date_last_modified'] = date("Y-m-d H:i:s", time());
		
		return $post_array;
	}
	
	/*Update request*/
	public function updateRequest($post_array) {
		$post_array['date_last_modified'] = date("Y-m-d H:i:s", time());
		
		return $post_array;
	}
	
	
	/*metodo de documentos*/
	public function documents($id_request = false) {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('documents');
		$crud->set_subject('Documents');
		
		$crud->fields('name', 'short_name', 'keywords', 'file_url');
		$crud->change_field_type('slug','invisible');
		
		$crud->display_as('file_url', 'Document');
		$crud->set_field_upload('file_url','assets/uploads/files');

		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	/*tipos de documentos*/
	public function documents_types() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('documents_types');
		$crud->set_subject('Tipos de documentos');
		
		$crud->fields('name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	/* se quito por que no hay mucha información
	public function aditional_information() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('aditional_information');
		$crud->set_subject('Aditional information');
		
		$crud->unset_columns('slug');
		
		$crud->fields('id_request', 'date_request', 'request', 'response', 'date_response', 'date_limit');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	*/
	
	/*Respuestas*/
	public function responses() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('responses');
		$crud->set_subject('Responses');
		
		$crud->unset_columns('slug', 'process_ifai');
		
		$crud->fields('id_request', 'id_type_document', 'id_type_answer', 'answer', 'id_quality', 'information_delivery');
		
		$crud->field_type('information_delivery', 'dropdown', array(1 => 'Consulta Directa', 2 => ' Formato físico', 3 => 'Formato electrónico'));
		
		$crud->display_as('information_delivery', 'Entrega de información');
		$crud->display_as('answer', 'Respuesta');
		$crud->display_as('id_request', 'Solicitud');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('id_quality', 'Calidad');
		$crud->set_relation_n_n('id_quality', 'responses2quality', 'quality', 'id_response', 'id_quality', 'name');
		
		$crud->display_as('id_type_document', 'Tipo de documento');
		$crud->set_relation_n_n('id_type_document', 'responses2documentstypes', 'documents_types', 'id_response', 'id_type_document', 'name');
		 
		//$crud->set_relation('id_type_document','documents_types','name');
		
		$crud->display_as('id_type_answer', 'Tipo de Respuesta');
		$crud->set_relation('id_type_answer','answers_types','name');
		
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function cumplimiento() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('cumplimiento');
		$crud->set_subject('Cumplimiento');
		
		$crud->fields('id_request', 'status', 'date', 'description');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('status', 'Se Cumplio');
		$crud->field_type('status', 'dropdown', array(1 => 'Yes', 2 => 'No'));

		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function resolutions() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('resolutions');
		$crud->set_subject('Resolutions');
		
		$crud->columns('id_request', 'date_notification', 'date', 'resource_number', 'id_type_resolution', 'file_url');
		$crud->fields('id_request', 'date_notification', 'date', 'resource_number', 'id_type_resolution', 'id_document', 'file_url');
		
		$crud->change_field_type('id_document','invisible');
		
		$crud->display_as('file_url', 'Document');
		$crud->set_field_upload('file_url','assets/uploads/files');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('id_type_resolution', 'Sentido de la resolución');
		$crud->set_relation('id_type_resolution','resolutions_type', 'name');
		
		$crud->callback_before_insert(array($this, 'saveResolution'));
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	function saveResolution($post_array) {
		if(isset($post_array['id_document']) and $post_array['id_document'] != "") {
			$this->load->model('migracion_model');
			
			//Save document and keywords in database
			$id_document = $this->migracion_model->saveDocument($post_array);
			
			$post_array['id_document'] = $id_document;
		}
		
		return $post_array;
	}
	
	/* se quito por que no hay mucha información
	public function allegations() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('allegations');
		$crud->set_subject('Allegations');
		
		$crud->fields('id_request', 'allegation', 'description', 'date');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('description', '¿A qué ponencia fue enviada?');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	*/
	
	public function reviews() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('reviews');
		$crud->set_subject('Reviews');
		
		$crud->fields('id_request', 'date', 'date_limit', 'id_act');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('id_act', 'Acto que se recurrió');
		$crud->set_relation_n_n('id_act', 'acts2reviews', 'turn_acts', 'id_review', 'id_act', 'name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function keywords() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('keywords');
		$crud->set_subject('keywords');

		$crud->fields('value');
		$crud->display_as('value', 'Name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function acts() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('turn_acts');
		$crud->set_subject('Acto que se recurre');

		$crud->fields('name');
		$crud->display_as('name', 'Acto que se recurre');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function quality() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('quality');
		$crud->set_subject('Quality');

		$crud->fields('name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function categories() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('categories');
		$crud->set_subject('Categories');
		
		$crud->unset_columns('slug');
		$crud->fields('name', 'slug', 'description');
		$crud->change_field_type('slug','invisible');
		
		$crud->callback_before_insert(function($post_array) {
			$post_array['slug'] = slug($post_array['name']);
			
			return $post_array;
		});
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function dependencies() {
		$user = $this->isUser();
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('dependencies');
		$crud->set_subject('Dependencies');
		
		$crud->unset_columns('slug');
		$crud->fields('name', 'slug', 'description', 'short_name', 'address', 'type');
		$crud->change_field_type('slug','invisible');
		$crud->field_type('type', 'dropdown', array('federal' => 'Federal', 'estatal' => 'Estatal', 'municipal' => 'Municipal'));
		
		$crud->callback_before_insert(function($post_array) {
			$post_array['slug'] = slug($post_array['name']);
			
			return $post_array;
		});
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	
	public function organizations() {
		if($this->isUser(true, true)) {
			$admin = true;
		}
		
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('organizations');
		$crud->set_subject('Organizations');
		
		$crud->unset_columns('slug');
		$crud->fields('name', 'slug', 'short_name', 'description', 'address', 'email', 'telephone', 'website');
		$crud->change_field_type('slug','invisible');
		
		$crud->callback_before_insert(function($post_array) {
			$post_array['slug'] = slug($post_array['name']);
			
			return $post_array;
		});
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function areas() {
		if($this->isUser(true, true)) {
			$admin = true;
		}
		
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('areas');
		$crud->set_subject('Areas');
		
			
		$crud->display_as('id_organization', 'Organization');
		$crud->set_relation('id_organization','organizations','name');
		
		$crud->unset_columns('slug');
		$crud->fields('name', 'id_organization', 'slug', 'short_name', 'description');
		$crud->change_field_type('slug','invisible');
		
		
		$crud->callback_before_insert(function($post_array) {
			$post_array['slug'] = slug($post_array['name']);
			
			return $post_array;
		});
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function users() {		
		if($this->isUser(true, true)) {
			$admin = true;
		}
		
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('users');
		$crud->set_subject('users');
		
		$crud->fields('username', 'pwd', 'email', 'name', 'lastname', 'id_organization', 'id_area', 'type', 'date_create');
		
		$crud->unset_columns('slug');
		
		$crud->display_as('id_organization', 'Organization');
		$crud->set_relation('id_organization','organizations','name');
		
		$crud->display_as('id_area', 'Area');
		$crud->set_relation('id_area','areas','name');
		
		$crud->display_as('pwd', 'Password');
		
		$crud->field_type('type', 'dropdown', array('normal' => 'Normal', 'admin' => 'Admin', 'root' => 'Root'));
		$crud->change_field_type('date_create','invisible');
		$crud->change_field_type('email','email');
		$crud->change_field_type('pwd','password');

		$crud->callback_before_insert(function($post_array) {
			///Password
			$key = 'super-secret-key';
			
			if(!empty($post_array['pwd'])) {
				$post_array['pwd'] = md5($post_array['pwd']);
			} else {
				$post_array['pwd'] = md5($key);
			}
			
			//date
			$post_array['date_create'] = now();
			
			return $post_array;
		});

		  
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	/*
	public function test() {
		$this->load->model('migracion_model');
			
		//insert keywords - relation
		$id_document = $this->migracion_model->keywords();
	}
	*/
}
