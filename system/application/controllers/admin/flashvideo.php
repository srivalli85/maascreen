<?php
class Flashvideo extends Controller {
	var $layout = 'admin';
	function FlashVideo()
	{
		
		parent::Controller();
		$this->Login_Model->login_validate();
		$this->load->model('admin/Video_model');
		$this->base_uri = base_url().$this->uri->segment(1).$this->uri->slash_segment(2,'leading');
	}
	function index()
	{
		$catid =$this->uri->segment(5);
		$id=$this->uri->segment(4);
		$this->load->library('flash_video');
		$config['id'] = 'n0';
		$config['autostart'] = 'true';
		$config['height'] = '280';
		$config['width']  = '400';
		$config['file'] = 'http://youtube.com/watch%3Fv%3DDdR41fe9Zeg';//file full path
		$config['skin'] = 'swift'; 
		$config['previewimage']	='http://localhost/maascreen/assets/videos/image_preview/image'.$id.'.jpg';
		$this->flash_video->initialize($config);
		$jslinks = $this->flash_video->getcode();
		$data = array('videoplayer' => $jslinks, 'catid'=>$catid );
		$this->load->view('admin/player',$data);
	}
	
	function addcategeory()
	{   if (isset($_POST['submit']))
	      {
		   $this->Video_model->addcategeory();
	      }
		$this->load->view('admin/addvideocategeory');
	}
	function addvideo()
	{
		$max_width=600;//preview image width
		if(isset($_POST['submit']))
		{
		 $i =  $this->Video_model->addvideo();
		 
		 //upload video
		//uploading video
		$this->load->library('upload');
		$dir =  './assets/videos';   
	    $config['upload_path'] = $dir;
		$config['allowed_types'] = 'flv';
		$config['max_size']	= '90000000';
    	$config['max_width']  = '1024';
    	$config['max_height']  = '768';
		
		$this->upload->initialize($config);
	
		if (!$this->upload->do_upload('video'))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
		}	
		else
		{
		   $data2 = array('upload_data' => $this->upload->data());
	       $filepath = $data2['upload_data']['file_name'];
	       rename($dir.'/'.$filepath , $dir.'/video'.$i.'.flv');
	       $this->db->where('id',$i);
	       $this->db->update('videos',array('videouploaded'=>'1'));	
		
		//uploading image
		$dir1 =  './assets/videos/image_preview';   
	    $config1['upload_path'] = $dir1;
		$config1['allowed_types'] = 'gif|jpg|png|bmp';
		$config1['max_size']	= '90000000';
    	//$config['max_width']  = '1024';
    	//$config['max_height']  = '768';
		
		$this->upload->initialize($config1);
	
		if (!$this->upload->do_upload('image'))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
			
			//$this->load->view('admin_images', $error);
		}	
		else
		{
		   $upload_data =  $this->upload->data();
	       $filepath = $upload_data['file_name'];
	       rename($dir1.'/'.$filepath , $dir1.'/image'.$i.'.jpg');	
	       
		$width = $upload_data['image_width'];
			$height= $upload_data['image_height'];
		  if ($width > $max_width){
				$scale = $max_width/$width;
			}else{
				$scale = 1;
			}
			$newImageWidth = ceil($width * $scale);
		    $newImageHeight = ceil($height * $scale);
		$this->load->library('image_lib');
		//$config3=array();
		$config3['image_library'] = 'gd2';
		$config3['source_image'] = $dir1.'/image'.$i.'.jpg';
		$config3['maintain_ratio'] =TRUE;
		$config3['width'] = $newImageWidth;
		$config3['height'] = $newImageHeight;	
		
		
		$this->image_lib->initialize($config3);
		if(!$this->image_lib->resize())
		{
            $error = array('error' => $this->image_lib->display_errors());
			print_r($error);			
		}
		else {
 
	
    	
    	$filename = 'image'.$i.'.jpg';
    	
    	$config2['image_library'] = 'gd2';
        $config2['source_image'] = $dir1.'/'.$filename;
          $config2['new_image'] = $dir1.'/image'.$i.'_thumb.jpg';
		$config2['width'] = 150;
		$config2['height'] = 110;
		$config2['create_thumb'] = TRUE;
		$config2['maintain_ratio'] = TRUE;
    	
    		$this->image_lib->initialize($config2);      
    	
    	if(!$this->image_lib->resize())
    	{
    		$error = array('error' => $this->image_lib->display_errors());
			print_r($error);
    	}
    	else {
    	
		
			$data['current_large_image_width'] = $newImageWidth;
			$data['current_large_image_height'] = $newImageHeight;
			$data['thumb_width'] = '94';
			$data['thumb_height'] = '110';
			$data['upload_success'] = 'yes';
			$data['upload_path'] =$dir;
			$data['large_image_location'] = $dir.'/image_preview/image'.$i.'.jpg';
			$data['id'] = $i;
			$data['url'] = 'admin/flashvideo/crop';
						
			$this->load->view('admin/image_crop', $data);
		}
    		
    	}
    	
    	
		}
		 
		}
		 
		}
	       
   else {
   		$options = array();
		$x =$this->Video_model->getvideocategeories();
		foreach($x as $item)
		{
		 $options[$item->id] = $item->name;
		}
		$data['options'] = $options;
		$this->load->view('admin/addvideo',$data);
     }
	}
    function crop()
	{
		$this->load->helper('imagecrop');

		$upload_dir = "./assets/videos/image_preview"; 				// The directory for the images to be saved in
		$upload_path = $upload_dir."/";				// The path to where the image will be saved
		//$large_image_prefix = "resize_"; 			// The prefix name to large image
		$thumb_image_prefix = "thumbnail";			// The prefix name to the thumb image
		$large_image_name = $_POST['main_image'];     // New name of the large image (append the timestamp to the filename)
		$thumb_image_name = $thumb_image_prefix.$_POST['main_image_id'];     // New name of the thumbnail image (append the timestamp to the filename)
		$thumb_width = "94";						// Width of thumbnail image
		$thumb_height = "110";						// Height of thumbnail image

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
					
		$options = array();
		$x =$this->Video_model->getvideocategeories();
		
		foreach($x as $item)
		{
		 $options[$item->id] = $item->name;
		}
		$data['options'] = $options;
		$this->load->view('admin/addvideo',$data);
	}
	function categeories()
	{
		$data['query'] = $this->Video_model->getcategeories();
	    $this->load->view('admin/viewcategeories',$data);
	}
	function videos()
	{
		$id = $this->uri->segment(4);
		$data['query'] = $this->Video_model->getvideos($id,'videos');
		$data['catid']=$id;
	    $this->load->view('admin/viewvideos',$data);
	}
	function deletecategeory()
	{
		$id=$this->uri->segment(4);
		$this->Video_model->deletecategeory($id);
		redirect(base_url().'admin/flashvideo/categeories');
	}
	function editcategeory()
	{
		if (isset($_POST['edit']))
		{
			$this->Video_model->editcategeory();
			$this->categeories();
		}
		else{
			
		
		$id=$this->uri->segment(4);
		$data['details'] = $this->Video_model->getcategeorydetails($id);
		$this->load->view('admin/editvideocategeory',$data);
		}
	}
	function deletevideo()
	{
		
		$id=$this->uri->segment(4);
		$catid= $this->uri->segment(5);
		$this->Video_model->deletevideo($id);
		
		redirect(base_url().'admin/flashvideo/categeories');
	}
	function editvideo()
	{
		if(isset($_POST['edit']))
		{
			$id=$_POST['id'];
			$this->Video_model->editvideo($id);
			$catid= $_POST['video_cat_id'];
		    redirect(base_url().'admin/flashvideo/videos/'.$catid);
		}
		else {
			
			$id=$this->uri->segment(4);
			$data['videos']=$this->Video_model->getvideodetails($id);
			
			$this->load->view('admin/editvideo',$data);
			
		}
		
		
	}
}
?>