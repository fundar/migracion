<?php
class migracion_Model extends CI_Model  {
	
	function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_keywords($table = "keywords") {
		$this->db->select('id_keyword, value');
		return $this->db->get($table);
	}
	
	public function saveRequest($post_array) {
		//Save document
		$document_insert = array(
			"name"        => $post_array["name"],
			"short_name"  => $post_array["short_name"],
			"date_create" => date('Y-m-d H:i:s'),
			"file_url"    => $post_array["id_document"]
		);
	 
		$this->db->insert('documents', $document_insert);
		$id_document = $this->db->insert_id();
		
		
		//Save keyword document
		foreach($post_array["keywords"] as $keyword) {
			$keyword_insert = array(
				"id_keyword"   => $keyword,
				"id_document"  => $id_document
			);
			
			$this->db->insert('keywords2documents', $keyword_insert);
		}
		
		
		$result["id_document"] = $id_document;

		return $result;
	}
	
	public function saveKeywordsRequest($post_array, $primary_key) {
		//Save keyword request
		foreach($post_array["keywords"] as $keyword) {
			$keyword_insert = array(
				"id_keyword"   => $keyword,
				"id_document"  => $primary_key
			);
			
			$this->db->insert('keywords2requests', $keyword_insert);
		}
		
		return true;
	}
}