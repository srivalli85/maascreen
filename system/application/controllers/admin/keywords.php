<?php
class Keywords extends Controller {
	var $layout = 'admin';
	function Keywords()
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
	}
	function index()
	{
		$this->load->model('admin/Openwysiwyg_Model');
		$this->load->library('rss');
		$config['url'] = 'http://www.subhodaya.com/feeds/news';
		$this->rss->initialize($config);
		echo $this->rss->getRss();
		$textarea[]= array('textarea' => 'keywords',
						   'skin'	  => 'none');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		
		$data = array(
						'jslinks' => $links,
		);
		$this->load->view('admin/keywords',$data);
		
	}
	function  add()
	{
	 	echo $keywords = $this->input->post('keywords');
	 	$data = array('keywords' => $keywords);
	 	$this->db->insert('keywords',$data);
	 	redirect(base_url().'admin/keywords');
	}
}
?>