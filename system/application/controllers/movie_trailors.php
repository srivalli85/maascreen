<?php

class Movie_Trailors extends controller
	{
 	  var $layout = 'default';	  
 function __Movie_Trailors(){
 	
		parent::Controller();	
		$this->load->model('admin/Trailors_Model');
	}
	function index()
	{	
		
		$this->load->model('admin/Movie_Model');
		
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=20,$order='desc');
		
		
			$movies =array();
			$temp = array();
		for($i=48;$i<=57;$i++)
		{
			$info = $this->Movie_Model->get_movies_byorder($i);
			if(count($info) >0 )
			{
				
			$temp=array_merge($temp,$info);
			}
		}
		if(!empty($temp))
		$movies['0-9']=$temp; 
		for($i=65;$i<=91;$i++)
		{
			$info = $this->Movie_Model->get_movies_byorder($i);
			if(count($info) >0 )
			$movies[chr($i)]=$info;
		}
		
		$data = array('title'			=>	'Maa Screen',
					  'jquery'  		=>  FALSE, 
					  'movies'  		=> $movies,
					'trailors_data'     =>$trailors_data
					  	);
		
		$this->load->view('telugu-cinematrailers',$data);
	
	 }

	}
?>