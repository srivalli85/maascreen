<?php
class Fun extends Controller {
	var $layout = 'default';
	function Fun()
	{
		parent::Controller();
		$this->load->model('Funlist_model');
	}
	
	function index()
	{
		$main_categeories = $this->Funlist_model->categeories(0);
		
	    list($recentcategeories,$images)=$this->Funlist_model->recent_categeories();
	   
	    print_r($recentcategeories);
	    //print_r($images);	
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE, 	
		              'recentcategeories' => $recentcategeories,
		              'main_categeories' => $main_categeories,
		              'images'=> $images
		);
		$this->load->view('fun',$data);
	}
	
}
?>