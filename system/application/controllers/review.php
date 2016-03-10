<?php

class Review extends Controller {
	var $layout = 'default';
	function __construct()
	{
		parent::Controller();
	}
	
	function index()
	{
		//interviews and trailors for jump to menu
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=20,$order='desc');
		$interview_data1=$this->Interviews_Model->get_interview_fulldetails($id="",$limit=20,$order='desc');
		//get breaking news
		$this->load->model('admin/Filmnews_Model');
		$breaking_news=$this->Filmnews_Model->get_breaking_news();
		//wallpaper categeoreis for jumpto menu
		$this->load->helper('common_functions');
		$table=array('0' =>'wallpaper_categeory',
		              '1' =>'gallery_categeory');
		$jumpto = jumpto($table);
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 	
		               'jumpto'=> $jumpto
		);
		$this->load->view('review_view',$data);
	}
	
}



?>