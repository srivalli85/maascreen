<?php
class Interviews extends Controller {
	var $layout = 'default';
	function Interviews(){
		parent::Controller();
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');	
	}
	function index(){
		
		$tot_count_interviews  = $this->Interviews_Model->get_interview_details($id="",$limit="",$order='desc',$count=true);
		$this->load->library('pagination');
		$config['base_url'] = base_url().$this->uri->segment(1).'/index/';
		$config['total_rows'] = $tot_count_interviews;
		$config['per_page'] = '9';

		$this->pagination->initialize($config);
		$pagination= $this->pagination->create_links();
		
		$limit=$this->uri->segment(3,0);
		$interview_data = $this->Interviews_Model->get_interview_details($id="",$limit,$order='desc');
		$interview_data1=$this->Interviews_Model->get_interview_fulldetails($id="",$limit=20,$order='desc');
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE,
					 'interview_data' => $interview_data,
					 'interview_data1'=> $interview_data1,
						'pagination'=>$pagination,
		);
		
		$this->load->view('interview_content',$data);
	}

	function details(){
		$this->load->library('flash_video');
		$config['id'] = 'n0';
		$config['height'] = '280';
		$config['width']  = '400';
		$config['autostart'] = 'true';
		$config['previewimage']=base_url()."assets/videos/image_preview/int".$this->uri->segment(3).".jpg";
		$config['file'] = base_url()."assets/videos/int".$this->uri->segment(3).".flv";
		$config['skin'] = 'swift'; 
			
		$this->flash_video->initialize($config);
		$jslinks = $this->flash_video->getcode();
		
		$this->load->model('admin/Interviews_Model');
		$this->load->model('admin/Trailors_Model');
		$interview_data1=$this->Interviews_Model->get_interview_fulldetails($id="",$limit=20,$order='desc');
		$interview_details=$this->Interviews_Model->interview_details($this->uri->segment(3));
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE,
			'interview_details' => $interview_details,
			   'interview_data1'=> $interview_data1,
				   'videoplayer'=> $jslinks,
			  
		);
		$this->load->view('interview_details',$data);
	}
}
?>