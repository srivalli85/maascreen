<?php
 class Videos extends controller{
 	  var $layout = 'default';
 	  
 function Videos(){
 	
		parent::Controller();
		$this->load->model('Videos_model');
		
	}
	
	//display particular categeory videos
	function displayvideos()
	{
		$bywhat= $this->uri->segment(4,0);
		$id = $this->uri->segment(3,0);
		
	   $query = $this->Videos_model->getvideos($id,$bywhat);
    	$this->load->library('paginationnew');
    	
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =12;
        $this->paginationnew->filePath = base_url().'videos/displayvideos/'.$id.'/'.$bywhat;
        $this->paginationnew->select_what = '*';
        $this->paginationnew->the_table = 'videos';
        $this->paginationnew->add_query = $query;
        
   		$recentvideos = $this->paginationnew->getQuery(TRUE);
  	    $paginate = $this->paginationnew->paginate(); 
   		
     			
		$videocategeories = $this->Videos_model->getvideocategeories(0);
			
		$data = array('title'	=>	'Videos',
					  'jquery'  =>  FALSE,
		              'videocategeories'=>$videocategeories,
		               'recentvideos' => $recentvideos,
		               'paginate' => $paginate,
		                
						
		);
		if(isset($id))
		{
			$data['catid'] = $id;
		}
		$this->load->view('videos',$data);
	}
	function display()
	{
	
		$videocategeories = $this->Videos_model->getvideocategeories(0);
		
			
			if(isset($_POST['search']))
			{
    	$name = $_POST['search'];
			}
			else {
				
				$name = $this->uri->segment(3);
				if($name == '')
				{
					redirect(base_url().'videos/displayvideos');
				}
			}
			//pagination
    	$this->load->library('paginationnew');
    	
    	$this->paginationnew->start = ($this->uri->segment(4)) ? $this->uri->segment(4) : '0';
    	$this->paginationnew->limit =12;
        $this->paginationnew->filePath = base_url().'videos/display/'.$name;
        $this->paginationnew->select_what = '*';
        $this->paginationnew->the_table = 'videos';
        $this->paginationnew->add_query = "WHERE name like '%$name%'";
        
   		$recentvideos = $this->paginationnew->getQuery(TRUE);
   		
   		
 		
 		 $paginate = $this->paginationnew->paginate(); 
		$data = array('title'	=>	'Videos',
					  'jquery'  =>  FALSE,
		              'videocategeories'=>$videocategeories,
		               'recentvideos' => $recentvideos,
		               'paginate' => $paginate,
		               'search' =>'yes'
 		               
		                
						
		); 
		$this->load->view('videos',$data);
		
	}
	
   
}
?>