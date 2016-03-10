<?php

class reviews extends controller{
 	  var $layout = 'default';
 	  
 function __construct(){
 	
		parent::Controller();
		$this->load->model('admin/Trailors_Model');
		
	}
	function index()
	{
		$tot_count = $this->Reviews_Model->get_reviews($id="",$date_format=false,$start=0,$limit="",$count=true);
		//jump to reviews
	
	
		
		$this->load->library('pagination');
		$config['base_url'] = base_url().$this->uri->segment(1).'/index/';
		$config['total_rows'] = $tot_count;
		$config['per_page'] = '9';
		$config['url_suffix'] = $this->config->item('url_suffix');
		$this->pagination->initialize($config);
		$pagination = $this->pagination->create_links();
		$start = $this->uri->segment(3,0);
		$limit = $config['per_page'];	

		//to get the review details
		$reviews_data = $this->Reviews_Model->get_reviews($id="",$date_format=false,$start,$limit,$count=false);
		$reviews_details = $reviews_data->result_array();
		//to get the trailors 
		$details1 = array();
		foreach ($reviews_details as $details)
		{
		$trailors_count = $this->Trailors_Model->get_trailors_by_movie($details['movie_id']);
		$details1[] = array_merge($details,array('trailors_count' => $trailors_count));
		}

		$aData = array(	'title'			=>	'Maa Screen: Movie Reviews',
						'jquery' 		=> 	FALSE,
						'data' 			=>  $details1,
						'pagination'	=> 	$pagination,
						
		);
		$this->load->view('view-review',$aData);
	}
	function details()
	{
		$review_id = $this->uri->segment(3,0);
		if($review_id!=0)
		{
			$review_details = $this->Reviews_Model->get_reviews($review_id,$date_format=true);	
		}
		else 
		{
			
		}
		
		$Rdetails = $review_details->row();
		if(!empty($Rdetails))
		{
		$movie_id = $this->Reviews_Model->get_movie_id($review_id);
		$trailors_count = $this->Trailors_Model->get_trailors_by_movie($movie_id);
		//jump to reviews
		$recent_movies = $this->Reviews_Model->get_reviews($id="",$date_format=false,0,20,$count=false);
		$data = array(	
						'title'				=> 'Maa Screen Review-Movie:'.ucfirst($Rdetails->movie_name).','.ucwords($Rdetails->cast),
					  	'jquery' 	 		=>  FALSE, 	
		               	'review_details'	=> $Rdetails,
						'movie_id'			=> $movie_id,
						'trailors_count' 	=> $trailors_count,
						'recent_movies'		=>	$recent_movies,
						'heading'			=> ucfirst($Rdetails->movie_name),
		);

		$this->load->view('review_view',$data);
		}
		else 
		{
			redirect(base_url().'reviews');
		}
	}

 }
?>