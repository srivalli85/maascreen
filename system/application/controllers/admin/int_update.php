<?php
class Int_update extends Controller {
	var $layout = 'admin';
	function Int_update()
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
	 $this->Login_Model->login_validate();
	 $this->load->helper('form');	
	}
	
	function index(){		
	$aData = array('url'=> base_url()."index.php/admin/int_update/edit"); 
	$this->db->select('*');
	$this->db->from('int_goss_media');
	$this->db->join('int_goss', 'int_goss.id=int_goss_media.int_goss_id');
	$aData['quary'] = $this->db->get();
	$this->load->view('admin/int_update_view',$aData);
	}
	
	function edit(){
	$this->load->model('admin/Interviews_Model');
	$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'none');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$details['jslinks'] = $links;
	$details['quary']= $this->Interviews_Model->get_interview_details($this->uri->segment(4));
	$details['hid'] = $this->uri->segment(4);
	$this->load->view('admin/edit_view',$details);
	}
	
	function delete(){
	$this->load->model('admin/Interviews_Model');
	$this->Interviews_Model->delete_interviews($this->uri->segment(4));
	redirect(base_url().'admin/int_update.html');
	}
	function active(){
	$this->load->model('admin/Interviews_Model');
	$this->Interviews_Model->change_active($this->uri->segment(5),$this->uri->segment(4));
	redirect(base_url().'admin/int_update.html');
	}
}
?>