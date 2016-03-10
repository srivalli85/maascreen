<?php
class Gossips extends Controller {
	var $layout = 'default';
		function Gossips(){
		parent::Controller();
		
	}
	function index(){
		//get breaking news
		
		
		$tot_count_gossips  = $this->Interviews_Model->get_gossips_details($id="",$limit="",$order='desc',$count=true);
		$this->load->library('pagination');
		$config['base_url'] = base_url().$this->uri->segment(1).'/index/';
		$config['total_rows'] = $tot_count_gossips;
		$config['per_page'] = '9';
		$this->pagination->initialize($config);
		$pagination= $this->pagination->create_links();
	
		$limit=$this->uri->segment(3,0);
		$start = $config['per_page'];
		$gossips_data  = $this->Interviews_Model->get_gossips_details($id="",$limit,$order='desc',$count=false,$start);
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE,
					'gossips_data' => $gossips_data,
					'pagination'=>  $pagination,
					
		);
		$this->load->view('gossips_view',$data);
	}
	function details(){
		
		
		$gossip_details=$this->Interviews_Model->gossip_details($this->uri->segment(3));
		if(empty($gossip_details))
		redirect(base_url().'gossips');
		$data = array('title'	=>	'Maa Screen',
					  'jquery'  =>  FALSE,
				'gossip_details'=>  $gossip_details,
				
		);
		$this->load->view('gossip_details',$data);
	}
}
?>