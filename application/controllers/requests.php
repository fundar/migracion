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
	}

	public function _example_output($output = null) {
		$this->load->view('example.php',$output);
	}
	
	public function index() {
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
			
		$crud->set_table('requests');
		$crud->set_subject('Requests');
		
		$crud->columns('name', 'short_name', 'folio', 'id_category', 'id_document', 'id_dependecy', 'question', 'description', 'date_published' , 'date_limit');
		$crud->fields('name', 'short_name', 'slug', 'folio', 'id_category', 'id_document', 'id_dependecy', 'question', 'description', 'keywords', 'date_published' , 'date_limit');
		
		$crud->change_field_type('slug','invisible');
		
		$crud->display_as('id_document', 'Document');
		$crud->set_field_upload('id_document','assets/uploads/files');
		
		$action = $this->uri->segment(3);
		
		if($action == "add" or $action == "edit") {
			
		} else {
			$crud->set_relation('id_document', 'documents', 'file_url');
		}
		
		$crud->display_as('description', 'Summary');
		
		$crud->display_as('id_category', 'Category');
		$crud->set_relation('id_category','categories','name');
		
		$crud->display_as('id_dependecy', 'Dependecy');
		$crud->set_relation('id_dependecy', 'dependencies', 'name');
		
		$crud->required_fields('name', 'id_category', 'id_dependecy', 'description', 'date_published' , 'date_limit');
			
		// multiple keywords
		$this->load->model('migracion_model');
		$keywords = $this->migracion_model->get_keywords();
		
		foreach($keywords->result() as $row) {
			$myarray[$row->id_keyword] = $row->value;
		}
		
		$crud->field_type('keywords',  'multiselect', $myarray);
		
		$crud->callback_before_insert(array($this, 'saveDocument'));
		$crud->callback_after_insert(array($this, 'saveKeywordsRequest'));
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	function showUrlDocument($value, $row) {
		$this->load->model('migracion_model');
		$file_url = $this->migracion_model->getUrlDocument($row->id_document);
		
		if($file_url) {
		 return site_url('demo/action/action_photos').'?country='.$file_url;
			return "<a href='".site_url('assets/uploads/files/' . $file_url)."'>$file_url</a>";
		}  else {
			return "No data";
		}
	}
	
	function saveKeywordsRequest($post_array, $primary_key) {
		//Save keywords request		
		$this->load->model('migracion_model');
		$this->migracion_model->saveKeywordsRequest($_POST["keywords"], $primary_key);
			 
		return true;
	}

	function saveDocument($post_array) {
		if(isset($post_array['id_document']) and $post_array['id_document'] != "") {
			$this->load->model('migracion_model');
			
			//Save document and keywords in database
			$id_document = $this->migracion_model->saveRequest($post_array);
			
			$post_array['id_document'] = $id_document;
		}
		
		unset($post_array['keywords']);

		$post_array['slug']     = slug($post_array['name']);
		$post_array['keywords'] = "";
		
		return $post_array;
	}
	
	public function documents($id_request = false) {
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
	
	public function aditional_information() {
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
	
	
	public function responses() {
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('responses');
		$crud->set_subject('Responses');
		
		$crud->unset_columns('slug');
		
		$crud->fields('id_request', 'id_type_document', 'id_type_answer', 'answer', 'id_quality', 'information_delivery', 'process_ifai');
		
		$crud->field_type('information_delivery', 'dropdown', array(1 => 'Consulta Directa', 2 => ' Formato físico', 3 => 'Formato electrónico'));
		
		$crud->display_as('process_ifai', 'Con proceso ante IFAI u órgano garante');
		$crud->field_type('process_ifai', 'dropdown', array(1 => 'Proceso', 2 => 'Concluido'));
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('id_quality', 'Quality');
		$crud->set_relation('id_quality','quality','name');
		
		$crud->display_as('id_type_document', 'Type Document');
		$crud->set_relation_n_n('id_type_document', 'responses2documentstypes', 'documents_types', 'id_response', 'id_type_document', 'name');
		 
		//$crud->set_relation('id_type_document','documents_types','name');
		
		$crud->display_as('id_type_answer', 'Type Answer');
		$crud->set_relation('id_type_answer','answers_types','name');
		
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function cumplimiento() {
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
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('resolutions');
		$crud->set_subject('Resolutions');
		
		$crud->fields('id_request', 'date_notification', 'date', 'resource', 'resource_number', 'id_type_resolution');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('id_type_resolution', 'Sentido de la resolución');
		$crud->set_relation('id_type_resolution','resolutions_type', 'name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function allegations() {
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
	
	
	public function reviews() {
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('reviews');
		$crud->set_subject('Reviews');
		
		$crud->fields('id_request', 'date', 'date_limit', 'description');
		
		$crud->display_as('id_request', 'Request');
		$crud->set_relation('id_request','requests','name');
		
		$crud->display_as('description', 'Acto que se recurrió');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function keywords() {
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('keywords');
		$crud->set_subject('keywords');

		$crud->fields('value');
		$crud->display_as('value', 'Name');
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function categories() {
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('keywords');
		$crud->set_subject('Keywords');
		
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
		$crud = new grocery_CRUD();
		
		$crud->set_theme('twitter-bootstrap');
		
		$crud->set_table('organizations');
		$crud->set_subject('Organizations');
		
		$crud->unset_columns('slug');
		$crud->fields('name', 'slug', 'short_name', 'description', 'address');
		$crud->change_field_type('slug','invisible');
		
		$crud->callback_before_insert(function($post_array) {
			$post_array['slug'] = slug($post_array['name']);
			
			return $post_array;
		});
		
		$output = $crud->render();

		$this->_example_output($output);
	}
	
	public function areas() {
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
}
