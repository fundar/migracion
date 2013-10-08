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
		die(var_dump($post_array));
		$user_logs_insert = array(
			"user_id" => $primary_key,
			"created" => date('Y-m-d H:i:s'),
			"last_update" => date('Y-m-d H:i:s')
		);
	 
		$this->db->insert('user_logs',$user_logs_insert);
	 
		return true;
	}
}
