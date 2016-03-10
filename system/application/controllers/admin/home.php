<?php
class Home extends Controller {
	
	var $layout = 'admin';
	
	function __construct()
	{
		parent::Controller();
		$this->Login_Model->login_validate();
	}
	
	function index()
	{

		$this->load->view('admin/adminhome');
	}
}
?>