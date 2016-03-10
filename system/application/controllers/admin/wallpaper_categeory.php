<?php
  class Wallpaper_categeory extends Controller {
  	  var $layout = 'admin';
	function Wallpaper_categeory(){
		
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		parent::Controller();
		$this->load->model('admin/wallpaper_model');
		$this->load->helper(array('form','url','file'));
		//if not logged in go to login page
	   $this->Login_Model->login_validate();
	}
    //displaying root categeories from database	
   function Categeory1()
	{  	 
	   $parentid=0;	    
       $data['options'] =$this->wallpaper_model->Categeory($parentid);
       $this->load->view('admin/wallpaper_admin_categeory',$data);
	}
	//displaying categeories for adding images
	function root_forimages()
	{
	   $parentid=0;	
	   $data['options1'] = $this->wallpaper_model->Categeory($parentid);
	   $data['options'] = array(''=>'');
	   $data['parentid']= 0;
       
       if($this->input->post('parentid'))
       {
       $parentid = $this->input->post('parentid');
       $data['options']= $this->wallpaper_model->categeory($this->input->post('parentid'));
       $data['parentid']= $parentid;
       
       }
	   $this->load->view('admin/wallpaper_admin_images',$data);
	}
		//adding categeories
   function addcategeory()
	{ 
	 $this->wallpaper_model->addCategeory($this->input->post('catname'),$this->input->post('parentid'));
     redirect('admin/wallpaper_categeory/categeory1');
    }
	
	//extracting wallpaper info and displaying in edit form for wallpaper
	function catedit()
	{
		$query = $this->wallpaper_model->cat($this->uri->segment(4));
		$data['cat'] = $query->result();
		$this->load->view('admin/wallpaper_edit',$data);
	}
	//adding images into the wallpaper
	function addImage()
	{ 
		$title = array();
		$title =$_POST['title'];
		$parentid= $_POST['parentid1'];
	    $this->db->insert('wallpaper_images',array('title'=>$title, 'parentid'=>$parentid));
 	   $id = $this->db->insert_id();
 	   $this->load->library('image_lib');
 	  for($i=1; $i<=3; $i++)
 	  {
 	  			
 	    $dir =  './assets/wallpapers/';   
	    $config['upload_path'] = $dir;
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '1000';
		$config['max_width']  = '1280';
		$config['max_height']  = '768';
		
		$this->load->library('upload', $config);
	
		if ( ! $this->upload->do_upload('image'.$i))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
			
			$this->load->view('admin/wallpaper_admin_images', $error);
			
			exit;
		}	
		else
		{
		  $upload_data =  $this->upload->data();
	       $filepath = $upload_data['file_name'];
	       rename($dir.$filepath , $dir.'image'.$id.'_size'.$i.'.jpg');	
		}
 	   }//endfor
 	    //for thumbnail in wallpapers page
    		$config['image_library'] = 'gd2';
       		$config['source_image'] = $dir.'/image'.$id.'_size1.jpg';
       		//echo $dir.'/'.$filename;
			$config['create_thumb'] = TRUE;
			$config['maintain_ratio'] = TRUE;
			$config['width'] = 140;
			$config['height'] = 110;
    	
    	      
    		$this->image_lib->initialize($config);
    	
    		if(!$this->image_lib->resize())
    		{
    			$error = array('error' => $this->image_lib->display_errors());
				print_r($error);
							
    		}
	   	  $this->image_lib->clear();
		 
			$image_location = $dir.'/image'.$id.'_size3.jpg';
			$data['current_large_image_width'] = $upload_data['image_width'];
			$data['current_large_image_height'] = $upload_data['image_height'];
			$data['thumb_width'] = '94';
			$data['thumb_height'] = '110';
			$data['upload_success'] = 'yes';
			$data['upload_path'] =$dir;
			$data['large_image_location'] = $image_location;
			$data['id'] = $id;
			$data['url']= 'admin/wallpaper_categeory/crop';
						
			$this->load->view('admin/image_crop', $data);
 	      	  
	//   redirect('admin/wallpaper_categeory/root_forimages');
	}
	function crop()
		{
		$this->load->helper('imagecrop');

		$upload_dir = "./assets/wallpapers"; 				// The directory for the images to be saved in
		$upload_path = $upload_dir."/";				// The path to where the image will be saved
		$thumb_image_prefix = "thumbnail";	
		$large_image_name = $_POST['main_image'];     // New name of the large image (append the timestamp to the filename)
		$thumb_image_name = $thumb_image_prefix.$_POST['main_image_id'];     // New name of the thumbnail image (append the timestamp to the filename)
		$thumb_width = '94';	
	    $thumb_height ='110';		// Width of thumbnail image

		$large_image_location = $large_image_name;
		$thumb_image_location = $upload_path.$thumb_image_name.'.jpg';
		
		 	
			$x1 = $_POST["x1"];
			$y1 = $_POST["y1"];
			$x2 = $_POST["x2"];
			$y2 = $_POST["y2"];
			$w = $_POST["w"];
			$h = $_POST["h"];
			//Scale the image to the thumb_width set above
			$scale = $thumb_width/$w;
			$cropped = resizeThumbnailImage($thumb_image_location, $large_image_location,$w,$h,$x1,$y1,$scale);
		  redirect('admin/wallpaper_categeory/root_forimages');
	}
  
	
	//displaying categeories and sub categeories
	function categeoryview()
    {
    	//pagination
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
   $this->paginationnew->filePath = base_url().'admin/wallpaper/categeoryview/'.$this->uri->segment(4);
   $this->paginationnew->select_what = '*';
   $this->paginationnew->the_table = 'wallpaper_categeory';
   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by update_date desc';
        
   $data['query'] = $this->paginationnew->getQuery(TRUE);
   $data['paginate'] = $this->paginationnew->paginate(); 
	  	if($this->uri->segment(4,0)!=0)
	{
		//if it is subwallpaper
	   $data['sub']='yes';
	}
       $this->load->view('admin/wallpaper_categeory-view',$data);
		
	}
	//view all images for the specified wallpaper
    function image_view()
    {
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
   $this->paginationnew->filePath = base_url().'admin/wallpaper_categeory/image_view/'.$this->uri->segment(4);
   $this->paginationnew->select_what = '*';
   $this->paginationnew->the_table = 'wallpaper_images';
   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by id desc';
        
    	$data['query'] = $this->paginationnew->getQuery(TRUE);
   $data['paginate'] = $this->paginationnew->paginate(); 
    	$this->load->view('admin/wallpaper_image-view',$data);
    	
    	 
     }
    //edit wallpaper info in database 
	function editcategeory()
	{  
		 $parentid = $this->input->post('parentid');
		 $id = $this->input->post('id');
		 $catname = $this->input->post('catname');
		 $this->wallpaper_model->editcategeory($id,$catname);
		 redirect('admin/wallpaper_categeory/categeoryview/'.$parentid);
	}	 


	//delete wallpaper from database	
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
        $isroot = $this->wallpaper_model->isrootcategeory($id);
	    //check whether the wallpaper is root	
	   if($isroot)
	  {
		//fetch all sub categeories
	    $query1 = $this->wallpaper_model->subcat($id);
	    foreach ($query1->result() as $item1):	
        //fetch and delete all images in each and every sub wallpaper
        $query2 = $this->wallpaper_model->image_view($item1->id); 		 
	  	  foreach ($query2->result() as $item2):	
	    $this->wallpaper_model->deleteimage($item2->id);
		  
	    endforeach;
	    endforeach;
	    //delete all subcategeories
	    $this->wallpaper_model->deletesubcategeory($id);				  
	 }	
	else{//sub wcategeory
		 //fetch all images
		
		 $query2 = $this->wallpaper_model->image_view($id); 		 
         //fetch and delete all images
         foreach ($query2->result() as $item2):	
	     $this->wallpaper_model->deleteimage($item2->id);
         endforeach;
	    }
	    
	   //delete wallpaper	
	   $this->wallpaper_model->deletecategeory($id);
  	  }//foreach
 	  }//if
   }//if

   else{		
		
		$id = $this->uri->segment(4);
		
		$parentid = $this->uri->segment(5);
	    $isroot = $this->wallpaper_model->isrootcategeory($id);
	  //check whether the wallpaper is root	
	if($isroot)
	{
		//fetch all sub categeories
	    $query1 = $this->wallpaper_model->subcat($id);
	    foreach ($query1->result() as $item1):	
        //fetch and delete all images in each and every sub wallpaper
        $query2 = $this->wallpaper_model->image_view($item1->id); 		 
	  	  foreach ($query2->result() as $item2):	
	    $this->wallpaper_model->deleteimage($item2->id);
		  
	    endforeach;
	    endforeach;
	    //delete all subcategeories
	    $this->wallpaper_model->deletesubcategeory($id);				  
	 }	
	else{//sub wallpaper
		 //fetch all images
		 $query2 = $this->wallpaper_model->image_view($item1->id); 		 
         //fetch and delete all images
         foreach ($query2->result() as $item2):	
	     $this->wallpaper_model->deleteimage($item2->id);
         endforeach;
	  }
	    
	   //delete wallpaper	
	   $this->wallpaper_model->deletecategeory($id);
	  
	  
    }//else
    redirect('admin/wallpaper_categeory/categeoryview/'.$parentid);
	}
    //display info of image in edit form
 	 function imageedit()
	{
		$data['img'] = $this->wallpaper_model->imageedit($this->uri->segment(4));
		$this->load->view('admin/wallpaper_image-edit',$data);
	}
	//edit image in database
	function editImage()
	{   
		  $id = $this->input->post('id');
		  $parentid = $this->input->post('parentid');
		  $title = $this->input->post('title');
		  $this->wallpaper_model->editimage($id,$title);
		  redirect('admin/wallpaper_categeory/image_view/'.$parentid);
		  
		   
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
    	 	$this->wallpaper_model->deleteimage($id);
    	 	
    	 }
 	    
	 }
	 }
	 else{
	 	
		$id = $this->uri->segment(4);
		$parentid = $this->uri->segment(5);
		$this->wallpaper_model->deleteimage($id);
		
	   }
	   unlink('./assets/wallpapers/image'.$id.'_size1.jpg');
 		unlink('./assets/wallpapers/image'.$id.'_size2.jpg');
 		unlink('./assets/wallpapers/image'.$id.'_size3.jpg');
 		unlink('./assets/wallpapers/image'.$id.'_size1_thumb.jpg');
 		unlink('./assets/wallpapers/thumbnail'.$id.'.jpg');
	redirect('admin/wallpaper_categeory/image_view/'.$parentid);
	}
	
}
?>
