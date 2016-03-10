<?php

class Maa extends Controller {
	
	var $layout = 'default';
	  function __construct()
	  {
	    parent::Controller();
	    $this->load->library('MAA_home', 'maa_home');
	  }
	function index()
	{   
		
		
		//$news_details=$this->Filmnews_Model->select();
		//get breaking news
		$breaking_news=$this->Filmnews_Model->get_breaking_news();
		//print_r($news_details);
		//function to get limited reviews
		$reviews_list = $this->Reviews_Model->get_reviews($id="",$date_format=true,$start=0,$limit=7);		//getting wallpaper images
		$this->load->model('Wallpapermain');
		
		$wallpaper_recentcategeories=$this->Wallpapermain->recentcategeories();
		$wallpaper_categeories =$this->Wallpapermain->getwallpcategeories();
		//print_r($wallpaper_recentcategeories);
		$wallpaper_subcategeories= $this->Wallpapermain->getsubcategeories($wallpaper_recentcategeories,3);
		//print_r($wallpaper_subcategeories);
		$wallpaperimages = $this->Wallpapermain->getimages($wallpaper_subcategeories);
		
		// getting gallery images
		$this->load->model('Gallery_model');
		$gallery_recentcategeories=$this->Gallery_model->recentcategeories();
		$gallery_categeories =$this->Gallery_model->getwallpcategeories();
		//print_r($recentcategeories);
		$gallery_subcategeories= $this->Gallery_model->getsubcategeories($gallery_recentcategeories,3,$ascii="");
		$galleryimages = $this->Gallery_model->getimages($gallery_subcategeories);
		
		//getting images of fun
		$this->load->model('Funlist_model');
		 //list($funrecentcategeories,$funimages) = $this->Funlist_model->recent_categeories();
		//print_r($funrecentcategeories);
		// print_r($funimages);
		 //videos 
		$this->load->model('Videos_model');
		$vcategeories = array();
		$videoid=array();
		$vcategeories = $this->Videos_model->getvideocategeories(4);
		$videoid = $this->Videos_model->getrecentvideo(1,-1,-1);
		
		 //get interviews and trailors and gossips			
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=20,$order='desc');
		$trailor = $this->Trailors_Model->getrecenttrailor();
		//print_r($trailor);
		$interview_video=$this->Interviews_Model->get_interview_videos();
		$gossips_data  = $this->Interviews_Model->get_gossips_details($id="",$start=0,$order='desc',$count=false,$limit=7);
		//print_r($gossips_data);
		$this->load->model('admin/Songs_model');
		$songs = $this->Songs_model->getsongs(6);
		//$this->load->model('Slideimages_model');
		//$slideimagequery = $this->Slideimages_model->show();
		//$slides = $slideimagequery->result();
		//print_r($slides);
		$flash_block = $this->maa_home->flash_block();
		$gallery_block = $this->maa_home->gallery_block();
		$wallpaper_block = $this->maa_home->left_block('Wallpaper');
		$actors_block = $this->maa_home->left_block('Actors');
		$movies_block = $this->maa_home->left_block('Movies');
		$missindia_block = $this->maa_home->left_block('Miss india');
		$hotvideos_block = $this->maa_home->left_block('Hot Videos');
		$filmnews_block = $this->maa_home->center_block('Telugu Film News');
		$interviews_block = $this->maa_home->center_block('Interviews');
		$funlist_block = $this->maa_home->funlist_block('Funny Pictures');
		$filmvideos_block = $this->maa_home->right_block('Telugu Film Videos',$gossips_data);
		$funvideos_block = $this->maa_home->right_block('Fun Videos',$gossips_data);
		$trailors_block = $this->maa_home->right_block('Telugu Film Trailors',$gossips_data);
		$reviews_block = $this->maa_home->gossips_block('Movie Reviews',$gossips_data);
		$gossips_block = $this->maa_home->gossips_block('Movie Gossips',$gossips_data);
		
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  TRUE, 
				'gossips_data'	=> $gossips_data,
				'wallpaper_categeories'=> ($wallpaper_categeories->result()),
		         'gallery_categeories'=> ($gallery_categeories->result()),
		         'wallpaper_recentcategeories' => $wallpaper_recentcategeories,
		         'gallery_recentcategeories' => $gallery_recentcategeories,
		         'wallpaper_subcategeories' => $wallpaper_subcategeories,
		         'gallery_subcategeories' => $gallery_subcategeories,
		         'wallpaperimages' =>$wallpaperimages,
			     'galleryimages'=>$galleryimages,
		        /*'funrecentcategeories'=> $funrecentcategeories,
		         'funimages' =>$funimages,*/
				'reviews_list'=> $reviews_list->result(),
				// 'news_details'=>$news_details,
		'videocategeories' => $vcategeories ,
		               'videoid' =>$videoid,
					'breaking_news'=>$breaking_news,
					'interview_video'=>$interview_video,
		            'trailors_data' =>$trailors_data,
		            'trailor' =>$trailor,
		            'songs'=> $songs,
		            'flash_block' 	=> 	$flash_block,
		            'gallery_block'  => $gallery_block,
					'wallpapers_block' 	=> 	$wallpaper_block,	
					'actors_block' 		=> 	$actors_block,
					'movies_block' 		=> 	$movies_block,
					'missindia_block'	=>	$missindia_block,
					'hotvideos_block'	=>	$hotvideos_block,
					'filmnews_block' 	=>	$filmnews_block,
					'interviews_block'  =>  $interviews_block,
		            'funlist_block'     =>  $funlist_block,
					'filmvideos_block'  =>  $filmvideos_block,
					'funvideos_block'   =>  $funvideos_block,
					'trailors_block'  	=>  $trailors_block,
					'reviews_block'		=>  $reviews_block,
					'gossips_block'	=>  $gossips_block
		         	);
		
		         
		$this->load->view('home',$data);
	}
	function slideimages()
	{
		//$this->load->model('Slideimages_model');
		//$slideimagequery = $this->Slideimages_model->show();
		//$slides = $slideimagequery->result();
		//print_r($slides);
	}
	function details(){
		$this->load->model('admin/Interviews_Model');
		$gossip_details=$this->Interviews_Model->gossip_details($this->uri->segment(3));
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  TRUE,
				'gossip_details'=>  $gossip_details,
					
		);
		$this->load->view('gossips/details',$data);
	}
function detail(){
		$this->load->model('admin/Funlist_Model');
		$gossip_funlist=$this->Funlist_Model->gossip_funlist($this->uri->segment(4));
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  TRUE,
				'gossip_funlist'=>  $gossip_funlist,
					
		);
		$this->load->view('gossips/funlist',$data);
	}
}

?>
