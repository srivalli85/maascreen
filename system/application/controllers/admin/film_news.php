<?php
class Film_News extends Controller {
	var $layout = 'admin';
	function Film_News()
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
		$this->load->helper(array('form', 'url'));
		$this->load->model('admin/Filmnews_Model');
				//if not logged in go to login page
	   $this->Login_Model->login_validate();
	}
	function index(){
		$message = $this->session->flashdata('message');
		$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'full');
		$textarea[]= array('textarea' => 'summary',
						   'skin'	  => 'small');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$data=array(
							'jslinks'   => $links,
							'message'	=> $message,
		);
		$this->load->view('admin/film_news_view',$data);
	}
	function add(){

		$config['upload_path'] = 'assets/filmnews/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '10000';
		$config['max_width']  = '1024';
		$config['max_height']  = '768';
		if(!isset($_POST['breaking_news'])){
			$breaking=0;		
		}else{
			$breaking=$_POST['breaking_news'];
		}
		$heading=$this->input->post('heading');
		$summary=$this->input->post('summary');
		$description=$this->input->post('description');
		$int_date=$this->input->post('int_date');
		
		
		$data=array('heading'=>$heading,
  					'summery'=>$summary,
  					'description'=>$description,
  					'insert_date'=>$int_date,
					'breaking_news'=>$breaking
  					);
	  		if(!empty($data))
  		{
  			 $result=$this->db->insert('film_news',$data);
  			 $id=$this->db->insert_id();	
  		} 
		if($result==1){
		$this->load->library('upload', $config);
		
		if ( ! $this->upload->do_upload('image'))
		{
			$this->db->where('id',$id);
	    	$this->db->delete('film_news');
			$error[] = array('error' => $this->upload->display_errors());
			$this->session->set_flashdata('message',$error);
		}	
		else
		{
			$data = array('upload_data' => $this->upload->data());
			$this->Filmnews_Model->rename($data,$id);
			$message='Film News Added Successfully';
			$this->session->set_flashdata('message',$message);
		}	
		
			$filename = 'film_img'.$id.'.jpg';
			$image_path='assets/filmnews/';
	    	
	    	$config['image_library'] = 'gd2';
	        $config['source_image'] = $image_path.$filename;
			$config['create_thumb'] = TRUE;
			$config['maintain_ratio'] = TRUE;
			$config['width'] = 143;
			$config['height'] = 148;
	    	$this->load->library('image_lib');      
	    	$this->image_lib->initialize($config);
	    	
	    	if(!$this->image_lib->resize())
	    	{
	    		$error = array('error' => $this->image_lib->display_errors());
				
	    	}
	    	$this->image_lib->clear();
			
			redirect(base_url().'admin/film_news',$message);
		}
	}
   function viewfilm_news()
   {
   	$data['filmnews']= $this->Filmnews_Model->get_filmnews_headings();
   	$this->load->view('admin/displayfilmnews',$data);
   }
   function delete()
   {
   	 $id =$this->uri->segment(4,0);
   	 $this->Filmnews_Model->delete($id);
   	 redirect(base_url().'admin/film_news/viewfilm_news');
   }
   function edit()
   {
    $id =$this->uri->segment(4,0);
    $edit = $this->Filmnews_Model->getdetails($id);
   
    $message = $this->session->flashdata('message');
		$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'full');
		$textarea[]= array('textarea' => 'summary',
						   'skin'	  => 'small');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$data=array(
							'jslinks'   => $links,
							'message'	=> $message,
		                    'edit'      =>  $edit
		);
    $this->load->view('admin/editfilmnews',$data);
   }
   function edit1()
   {
   	if(isset($_POST['breaking_news']))
   	{
		$breaking=$_POST['breaking_news'];
   	}else{
   		$breaking=0;
   	}
	  	$id=$_POST['id'];
   	 $this->Filmnews_Model->edit1($id,$breaking);
   	redirect(base_url().'admin/film_news/viewfilm_news');
   }
}
?>