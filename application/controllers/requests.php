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
		
		$crud->fields('name', 'short_name', 'slug', 'folio', 'id_category', 'id_document', 'id_dependecy', 'description', 'keywords', 'date_published' , 'date_limit');
		
		$crud->change_field_type('slug','invisible');

		$crud->display_as('id_document', 'Document');
		$crud->set_field_upload('id_document','assets/uploads/files');
		
		$crud->display_as('id_category', 'Category');
		$crud->set_relation('id_category','categories','name');
		
		$crud->display_as('id_dependecy', 'Dependecy');
		$crud->set_relation('id_dependecy', 'dependencies', 'name');
		
		$crud->required_fields('name', 'id_category', 'id_dependecy', 'description', 'date_published' , 'date_limit', 'keywords');
			
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
	
	function saveKeywordsRequest($post_array, $primary_key) {
		//Save keywords request
		
		die(var_dump($post_array));
		
		$this->load->model('migracion_model');
		$this->migracion_model->saveKeywordsRequest($post_array, $primary_key);
			 
		return true;
	}

	function saveDocument($post_array) {
		if(isset($post_array['id_document']) and $post_array['id_document'] != "") {
			$this->load->model('migracion_model');
			
			//Save document and keywords in database
			$id_document = $this->migracion_model->saveRequest($post_array);
			
			$post_array['id_document'] = $id_document;
		}
		
		$post_array['slug']     = slug($post_array['name']);
		$post_array['keywords'] = "";
		
		return $post_array;
	}
		
	function saveKeywords($post_array, $primary_key) {
		$user_logs_insert = array(
			"user_id" => $primary_key,
			"created" => date('Y-m-d H:i:s'),
			"last_update" => date('Y-m-d H:i:s')
		);
	 
		$this->db->insert('user_logs',$user_logs_insert);
	 
		return true;
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
	
	public function categories() {
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