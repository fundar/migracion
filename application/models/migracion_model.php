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
}
