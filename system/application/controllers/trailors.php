<?php
class Trailors extends Controller {
	var $layout = 'default';
	function __construct()
	{
		parent::Controller();
		
		$this->load->model('admin/Trailors_Model');
		$this->base_uri = base_url().$this->uri->segment(1).$this->config->item('url_suffix');
	}
	
	function index()
	{
		
		//wallpaper categeoreis for jumpto menu
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE,
		);
		
		$this->load->view('trailors',$data);
	}
	function details(){
		
		$movie_id = $this->uri->segment(3);
		$trailor_id = $this->uri->segment(4,0);		
		if($movie_id=="")
		redirect(base_url().'movie_trailors.html');
		$trailors_data=$this->Trailors_Model->get_trailor_fulldetails($id="",$limit=15,$order='desc');
		$get_trailor_id=$this->Trailors_Model->get_trailor_id();
		$details=$this->Trailors_Model->get_trailors($movie_id);
		if(empty($details))
		redirect(base_url().'movie_trailors.html');
		if($trailor_id == 0)
		{
		foreach ($details as $det)
		{
			$trailor_ids[]=$det->t_id;
		}
		$recent_trailor =  max($trailor_ids);
		}
		else
		if($trailor_id > 0)
		{
			$recent_trailor =  $trailor_id;
		}
		$counter = 0;
		foreach ($trailors_data as $t_data)
		{
			$counter ++;
			$details1=$this->Trailors_Model->get_trailors($t_data->movie_id);
			$trailor_ids = array();
			foreach ($details1 as $det)
			{
			$trailor_ids[]=$det->t_id;
			}
			$recent_trailor1 =  max($trailor_ids);
			
			$Trailors[] = array('id' 			=> $t_data->movie_id,
								'movie_name'	=> $t_data->movie_name,
								't_id'			=> $recent_trailor1
								);
			if($counter==6)
			break;
		}
		$this->load->library('flash_video');
		$config['id'] = 'n0';
		$config['height'] = '300';
		$config['width']  = '407';
		$config['previewimage']=base_url()."assets/trailors/preview_image/trai_imge".$recent_trailor.".jpg";
		$config['file'] = base_url()."assets/trailors/trailor".$recent_trailor.".flv";
		$config['skin'] = 'metarby10';
		$config['autostart'] = 'true';
		$config['logo'] = base_url()."assets/imgs/maa screen-min logo copy.png";	
		$this->flash_video->initialize($config);
		$jslinks = $this->flash_video->getcode();
			$data = array(	'title'			=>	'Maa Screen',
					      	'jquery'  		=>  FALSE,
				      	  	'videoplayer'	=>  $jslinks,
						  	'details'   	=>  $details,
					      	'trailors_data' => $trailors_data,
							'Recent_Trailors'=> $Trailors,
			    				);
		$this->load->view('trailors',$data);
	}
	
}
?>