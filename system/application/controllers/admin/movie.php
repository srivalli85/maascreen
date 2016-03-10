<?php
class Movie extends Controller {
	var $layout =  "admin";
	var $base_uri = '';
	function Movie()
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
		$this->base_uri = base_url().$this->uri->segment(1).$this->uri->slash_segment(2,'leading');
		$this->load->model('admin/Movie_Model');
	}
	function index()
	{
		$this->load->model('admin/Wallpaper_model');
		$this->load->model('admin/Gallery_model');
		//to get the list of all movies list in wallpapers 
		$wall_movies_list = $this->Wallpaper_model->get_movies($cat = 'movies');
		$wall_options['0'] = 'Select one';  
		foreach ($wall_movies_list as $wall)
		{
			$wall_options[$wall->id] = ucfirst($wall->catname);  
		}
		//to get the list of all movies list in gallery 
		$gall_movies_list = $this->Gallery_model->get_movies($cat = 'movies');
		$gall_options['0'] = 'Select one';  
		foreach ($gall_movies_list as $gallery)
		{
			$gall_options[$gallery->id] = ucfirst($gallery->catname);  
		}
		//get recent interview details
		
		$this->load->model('admin/Interviews_Model');
		$interview_details = $this->Interviews_Model->get_interview_details($id="",$limit="",$order='desc',$count=false);
		$int_options['0'] = 'Select one';  
		foreach ($interview_details as $int_list)
		{
			$int_options[$int_list->int_goss_id] = ucfirst($int_list->person_name);  
		}
		$data = array (
						'action' 		=> $this->base_uri.'/insert',
						'message'		=> $this->session->flashdata('message'),
						'wall_movies_options'=> $wall_options,
						'gall_movies_options'=> $gall_options,
						'int_options'		=> $int_options,
						'button_value'		=> 'Add',
		);
		$this->load->view('admin/movie_view',$data);
	}
	function insert()
	{
		$moviename = $this->input->post('moviename');
		$releasedate = $this->input->post('releasedate');
		$wall_movies = $this->input->post('wall_movies');
		$gall_movies = $this->input->post('gall_movies');
		$int_movies = $this->input->post('interview_movies');
		$active = $this->input->post('active');
		if($active=="")
		$active = 1;
		$details = array(
               'movie_name' 	=> $moviename ,
               'release_date' 	=> $releasedate ,
			   'gallery_id'		=> $gall_movies,
			   'wallpapers_id'	=> $wall_movies,
			   'interview_id'	=> $int_movies,
			   'active'	=> $active
            );
            $res = $this->Movie_Model->insert($details);
            if($res == 1)
            {
            	$this->session->set_flashdata('message',$moviename.' added Successfully');
            }
            else if($res == 0)
            {
            	$this->session->set_flashdata('message','Error in adding '.$moviename);
            }
			else if($res == 10)
            {
            	$this->session->set_flashdata('message','Already Exists: '.$moviename);
            }
		redirect($this->base_uri);
		
	}
	function manage()
	{
		$movie_detials = $this->Movie_Model->get_movies();
		
		$data = array (
						'movies_data'	=> $movie_detials,
						'base_uri'		=> $this->base_uri,
						'message'		=> $this->session->flashdata('message'),
			);
		$this->load->view('admin/manage_movies',$data);
	}
	function delete()
	{
		$id = $this->uri->segment(4,0);
		if($id!=0)
		{
			$this->db->where('id', $id);
			if ($this->db->delete('movies'))
			{
				$this->session->set_flashdata('message','<span style="color:green">Deleted Successfully</span>');
			}
			else 
			{
				$this->session->set_flashdata('message','<span style="color:red">Error in Deleting</span>');
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
		$id = $this->uri->segment(4,0);
		if($id>0)
		{
			$this->load->model('admin/Wallpaper_model');
			$this->load->model('admin/Gallery_model');
			//to get the list of all movies list in wallpapers 
			$wall_movies_list = $this->Wallpaper_model->get_movies($cat = 'movies');
			$wall_options['0'] = 'Select one';  
			foreach ($wall_movies_list as $wall)
			{
				$wall_options[$wall->id] = ucfirst($wall->catname);  
			}
			//to get the list of all movies list in gallery 
			$gall_movies_list = $this->Gallery_model->get_movies($cat = 'movies');
			
			//get movie details by id 
			$movie_detials = $this->Movie_Model->get_movies($id);
			$gall_options['0'] = 'Select one';  
			foreach ($gall_movies_list as $gallery)
			{
				$gall_options[$gallery->id] = ucfirst($gallery->catname);  
			}
			//get recent interview details
			
			$this->load->model('admin/Interviews_Model');
			$interview_details = $this->Interviews_Model->get_interview_details($id="",$limit="",$order='desc',$count=false);
			$int_options['0'] = 'Select one';  
			foreach ($interview_details as $int_list)
			{
				$int_options[$int_list->int_goss_id] = ucfirst($int_list->person_name);  
			}
			$data = array (
							'action' 		=> $this->base_uri.'/update',
							'message'		=> $this->session->flashdata('message'),
							'wall_movies_options'=> $wall_options,
							'gall_movies_options'=> $gall_options,
							'movie_details'		=> $movie_detials,
							'int_options'		=> $int_options,
							'button_value'		=> 'Update',
			);
			$this->load->view('admin/movie_view',$data);
		}
		
	}
	
	function update()
	{
		$id = $this->input->post('hidden_id');
		$moviename = $this->input->post('moviename');
		$releasedate = $this->input->post('releasedate');
		$wall_movies = $this->input->post('wall_movies');
		$gall_movies = $this->input->post('gall_movies');
		$int_movies = $this->input->post('interview_movies');
		$active = $this->input->post('active');
		if($active=="")
		$active = 1;
		$details = array(
              				'movie_name' 	=> $moviename ,
               				'release_date' 	=> $releasedate ,
			   				'gallery_id'	=> $gall_movies,
			   				'wallpapers_id'	=> $wall_movies,
			   				'interview_id'	=> $int_movies,
			   				'active'		=> $active
            );
          	$this->db->where('id', $id);
            $this->db->update('movies',$details);
          redirect($this->base_uri.'/manage.html');
         
	}
}
?>