<?php
class filimnews extends controller{
 	  var $layout = 'default';
 	  
 function __filimnews(){
 	
		parent::Controller();
		$this->load->helper('common_functions');
		
	}
	function index()
	{
		//breaking news 
		$this->load->model('admin/Filmnews_Model');
		$breaking_news=$this->Filmnews_Model->get_breaking_news();
		//getting wallpaper and gallery
		$this->load->helper('common_functions');
		$table=array('0' =>'wallpaper_categeory',
		              '1' =>'gallery_categeory');
		$jumpto = jumpto($table);
				
		//interviews and trailors for jump to menu
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');
		$get_filmnews_headings=$this->Filmnews_Model->get_filmnews_headings();
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=20,$order='desc');
		$interview_data1=$this->Interviews_Model->get_interview_fulldetails($id="",$limit=20,$order='desc');
		
		$tot_count_interviews=$this->Filmnews_Model->select($id="",$limit="",$order='desc',$count=true);
		$this->load->library('pagination');
		$config['base_url'] = base_url().$this->uri->segment(1).'/index/';
		$config['total_rows'] = $tot_count_interviews;
		$config['per_page'] = '12';

		$this->pagination->initialize($config);
		$pagination= $this->pagination->create_links();
		$limit=$this->uri->segment(3,0);
		$details=$this->Filmnews_Model->select($id="",$limit,$order='desc');
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 
						'details'=>$details,
						'trailors_data'=>$trailors_data,
						'interview_data1'=>$interview_data1,
						'pagination'=>$pagination,
						'filmnews'=>$get_filmnews_headings,
						'breaking_news'=>$breaking_news,
		                'jumpto'  =>  $jumpto
		);
		$this->load->view('view-filimnews',$data);
	}
	function content(){
		$this->load->model('admin/Filmnews_Model');
		$id=$this->uri->segment(3);
		$details=$this->Filmnews_Model->news_more($id);
		$breaking_news=$this->Filmnews_Model->get_breaking_news();
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');
		$get_filmnews_headings=$this->Filmnews_Model->get_filmnews_headings();
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=20,$order='desc');
		$interview_data1=$this->Interviews_Model->get_interview_fulldetails($id="",$limit=20,$order='desc');
		//getting wallpaper and gallery
		$this->load->helper('common_functions');
		$table=array('0' =>'wallpaper_categeory',
		              '1' =>'gallery_categeory');
		$jumpto = jumpto($table);
	
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 
						'details'=>$details,
						'trailors_data'=>$trailors_data,
						'interview_data1'=>$interview_data1,
						'filmnews'=>$get_filmnews_headings,
						'breaking_news'=>$breaking_news,
		                 'jumpto'  =>  $jumpto
		);
		$this->load->view('news_content',$data);	
	}

 }
?>