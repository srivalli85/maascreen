<?php
class Reviews extends Controller {
	
	var $layout = 'admin';
	var $base_uri = '';
	function Reviews()
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
		$this->load->model('admin/Reviews_Model');
		$this->load->model('admin/Movie_Model');
		$this->base_uri = base_url().$this->uri->segment(1).$this->uri->slash_segment(2,'leading');
	}
	
	function index()
	{
		redirect($this->base_uri.'/add.html');
		$this->load->view('admin/reviews_view');
	}
	
	function manage()
	{
		$result = $this->Reviews_Model->get_reviews($id="",$date_format=true);
		$aData =array( 'reviews_data' => $result->result(),
					   'link'	  => base_url(),
					   'base_uri' => $this->base_uri,
					   'message'  => $this->session->flashdata('message'),
		);
		$this->load->view('admin/reviews_view',$aData);
	}

	function add()
	{
		$movies_data = $this->Movie_Model->get_movies();
		$moviedata = array();
		$moviedata[0] = 'Select Movie';
		foreach ($movies_data as $mdata)
		{ 
			$moviedata[$mdata->id] = $mdata->movie_name;
		}
		$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'full');
		$textarea[]= array('textarea' => 'summary',
						   'skin'	  => 'small');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$aData = array(	
						'action'	=> $this->base_uri.'/insert',
						'message'	=> $this->session->flashdata('message'),
						'jslinks' 	=> $links,
						'options'	=> $moviedata,
						'button_value'=> 'Add',
		);
		$segment = $this->uri->segment(4,0);
		if($segment == 2)
		{
			$message = "<span style='color:red;'>Enter All Details</span>";
			$aData = array_merge($aData,array(
					'message1'	=> $message)
			);
		}
	if($segment == 1)
		{
			$message = "<span style='color:#4EA24E;'>Added Successfully</span>";
			$aData = array_merge($aData,array(
					'message1'	=> $message)
			);
		}
		$this->load->view('admin/reviews_add',$aData);
	}
	function insert()
	{
		$submit = $this->input->post('submit');
		$hiddenid = $this->input->post('HidId');
		if(($submit=="Add" || $submit=="Update")
		){
		 $movie_id = 	$this->input->post('movie_id');
		 $cast = $this->input->post('Cast');
		 $banner = $this->input->post('Banner');
		 $type = $this->input->post('Type');
		 $summary = $this->input->post('summary');
		 $description = $this->input->post('description');
		 $rating = $this->input->post('rating');
		 $direction = $this->input->post('Direction');
		 $punchline = $this->input->post('Punchline');
		 $genre	= $this->input->post('Genre');
		 $music = $this->input->post('Music');
		 $cinematography = $this->input->post('Cinematography');
		 $art = $this->input->post('Art');
		 $stunts = $this->input->post('Stunts');
		 $editing = $this->input->post('Editing');
		 $producer = $this->input->post('Producer');
		 $story = $this->input->post('Story');
		 $screenplay = $this->input->post('Screenplay');
		 
		 
		 
		 $data = array(
		 				'movie_id' 		=>	$movie_id,
		 				'cast'			=>	$cast,
		 				'direction'		=>	$direction,
		 				'producer'		=>	$producer,
		 				'type'			=>  $type,
		 				'banner'		=> 	$banner,
		 				'punchline'		=>	$punchline,
		 				'genre'			=>	$genre,
		 				'music'			=>	$music,
		 				'cinematography'=>	$cinematography,
		 				'art'			=>	$art,
		 				'stunts'		=>	$stunts,
		 				'editing'		=>	$editing,
		 				'story'			=>	$story,
		 				'screenplay'	=>	$screenplay,
		 				'summary'		=>	$summary,
		 				'description'	=>	$description,
		 				'rating'		=>	$rating,			
		 );
		 if($submit=="Add")
		 $result = $this->Reviews_Model->insert($data);
		 if($submit=="Update")
		 {
		 	 $result = $this->Reviews_Model->update($hiddenid,$data);
		 }
		 if($result==1)
		 {
		 	$this->load->model('admin/Upload_Files_Model');
		 	if($submit=="Update")
			 {	
			 	if(isset($_FILES['review_image']['name']))
			 	{
			 		$file = "true";
			 	}
			 	else 
			 	{
			 		$file = 'false';
			 	}
		 	$id = $hiddenid;
			 }
			 else 
			 if($submit=="Add")
			 {	
			 	$id = $this->db->insert_id();
			 }
			 if($submit=="Add" ||($submit=="Update" && $file == 'true'))
			  {
		 	$config['upload_path'] = './assets/images/';
			$config['allowed_types'] = 'gif|jpg|png';
			$config['max_size']	= '1000';
			$config['max_width']  = '1024';
			$config['max_height']  = '768';
			$field_name = 'review_image';
			$aData = array(	
						'action'	=> $this->base_uri.'/insert',
			);
			$data = array(
							'rename_to' 	=> 'reviews_'.$id.'.jpg',
							'update_table' 	=> 'reviews', 
							'update_column'	=> 'image',
							'if_error_view' => 'admin/reviews_add',
							'error_view_data'=> $aData,
							'on_error_redirect'	=> $this->base_uri.'/add.html',
							'thumb_created' 	=> 'reviews_'.$id.'_thumb.jpg',
							
			);
		 	$result = $this->Upload_Files_Model->Upload_Files($config,$field_name,$id,$data,$is_thumb = TRUE);
		 	if($result == 'true')
		 	{
		 		if($submit=="Update")
		 		{
		 			redirect($this->base_uri.'/manage/1.html');
		 		}
		 		else 
		 		redirect($this->base_uri.'/add/1.html');
		 	}
		 	else if ($result == 'false')
		 	{
		 		if($submit=="Update")
		 		{
		 			redirect($this->base_uri.'/manage/2.html');
		 		}
		 		else 
		 		redirect($this->base_uri.'/add/2.html');
		 	}
			  }
			  else
			  {
			  	redirect($this->base_uri.'/manage/2.html');
			  }
		 }
		 
		}
		else {
			 if($submit=="Add")
		redirect($this->base_uri.'/add/2.html');
		  if($submit=="Update")
		  redirect($this->base_uri.'/edit/'.$hiddenid.'.html');
		}
		
	}
	function delete()
	{  
		$id = $this->uri->segment(4,0);
		if($id!=0)
		{
			$this->db->where('id', $id);
			if ($this->db->delete('reviews'))
			{
				unlink('./assets/images/reviews_'.$id.'.jpg');
				unlink('./assets/images/reviews_'.$id.'_thumb.jpg');
				$this->session->set_flashdata('message','<span style="color:green">Deleted Successfully</span>');
			}
			else 
			{
				$this->session->set_flashdata('message','<span style="color:red"><B>Error in Deleting</B></span>');
			}
		}
		else
		{
			$this->session->set_flashdata('message','<span style="color:red">Error in Deleting</span>');
		}
		
		redirect($this->base_uri.'/manage.html');
	}
	function edit()
	{
		$movies_data = $this->Movie_Model->get_movies();
		$moviedata = array();
		$moviedata[0] = 'Select Movie';
		foreach ($movies_data as $mdata)
		{ 
			$moviedata[$mdata->id] = $mdata->movie_name;
		}
		$edit_id = $this->uri->segment(4,0);
		$movie_details = $this->Reviews_Model->get_reviews($edit_id,$date_format=true);	
		$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'full');
		$textarea[]= array('textarea' => 'summary',
						   'skin'	  => 'small');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$aData = array(	
						'action'		=> $this->base_uri.'/insert',
						'message'		=> $this->session->flashdata('message'),
						'jslinks' 		=> $links,
						'options'		=> $moviedata,
						'button_value'	=> 'Update',
						'review_details'=> $movie_details->row(),
						'reviewid'		=> $edit_id,
		);
		$this->load->view('admin/reviews_add',$aData);
	}
	function update()
	{
		
	}
}
?>