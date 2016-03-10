<?php
class Gallery extends Controller {
	var $layout = 'default';
	function Gallery(){
		parent::Controller();
		$this->load->model('Gallery_model');
		
		
		
	}
	function index()
	{
	
		$recentcategeories=$this->Gallery_model->recentcategeories();
		$gallerycategeories =$this->Gallery_model->getwallpcategeories();
		//print_r($recentcategeories);
		$subcategeories= $this->Gallery_model->getsubcategeories($recentcategeories,4);
		$image = $this->Gallery_model->getimages($subcategeories);
		//print_r($subcategeories);
		
		$data = array('title'	=>	'Gallery',
					  'jquery'  =>  FALSE,
		               
		     'gallerycategeories'=> $gallerycategeories,
		         'recentcategeories' => ($recentcategeories),
		         'subcategeories' =>  $subcategeories,
		         			'image'=>$image,
		                 //  foreach($subcategeories as $item)
		                   
		 	);
		
		
		$this->load->view('gallery',$data);
		 
		
	}
	//get all subcategeories of given categeory
	function details()
	{ 
		$data = array('title'	=>	'Gallery',
					  'jquery'  =>  FALSE,
							
		);	
		$this->db->where('id',$this->uri->segment(3));
		$this->db->select('catname');
		$query=$this->db->get('gallery_categeory');
		
		$categeoryname= $query->result_array();
	   if(empty($categeoryname))
		{
			redirect(base_url().'gallery');
		}
		
		
		$categeories =$this->Gallery_model->getwallpcategeories();
	$subcategeories =array();
			
		for($i=65;$i<=91;$i++)
		{
			$info = $this->Gallery_model->subcategeories($this->uri->segment(3),0,$i);
			if(count($info) >0 )
			$subcategeories[chr($i)]=$info;
		}
		$data = array('title'	=>	'Gallery',
					  'jquery'  =>  FALSE,
					  'categeoryname' => $categeoryname['0']['catname'],
		              'categeories' => $categeories,
		              'subcategeories' => $subcategeories, );
	
	  $this->load->view('listgallerycategeories',$data);
	}
	//get all images of given categeory
	function display()
	{  
		$data = array('title'	=>	'Gallery',
					  'jquery'  =>  FALSE,
							
		);	
        $this->db->where('id',$this->uri->segment(3));
       	$this->db->select('catname,id');
		$query=$this->db->get('gallery_categeory');
		$result = $query->result();
		if(!empty($result))
		{
		$data['categeoryname'] = $result['0']->catname;
		$data['catid'] = $result['0']->id;
		}
		else
		{
			$data['categeoryname'] = 'categeory does not exist';
		}
		
	    $data['gallerycategeories']=$this->Gallery_model->getwallpcategeories();
		$id=$this->uri->segment(3,0);
		$data['images'] = $this->Gallery_model->getallimages($id);
		
		//print_r($data['images']);
		$this->load->view('galleryimages',$data);
	}
    function galleryview()
	{
		$data = array('title'	=>	'Gallery',
					  'jquery'  =>  FALSE,
							
		);
		$data['id']= $this->uri->segment(3);
		//getting categeory name
		$data['catid']= $this->uri->segment(4);
		$this->db->where('id',$this->uri->segment(4));
       	$this->db->select('catname,id');
		$query=$this->db->get('gallery_categeory');
		$result = $query->result();
		$data['categeoryname'] = $result['0']->catname;
		$query = $this->Gallery_model->galleryview($data['id'],$data['catid']);
		$result = $query->result();
		
		$data['links'] = $this->prevnext($query->result(),$data['id']);
		($data['links']);
		
        
		$this->load->view('galleryview',$data);
	}
	function prevnext($result,$id)
	{
	    $ids = array();
		$titles = array();
		$links=array();
		$counter=0;
		
	 if(!empty($result))	
	{
		foreach($result as $item)
		{
			$ids[$counter] = $item->id;
			$titles[$item->id] = $item->title;
			$counter++;
		}
		//print_r($ids);
		
		//$values = array_values($ids);
		//print_r($values);
		
		$id1 = array_search($id,$ids);
		if($id1!=0)
		{
		 $links['prev'] = $ids[$id1-1];
		}
		if(isset($ids[$id1+1]))
		{
		 $links['next'] = $ids[$id1+1];
		}
		
		if(isset($ids['0']))
		{
		 $links['first'] = $ids['0'];
		}
	    if(!empty($ids))
		{
		  $links['last'] = array_pop($ids);
		}
	  
		return $links;
	
	}
	}
	
}
?>