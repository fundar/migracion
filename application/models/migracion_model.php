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

		return $id_document;
	}
	
	public function saveDocument($post_array) {
		//Save document
		$document_insert = array(
			"name"        => $post_array["name"],
			"short_name"  => $post_array["short_name"],
			"date_create" => date('Y-m-d H:i:s'),
			"file_url"    => $post_array["id_document"]
		);
	 
		$this->db->insert('documents', $document_insert);
		$id_document = $this->db->insert_id();
		
		return $id_document;
	}
	
	public function saveKeywordsRequest($post_array, $primary_key) {
		//Save keyword request
		foreach($post_array["keywords"] as $keyword) {
			$keyword_insert = array(
				"id_keyword"   => $keyword,
				"id_request"  => $primary_key
			);
			
			$this->db->insert('keywords2requests', $keyword_insert);
		}
		
		return true;
	}
	
	public function getUrlDocument($id_document) {
		$query = $this->db->get_where('documents', array('id_document' => $id_document));
		$row   = $query->row(0);
		
		if(isset($row->file_url)) {
			return $row->file_url;
		} else {
			return false;
		}
	}
	
	public function keywords() {
		$this->db->select('id_request, keywords');
		$requests = $this->db->get("requests");
		
		foreach($requests->result() as $row) {
			$id_request = $row->id_request;
			$keywords   = split(',', $row->keywords);
			die(var_dump($keywords));
		}
		
		die(var_dump($requests));
	}
}
