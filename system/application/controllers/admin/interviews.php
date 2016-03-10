<?php
class Interviews extends Controller {
	var $layout = 'admin';
	var $base_uri = "";
	function Interviews(){
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		
		parent::Controller();
		$this->base_uri = base_url()."admin/interviews/insert";
		$this->Login_Model->login_validate();
		$this->load->helper('form');
		$this->load->helper('date');
		$this->load->helper('file');
		$this->load->helper('url');
		$this->load->model('admin/Interviews_Model');
		 
	}
	function index(){
		$message = $this->Interviews_Model->message($this->uri->segment(4,0));
		$data = array('url'=> $this->base_uri,
					  'message' => $this->session->flashdata('message')
					  ); 
		if($this->uri->segment(4,0)>0)
		{
			$data['message'] = $message;
		}
		$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'none');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$data['jslinks'] = $links;
		
		$this->load->view('/admin/interview_view',$data);
	}
	
	function insert(){
		if($_POST['brose']=='Image'){
			if($_POST['media']=='Interview')
				$config['upload_path'] = './assets/images/interviews';
			if($_POST['media']=='Gossips')
				$config['upload_path'] = './assets/images/gossips';
			
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '1000';
		$config['max_width']  = '1024';
		$config['max_height']  = '768';
		
		
		
		}else if($_POST['brose']=='Video'){
		$config['upload_path'] = './assets/videos';
		$config['allowed_types'] = 'flv';
		$config['max_size']	= '10000000000';
		$config['max_width']  = '1024';
		$config['max_height']  = '768';
		
		$config1['upload_path'] = './assets/videos/image_preview';
		$config1['allowed_types'] = 'gif|jpg|png';
		$config1['max_size']	= '1000';
		$config1['max_width']  = '1024';
		$config1['max_height']  = '768';	
		}
		$username=$this->input->post('username');
		$description=$this->input->post('description');
		$date=$this->input->post('date');
		$media=$this->input->post('media');
				$data1=array
			  		(
  		 			'person_name'=>$username,
   					'description'=>$description,
  		 			'on_date'=>$date,
 					'type'=>$media 		  		
  					 );

		$result=$this->db->insert('int_goss', $data1);
		$id=$this->db->insert_id();		
		if(!isset($_POST['active_video']) || $_POST['active_video']==''){
			$active_video=0;
		}else{
			$active_video=$_POST['active_video'];
		}
		$data2=array(
		    				'int_goss_id'=>$id,
		    				'media_type'=>$_POST['brose'],
		    				'media_name'=>$_POST['media'],
							'active_video'=>$active_video
		    	);
		$this->db->insert('int_goss_media',$data2); 
		//upload video image preview

	//	upload video 
		$this->load->library('upload');
		if($_POST['brose']=='Video'){
		$this->upload->initialize($config);
		$fieldname  = 'mediafile';
		$preview_image_path = 'assets/videos/';
		$file_type = '.flv';
		 list($error[],$success) = $this->image_video_upload($fieldname,$preview_image_path,$file_type,$result,$id);
		 if($success == 1)
		 {
		$this->upload->initialize($config1);
		$fieldname  = 'preview_image';
		$preview_image_path = 'assets/videos/image_preview/';
		$file_type = '.jpg';
		list($error[],$success) = $this->image_video_upload($fieldname,$preview_image_path,$file_type,$result,$id);
		if($success == 1)
		 {
				$filename = 'int'.$id.'.jpg';
		    	$config['image_library'] = 'gd2';
		        $config['source_image'] = $preview_image_path.$filename;
				$config['create_thumb'] = TRUE;
				$config['maintain_ratio'] = TRUE;
				$config['width'] = 160;
				$config['height'] = 160;
		    	
		    	$this->load->library('image_lib');      
		    	$this->image_lib->initialize($config);
		    	
		    	if(!$this->image_lib->resize())
		    	{
		    		$error = array('error' => $this->image_lib->display_errors());
					
		    	}
		    	$this->image_lib->clear();
		    	
		 	redirect(base_url().'admin/interviews/index/1.html');
		 }
		 else 
		 {
		 	$this->session->set_flashdata('message',$error);
		 	$this->session->set_flashdata('message',$error);
			redirect(base_url().'admin/interviews.html');
		 }
		 }
		 else 
		 {
		 	$this->session->set_flashdata('message',$error);
		 	$this->session->set_flashdata('message',$error);
			redirect(base_url().'admin/interviews.html');
		 }
			
		
		}
		
		if($_POST['brose']=='Image'){
		$this->upload->initialize($config);
		$fieldname  = 'mediafile';
		$preview_image_path = $config['upload_path'].'/';
		$file_type = '.jpg';
		list($error[],$success) = $this->image_video_upload($fieldname,$preview_image_path,$file_type,$result,$id);
		
		if($success == 1)
		{
			$this->session->set_flashdata('message',$error);
			
		  	
    	$filename = 'int'.$id.'.jpg';
    	
    	$config['image_library'] = 'gd2';
        $config['source_image'] = $preview_image_path.$filename;
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

    	redirect(base_url().'admin/interviews/index/1.html');
		}
		if(count($error)>0 && !empty($error)) {
		    
			$this->session->set_flashdata('message',$error);
			redirect(base_url().'admin/interviews.html');
		}
		
		}
	}
	function image_video_upload($fieldname="",$preview_image_path="",$file_type,$result=0,$id)
	{
		$error = array();
		$validate = 0;
		if ( ! $this->upload->do_upload($fieldname))
			{
				$this->db->where('id',$id);
	    		$this->db->delete('int_goss');
				$error = array('error' => $this->upload->display_errors().' File name :'.$_FILES[$fieldname]['name']);
							}	
			else
			{
			$data = array('upload_data' =>$this->upload->data());
			

	    	if($result==1){
				$validate = $this->Interviews_Model->rename($data,$preview_image_path,$file_type,$id);
		    	
			
		    	}	
		}
		
		return array($error,$validate);
	}
	function edit_update(){
		

		
		$this->Interviews_Model->do_edit_update();
		redirect(base_url().'admin/int_update');
	}
	
}
?>