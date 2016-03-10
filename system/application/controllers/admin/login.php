<?php
class Login extends Controller {

		var $layout = 'admin';
 	function __construct()
	  {
	    parent::Controller();
	  }
	
	function index(){
		echo $this->uri->segment(4);
		$session = $this->session->userdata('uname');
		
		$this->load->view('admin/home');
	}
	
	// login form submition and validation 
	function validate()
	{
		$uname = $this->input->post('uname');
		$password = $this->input->post('paswd');
		
		$this->load->model('admin/Login_Model');
		$this->Login_Model->validate_username($uname,$password);
	}
	function  error()
	{
			if($this->uri->segment(4)==1)
			{
				$data = array(
								'message' 	=> 'Invalid Username/Password'
				);
				
			}
		if($this->uri->segment(4)==2)
			{
				$data = array(
								'message' 	=> 'Invalid Access'
				);
				
			}
			$this->load->view('admin/home',$data);
	}
	function logout()
	{
		$this->session->sess_destroy();
		redirect(base_url().'index.php/admin/login');
	}
}
?>