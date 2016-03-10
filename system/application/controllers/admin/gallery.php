<?php
  class Gallery extends Controller {
  	  var $layout = 'admin';
	function Gallery(){
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		parent::Controller();
		$this->load->model('admin/Gallery_Model');
		$this->load->helper(array('form','url','file'));
		//if not logged in go to login page
	   $this->Login_Model->login_validate();
	}
    //displaying root categeories from database	
   function categeory1()
	{  	 
	   $parentid=0;	    
       $data['options'] =$this->gallery_model->Categeory($parentid);
       $this->load->view('admin/gallery_admin_categeory',$data);
	}
	//displaying categeories for adding images
	function root_forimages()
	{
	   $parentid=0;	
	   $data['options1'] = $this->gallery_model->Categeory($parentid);
	   $data['options'] = array(''=>'');
	   $data['parentid']= 0;
       
       if($this->input->post('parentid'))
       {
       $parentid = $this->input->post('parentid');
       $data['options']= $this->gallery_model->Categeory($this->input->post('parentid'));
       $data['parentid']= $parentid;
       
       }
	   $this->load->view('admin/gallery_admin_images',$data);
	}
		//adding categeories
   function addCategeory()
	{ 
	 
	 $this->gallery_model->addCategeory($this->input->post('catname'),$this->input->post('parentid'));
     redirect('admin/gallery/categeory1');
    }
	
	//extracting categeory info and displaying in edit form for categeory
	function catedit()
	{
		$query = $this->gallery_model->cat($this->uri->segment(4));
		$data['cat'] = $query->result();
		
		$this->load->view('admin/gallery_edit',$data);
		
	}
	
	//adding images into the categeory
	function addImage()
	{ 
		$title = array();
		$title =$_POST['title'];
	 //print_r($title);
		
	  $this->gallery_model->addImage($title,$_POST['parentid1']);
	   redirect('admin/gallery/root_forimages');
	}
	
	//displaying categeories and sub categeories
	function categeoryview()
    {
    	//pagination
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
   $this->paginationnew->filePath = base_url().'admin/Gallery/categeoryview/'.$this->uri->segment(4);
   $this->paginationnew->select_what = '*';
   $this->paginationnew->the_table = 'gallery_categeory';
   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by update_date desc';
        
   $data['query'] = $this->paginationnew->getQuery(TRUE);
  // print_r($data['query']->result());
   $data['paginate'] = $this->paginationnew->paginate(); 
	  	if($this->uri->segment(4,0)!=0)
	{
		//if it is subcategeory
	   $data['sub']='yes';
	}
       $this->load->view('admin/gallery_categeory-view',$data);
		
	}
	//view all images for the specified categeory
    function image_view()
    {
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
   $this->paginationnew->filePath = base_url().'admin/gallery/image_view/'.$this->uri->segment(4);
   $this->paginationnew->select_what = '*';
   $this->paginationnew->the_table = 'gallery_images';
   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by id desc';
        
    	$data['query'] = $this->paginationnew->getQuery(TRUE);
   $data['paginate'] = $this->paginationnew->paginate(); 
    	
    	
    	$this->load->view('admin/gallery_image-view',$data);
     }
    //edit categeory info in database 
	function editcategeory()
	{   
		 $id = $this->input->post('id');
		 $parentid = $this->input->post('parentid');
		 $catname = $this->input->post('catname');
		 $this->gallery_model->editcategeory($id,$catname);
		 redirect('admin/gallery/categeoryview/'.$parentid);
		 
	}	   
	//delete categeory from database	
	function deletecategeory()
	{
		
     //if check boxes are selected for deleting
	 if (isset($_POST['remove']) && $_POST['remove']=='remove selected')
	 {//get the values 
 	  $id1 = array();
 	  $id1 = $_POST['removeid'];
 	  $parentid = $_POST['parentid'];
 	  
 	  
 	  //if no of check boxes selected > 0
 	 if (count($id1) > 0)
 	  { //fetch each and every one check box item
    	 foreach ($id1 as $id)
    	 
   	    {
   	    	$isroot = $this->gallery_model->isrootcategeory($id);
	    //check whether the wallpaper is root	
	   if($isroot)
	  {
		//fetch all sub categeories
	    $query1 = $this->gallery_model->subcat($id);
	    foreach ($query1->result() as $item1):	
        //fetch and delete all images in each and every sub wallpaper
        $query2 = $this->gallery_model->image_view($item1->id); 		 
	  	  foreach ($query2->result() as $item2):	
	    $this->gallery_model->deleteimage($item2->id);
		  
	    endforeach;
	    endforeach;
	    //delete all subcategeories
	    $this->gallery_model->deletesubcategeory($id);				  
	 }	
	else{//sub categeory
		 //fetch all images
		 $query2 = $this->gallery_model->image_view($id); 		 
         //fetch and delete all images
         foreach ($query2->result() as $item2):	
	     $this->gallery_model->deleteimage($item2->id);
	     
         endforeach;
	    }
	    
	    
	   //delete wallpaper	
	   $this->gallery_model->deletecategeory($id);
  	  }//foreach
 	  }//if
   }//if

   else{		
		
		$id = $this->uri->segment(4);
		
		$parentid = $this->uri->segment(5);
	    $isroot = $this->gallery_model->isrootcategeory($id);
	  //check whether the wallpaper is root	
	if($isroot)
	{
		//fetch all sub categeories
	    $query1 = $this->gallery_model->subcat($id);
	    foreach ($query1->result() as $item1):	
        //fetch and delete all images in each and every sub wallpaper
        $query2 = $this->gallery_model->image_view($item1->id); 		 
	  	  foreach ($query2->result() as $item2):	
	    $this->gallery_model->deleteimage($item2->id);
		  
	    endforeach;
	    endforeach;
	    //delete all subcategeories
	    $this->gallery_model->deletesubcategeory($id);				  
	 }	
	else{//sub wallpaper
		 //fetch all images
		 $query2 = $this->gallery_model->image_view($item1->id); 		 
         //fetch and delete all images
         foreach ($query2->result() as $item2):	
	     $this->gallery_model->deleteimage($item2->id);
         endforeach;
	  }
	    
	   //delete wallpaper	
	   $this->gallery_model->deletecategeory($id);
	  
	  
    }//else
    redirect('admin/gallery/categeoryview/'.$parentid);
	}
    //display info of image in edit form
 	 function imageedit()
	{
		$data['img'] = $this->gallery_model->imageedit($this->uri->segment(4));
		$this->load->view('admin/gallery_image-edit',$data);
	}
	//edit image in database
	function editImage()
	{   
		  $id = $this->input->post('id');
		  $parentid = $this->input->post('parentid'); 
		  $title = $this->input->post('title');
		  $this->gallery_model->editimage($id,$title);
		  redirect('admin/gallery/image_view/'.$parentid);
		   
	}
	//delete image from database
	function deleteimage()
	{  		
		if (isset($_POST['remove']) && $_POST['remove']=='remove selected')
	 {//get the values 
 	  $id1 = array();
 	  $id1 = $_POST['removeid'];
 	  $parentid = $_POST['parentid'];
 	  if (count($id1) > 0)
 	  { //fetch each and every one check box item
    	 foreach ($id1 as $id)
    	 {
    	    
		
 		unlink('./assets/gallery/image'.$id.'.jpg');
 		unlink('./assets/gallery/image'.$id.'_thumb.jpg');
 		$this->db->where('id',$id);
 		$this->db->delete('gallery_images');

    	 	
    	 }
 	    
	 }
	 }
	 else{
	 	
		$id = $this->uri->segment(4);
		$parentid = $this->uri->segment(5);
 		
 		unlink('./assets/gallery/image'.$id.'.jpg');
 		unlink('./assets/gallery/image'.$id.'_thumb.jpg');
 		$this->db->where('id',$id);
 		$this->db->delete('gallery_images');
		
	   }
	redirect('admin/gallery/image_view/'.$parentid);
	}
	
 }
?>
