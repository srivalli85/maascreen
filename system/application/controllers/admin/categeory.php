<?php
  class Categeory extends Controller {
  	  var $layout = 'admin';
	function Categeory(){
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");		
		parent::Controller();
		$this->load->model('admin/categeory_model');
		$this->load->helper(array('form','url','file'));
		//if not logged in go to login page
	   $this->Login_Model->login_validate();
	}
    //displaying root categeories from database	
   function Categeory1()
	{  	 
	   $parentid=0;	    
       $data['options'] =$this->categeory_model->Categeory($parentid);
       $this->load->view('admin/admin_categeory',$data);
	}
	//displaying categeories for adding images
	function root_forimages()
	{
	   $parentid=0;	
	   $data['options1'] = $this->categeory_model->Categeory($parentid);
	   $data['options'] = array(''=>'');
	   $data['parentid']= 0;
       
       if($this->input->post('parentid'))
       {
       $parentid = $this->input->post('parentid');
       $data['options']= $this->categeory_model->Categeory($this->input->post('parentid'));
       $data['parentid']= $parentid;
       
       }
	   $this->load->view('admin/admin_images',$data);
	}
		//adding categeories
   function addCategeory()
	{ 
	 
	 $this->categeory_model->addCategeory($this->input->post('catname'),$this->input->post('parentid'));
     redirect('admin/categeory/categeory1');
    }
	
	//extracting categeory info and displaying in edit form for categeory
	function catedit()
	{
		$data['cat'] = $this->categeory_model->cat($this->uri->segment(4));
		$this->load->view('admin/edit',$data);
	}
	
	//adding images into the categeory
	function addImage()
	{ 
		$title = array();
		$title =$_POST['title'];
	    $parentid=$_POST['parentid1'];
	    $max_width = 600;
	    $i=0;
 	    $this->load->library('image_lib');
	 	  foreach($title as $item)
	 	  {
	 		$this->db->insert('images',array('title'=>$item, 'parentid'=>$parentid));
	 		
	 	    $id = $this->db->insert_id();
	 	    $dir =  './assets/fun';   
		    $config['upload_path'] = $dir;
			$config['allowed_types'] = 'gif|jpg|png';
			$config['max_size']	= '1000';
	    	$config['max_width']  = '1024';
	    	$config['max_height']  = '1024';
			
			$this->load->library('upload', $config);
		
			if (!$this->upload->do_upload('image'.$i))
			{
				$error = array('error' => $this->upload->display_errors());
				print_r($error);
			}	
			
			else
			{
				$upload_data =  $this->upload->data();
				rename($dir.'/'.$upload_data['file_name'], $dir.'/image'.$id.'.jpg');
				
				$width = $upload_data['image_width'];
				$height= $upload_data['image_height'];
			  if ($width > $max_width){
					$scale = $max_width/$width;
				}else{
					$scale = 1;
				}
			$newImageWidth = ceil($width * $scale);
			$newImageHeight = ceil($height * $scale);
			
			$config=array();
			$config['library'] = 'gd2';
			$config['source_image'] = $dir.'/image'.$id.'.jpg';
			$config['width'] = $newImageWidth;
			$config['height'] = $newImageHeight;
			$config['maintain_ratio'] =TRUE;
			
			$this->image_lib->initialize($config);
			if(!$this->image_lib->resize())
			{
				$this->image_lib->display_errors();
				
			}
			else
			{
			$data['current_large_image_width'] = $newImageWidth;
			$data['current_large_image_height'] = $newImageHeight;
			$data['thumb_width'] = '120';
			$data['thumb_height'] = '85';
			$data['upload_success'] = 'yes';
			$data['upload_path'] =$dir;
			$data['large_image_location'] = $dir.'/image'.$id.'.jpg';
			$data['id'] = $id;
			$data['url']= 'admin/categeory/crop';
						
		    $this->load->view('admin/image_crop', $data);
		    }
			}
	    	$i++;
	      }//endforeach
		  //redirect('admin/categeory/root_forimages');
	}
	function crop()
	{
			$this->load->helper('imagecrop');
			$dir =  './assets/fun';  				// The directory for the images to be saved in
			$upload_path = $dir."/";				// The path to where the image will be saved
			//$large_image_prefix = "resize_"; 			// The prefix name to large image
			$thumb_image_prefix = "thumbnail_";			// The prefix name to the thumb image
			$large_image_name = $_POST['main_image'];     // New name of the large image (append the timestamp to the filename)
			$thumb_image_name = $thumb_image_prefix.$_POST['main_image_id'];     // New name of the thumbnail image (append the timestamp to the filename)
			$thumb_width = "120";						// Width of thumbnail image
			$thumb_height = "85";						// Height of thumbnail image
	
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
				resizeThumbnailImage($thumb_image_location, $large_image_location,$w,$h,$x1,$y1,$scale);
				redirect('admin/categeory/root_forimages');
	}
	//displaying categeories and sub categeories
	function categeoryview()
    {
    	//pagination
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
	   $this->paginationnew->filePath = base_url().'admin/categeory/categeoryview/'.$this->uri->segment(4);
	   $this->paginationnew->select_what = '*';
	   $this->paginationnew->the_table = 'categeory';
	   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by update_date desc';
	        
	   $data['query'] = $this->paginationnew->getQuery(TRUE);
	   $data['paginate'] = $this->paginationnew->paginate(); 
		  	if($this->uri->segment(4,0)!=0)
		{
			//if it is subcategeory
		   $data['sub']='yes';
		}
	       $this->load->view('admin/categeory-view',$data);
		
	}
	//view all images for the specified categeory
    function image_view()
    {
    	$parentid = $this->uri->segment(4);
    	$this->load->library('paginationnew');
    	$this->paginationnew->start = ($this->uri->segment(5)) ? $this->uri->segment(5) : '0';
    	$this->paginationnew->limit =10;
   $this->paginationnew->filePath = base_url().'admin/categeory/image_view/'.$this->uri->segment(4);
   $this->paginationnew->select_what = '*';
   $this->paginationnew->the_table = 'images';
   $this->paginationnew->add_query = 'WHERE parentid = '.$parentid.' order by id desc';
        
      $data['query'] = $this->paginationnew->getQuery(TRUE);
      $data['paginate'] = $this->paginationnew->paginate(); 
       $this->load->view('admin/image-view',$data);
     }
    //edit categeory info in database 
	function editcategeory()
	{   
		 $id = $this->input->post('id');
		 $parentid = $this->input->post('parentid');
		 $catname = $this->input->post('catname');
		 $this->categeory_model->editcategeory($id,$catname);
		 redirect('admin/categeory/categeoryview/'.$parentid );
	}	   
	//delete categeory from database
	function deletecategeory()
	{
      //if check boxes are selected for deleting
	 if (isset($_POST['remove']) && $_POST['remove']=='remove selected')
	 {//get the values 
 	  $removeid = array();
 	  $removeid = $_POST['removeid'];
 	  $parentid = $_POST['parentid'];
 	  
 	  
 	  //if no of check boxes selected > 0
 	 if (count($removeid) > 0)
 	  { //fetch each and every one check box item
 	  	
    	 foreach ($removeid as $id)
   	    {
        $isroot = $this->categeory_model->isrootcategeory($id);
	    //check whether the categeory is root	
	     if($isroot)
	    {
	  	//fetch all sub categeories
	    $query1 = $this->categeory_model->subcat($id);
	    foreach ($query1->result() as $item):	
          $this->deletesubcategeory($item->id);
	    endforeach;
	    //delete all subcategeories
	    $this->categeory_model->deletesubcategeory($id);				  
	    }	
	    else{
	     $this->deletesubcategeory($id);
         }
	    //delete categeory	
	    $this->categeory_model->deletecategeory($id);
  	   }//foreach
 	  }//if
     }//if

     else{		
		
		$id = $this->uri->segment(4);
		$parentid = $this->uri->segment(5);
	    $isroot = $this->categeory_model->isrootcategeory($id);
	  //check whether the categeory is root	
	 if($isroot)
	 {
		//fetch all sub categeories
	    $query1 = $this->categeory_model->subcat($id);
	    foreach ($query1->result() as $item):	
         $this->deletesubcategeory($item->id);
	    endforeach;
	    //delete all subcategeories
	    $this->categeory_model->deletesubcategeory($id);		  
	  }	
	 else{//sub categeory
		 $this->deletesubcategeory($id);
	  }
	  $this->categeory_model->deletecategeory($id);
     }
      redirect('admin/categeory/categeoryview/'.$parentid);
	}
	function deletesubcategeory($id)
	{
		 $query2 = $this->categeory_model->getImages($id);	 
         //fetch and delete all images
        $res = $query2->result_array();
        $keys='';
        
        foreach($res as $item)
        {
        	$keys.= "'$item[id]',";
        	unlink('./assets/fun/image'.$item['id'].'.jpg');
 		    unlink('./assets/fun/thumbnail_'.$item['id'].'.jpg');
        }
       if($keys!=''){
       $keys_mod = substr($keys,0, strlen($keys)-1);
       
        $this->categeory_model->deleteImages($keys_mod);
        }
	  
	   $this->categeory_model->deletecategeory($id);
	  
	  
	}
    //display info of image in edit form
 	 function imageedit()
	{
		$data['img'] = $this->categeory_model->imageedit($this->uri->segment(4));
		
		$this->load->view('admin/image-edit',$data);
	}
	//edit image in database
	function editImage()
	{   
		  $id = $this->input->post('id');
		  $title = $this->input->post('title');
		  $parentid = $this->input->post('parentid');
		  $this->categeory_model->editimage($id,$title);
		  redirect('admin/categeory/image_view/'.$parentid);
		   
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
    	 	$this->categeory_model->deleteimage($id);
    	 	unlink('./assets/fun/image'.$id.'.jpg');
 		    unlink('./assets/fun/thumbnail_'.$id.'.jpg');
    	 }
	  }
	 }
	 else{
	 	
		$id = $this->uri->segment(4);
		$parentid = $this->uri->segment(5);
		$this->categeory_model->deleteimage($id);
		unlink('./assets/fun/image'.$id.'.jpg');
 	    unlink('./assets/fun/thumbnail_'.$id.'.jpg');
	   }
	redirect('admin/categeory/image_view/'.$parentid);
	}
	
}
?>
