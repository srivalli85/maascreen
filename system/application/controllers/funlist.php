<?php
class Funlist extends Controller {
	var $layout = 'default';
	function Funlist(){
		parent::Controller();
		$this->load->model('Funlist_model');
		$this->load->helper('common_functions');
		
		
	}
	function index()
	{	
		//get breaking news
		$main_categeories = $this->Funlist_model->categeories(0);
		$id = current(($main_categeories->result_array()));
		
		$sub_categeories = $this->Funlist_model->categeories($this->uri->segment(3,$id['id']));
	    
		
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 	
		              'main_categeories' => $main_categeories,
		              'sub_categeories' => $sub_categeories,
					);
		//get categeory name
		$data['categeoryname']=$this->Funlist_model->getcategeoryname($this->uri->segment(3));
	    
		$this->load->view('funlist',$data);
	}
	//displaying images from subcategeories
	function funlists()
	{
		//get breaking news
		$main_categeories = $this->Funlist_model->categeories(0);
	    $images = $this->Funlist_model->funlists($this->uri->segment(3,0),'no');
	    $data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 	
		              'main_categeories' => $main_categeories,
		              'images' => $images,
	    			
		);
		$data['categeoryname']=$this->Funlist_model->getcategeoryname($this->uri->segment(3));
	    
		$this->load->view('funlist1',$data);
	}
}
?>