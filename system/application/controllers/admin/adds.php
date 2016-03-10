<?php
class Adds extends Controller {
	var $layout = 'admin';
	var $segment='';
	function Adds()
	{
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		parent::Controller();
		$this->base_uri = base_url()."admin/adds/add_change";
		$this->Login_Model->login_validate();
		$this->load->helper('form');
		$this->load->helper('url');
		$this->load->model('admin/Adds_Model');
	}
	function index()
	{
		$data=array('url'=>$this->base_uri);
		$this->load->view('/admin/add_edit_view',$data);
	}
	function change_add()
	{	//$this->segment=$this->uri->segment(4);
		//$data['ad_name'] = $this->segment;
		$this->load->view('/admin/upload_view');
		//$this->segment=$this->uri->segment(4);
		
	}
	function upload_adds(){
		$add_name=$_POST['add_name'];
		$config['upload_path'] = './assets/adds/';
		$config['allowed_types'] = 'png|jpg|gif';
		$config['max_size']	= '10000';
		$config['max_width']  = '1024';
		$config['max_height']  = '768';
		
		$this->load->library('upload', $config);
	
		if ( !$this->upload->do_upload('addimage'))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
			
			//$this->load->view('', $error);
		}	
		else
		{
			$data = array('upload_data' => $this->upload->data());
			
			$result=$this->Adds_Model->adds_rename($data,$add_name);
			
			redirect("admin/adds");
		}
	}
}
?>