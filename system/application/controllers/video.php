<?php
class Video extends Controller {
	var $layout = 'default';
	function Video()
	{
		parent::Controller();
		$this->load->model('Videos_model');
	}
	
	function playvideo()
	{   
		$catid =$this->uri->segment(4);
		$videoid=$this->uri->segment(3);
		
			
		$relatedvideos = array();
		$relatedvideos = $this->Videos_model->getrecentvideo(10,$catid,$videoid);
		
		
		$topviewedvideos = array();
		$recentvideos = array();
		$recentvideos = $this->Videos_model->getrecentvideo(8,-1,-1);
		$topviewedvideos = $this->Videos_model->gettopviewed(16,-1);
		
	    $this->Videos_model->increase_viewcount($videoid);
		
		$videocategeories = $this->Videos_model->getvideocategeories(0);
		$video = $this->Videos_model->getvideoname($videoid);
		
		if(!empty($video))
		{
		$videoname = $video['0']->name;	
		}
		else 
		{
			$videoname = '';	
		}
		$this->load->library('flash_video');
		$config['id'] = 'n0';
		$config['height'] = '280';
		$config['width']  = '400';
		$config['autostart'] = 'true';
		$config['file'] = base_url().'assets/videos/video'.$videoid.'.flv';//file full path
		$config['skin'] = 'swift'; 
		$config['previewimage']	=base_url().'assets/videos/image_preview/image'.$videoid.'.jpg';
		$this->flash_video->initialize($config);
		$jslinks = $this->flash_video->getcode();
		
		
			
		$data = array('title'	=>	'Video',
					  'jquery'  =>  FALSE, 
		             
		                'videoplayer' => $jslinks,
		                'videos' => $recentvideos,
		                'topviewedvideos' => $topviewedvideos,
		                'relatedvideos' => $relatedvideos,
		                'videoname' => $videoname,
		               'videocategeories'=>$videocategeories,
						
		);
		
		$this->load->view('view-video',$data);
	}
	
	
}
?>
