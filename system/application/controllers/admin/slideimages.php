<?php
class Slideimages extends Controller {
	var $layout = 'admin';
	var $base_uri = '';
	function Slideimages()
	{
		parent::Controller();
		$this->load->model('Slideimages_model');
	}
	function index()
	{	
		$data['query']= $this->Slideimages_model->show(array('main','sub'));
		$this->load->view('admin/slideimageview',$data);
		
	}
	function add()
	{
		if($this->input->post('mysubmit'))
		{
		 $this->load->library('upload');
		 $title=$this->input->post('title');
		 $link=$this->input->post('link');
		 $type = $this->input->post('type');
		// print_r($_FILES);
	    	 //   print_r($_POST);
		$this->db->insert('slideimages',array('title'=>$title,'link'=>$link,'type'=>$type));
 		
 	    $id = $this->db->insert_id();
 	    $dir =  './assets/slideimages';   
	    $config['upload_path'] = $dir;
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '1000';
    	$config['max_width']  = '1024';
    	$config['max_height']  = '1024';
		
		$this->upload->initialize($config);
	
		if (!$this->upload->do_upload('image'))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
		}	
		else
		{
		   $upload_data =  $this->upload->data();
	       $filepath = $upload_data['file_name'];
	       rename($dir.'/'.$filepath , $dir.'/image'.$id.'.jpg');
	       if($type =='main')
	       {
	       	$thumb_width='343';
	       	$thumb_height='205';
	       	$data['thumbnail_prefix'] ="image_";
	       }
	       else {
	       		$thumb_width='99';
	       	$thumb_height='96';
	       	$data['thumbnail_prefix'] ="thumbnail_";
	       	
	       }
	      
	       $data['current_large_image_width'] = $upload_data['image_width'];
			$data['current_large_image_height'] = $upload_data['image_height'];
			$data['thumb_width'] = $thumb_width;
			$data['thumb_height'] = $thumb_height;
			
			$data['upload_success'] = 'yes';
			$data['upload_path'] =$dir;
			$data['large_image_location'] = $dir.'/image'. $id.'.jpg';
			$data['id'] =  $id;
			$data['url'] = 'admin/slideimages/crop';
		 }
	 	$this->load->view('admin/image_crop_two',$data);
		}
		
		else {
		$this->load->view('admin/addslideimage');
		}
	}
	function crop()
	{
		$this->load->helper('imagecrop');

		$upload_dir = "./assets/slideimages"; 				// The directory for the images to be saved in
		$upload_path = $upload_dir."/";				// The path to where the image will be saved
		//$large_image_prefix = "resize_"; 			// The prefix name to large image
		$thumb_image_prefix = $_POST['tp'];		// The prefix name to the thumb image
		$large_image_name = $_POST['main_image'];     // New name of the large image (append the timestamp to the filename)
		$thumb_image_name = $thumb_image_prefix.$_POST['main_image_id'];     // New name of the thumbnail image (append the timestamp to the filename)
		$thumb_width = $_POST['tw'];						// Width of thumbnail image
		$thumb_height = $_POST['th'];						// Height of thumbnail image

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
			
			if($_POST['tw'] ==343)
			{
		    $data['current_large_image_width'] = $_POST["lw"];
			$data['current_large_image_height'] = $_POST["lh"];
			$data['thumb_width'] = '75';
			$data['thumb_height'] = '77';
			$data['thumbnail_prefix'] ="thumbnail_";
			$data['upload_success'] = 'yes';
			$data['upload_path'] =$upload_path;
			$data['large_image_location'] = $large_image_location;
			$data['id'] =  $_POST['main_image_id'];
			$data['url'] = 'admin/slideimages/crop';
		    
	 	$this->load->view('admin/image_crop_two',$data);
			}	
			
			else
			{
				$this->load->view('admin/addslideimage');
			}
	}
	function delete()
	{
		$id = $this->uri->segment(4);
		$this->Slideimages_model->delete($id);
		unlink('./assets/slideimages/image'.$id.'.jpg');
    	if(file_exists('./assets/slideimages/image_'.$id.'.jpg'))
    	{
    	 unlink('./assets/slideimages/image_'.$id.'.jpg');
    	}
    	unlink('./assets/slideimages/thumbnail_'.$id.'.jpg');
		redirect(base_url()."admin/slideimages");
	}   
}
?>