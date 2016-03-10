<?php
class Wallpapers extends Controller {
	var $layout = 'default';
	function Wallpapers(){
		parent::Controller();
		$this->load->model('Wallpapermain');
	}
	function index()
	{
		//getting recent 4 main categeories
		$recentcategeories=$this->Wallpapermain->recentcategeories();
		//sidelinks
		$wcategeories =$this->Wallpapermain->getwallpcategeories();
		$subcategeories= $this->Wallpapermain->getsubcategeories($recentcategeories,4,$ascii="");
		$image = $this->Wallpapermain->getimages($subcategeories);
		
		$data = array('title'	=>	'Wallpapers',
					  'jquery'  =>  FALSE,
		              'wcategeories'=> ($wcategeories),
                      'recentcategeories' => ($recentcategeories),
		              'subcategeories' =>  $subcategeories,
		           	  'image'=>$image
		 );
		
		$this->load->view('wallpapers',$data);
	
	}
	//get all subcategeories
	function details()
	
	{ 		
		$categeoryname = $this->Wallpapermain->getcategeoryname($this->uri->segment(3));
		$categeories=$this->Wallpapermain->getwallpcategeories();
	    $subcategeories =array();
			
		for($i=65;$i<=91;$i++)
		{
			$info = $this->Wallpapermain->subcategeories($this->uri->segment(3),0,$i);
			if(count($info) >0 )
			$subcategeories[chr($i)]=$info;
		}
		if(empty($categeoryname))
		{
			redirect(base_url().'wallpapers');
		}
		$data = array('title'	=>	'Wallpapers',
					  'jquery'  =>  FALSE,
					  'categeoryname' => $categeoryname['0']['catname'],
		              'categeories' => $categeories,
		              'subcategeories' => $subcategeories,
		 );	
		
		
	     $this->load->view('listwallpapersubcategeories',$data);
	}
	//getall images for specific caegeory
	function display()
	{ 					
		
        $categeoryname = $this->Wallpapermain->getcategeoryname($this->uri->segment(3));
		if(empty($categeoryname))
		{
    		 redirect(base_url().'wallpapers');
		}
	    $wcategeories =$this->Wallpapermain->getwallpcategeories();
		$id=$this->uri->segment(3,0);
		$images = $this->Wallpapermain->getallimages($id);
			
		$data = array('title'	=>	'Wallpapers',
					  'jquery'  =>  FALSE,
		               'categeoryname' => $categeoryname['0']['catname'],
		               'wcategeories' =>$wcategeories,
		              'images'   => $images,
		);
		$this->load->view('wallpaperimages',$data);
	}
}
?>