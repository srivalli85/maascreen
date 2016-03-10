<?php
class Songs extends Controller {
	 var $layout = 'admin';
	function Songs()
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
		$this->load->model('admin/Songs_model');
		//if not logged in go to login page
	   	$this->Login_Model->login_validate();		
	}
	function index()
	{
		$this->load->view('admin/songupload');
		
	}
	function upload()
	{
		$data['upload'] ='yes';
		$this->Songs_model->upload('admin/songupload');
		$this->load->view('admin/songupload',$data);
	}
	function displaysongs()
	{
		$data['query'] = $this->Songs_model->getsongs($limit=0);
		$this->load->view('admin/viewsongs',$data);		
		
	}
	function deletesong()
	{
		$removeid=array();
		if(isset($_POST['remove']))
		{
		   $removeid = $_POST['removeid'];
     	}
		else
		{
			$removeid['1'] = $this->uri->segment(4);
		
		}
		
		foreach($removeid as $item)
		{
			
	 	$this->Songs_model->deletesong($item);
		}
	 	redirect('admin/songs/displaysongs');
	}
	
}
?>