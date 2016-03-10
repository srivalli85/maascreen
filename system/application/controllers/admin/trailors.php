<?php
class Trailors extends Controller {
	var $layout = 'admin';
		function Trailors()
		{
		header("cache-Control: no-store, no-cache, must-revalidate");
        header("cache-Control: post-check=0, pre-check=0", false);
        // HTTP/1.0
        header("Pragma: no-cache");
        // Date in the past
        header("Expires: Mon, 20 Jun 2009 05:00:00 GMT");
        // always modified
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");	
		 parent::Controller();
		$this->load->model('admin/Trailors_Model');
		$this->base_uri = base_url()."admin/trailor_view";
		//if not logged in go to login page
	   	$this->Login_Model->login_validate();
		$this->load->helper('form');
		$this->load->helper('file');
		}
		function index()
			{
				$result=$this->Trailors_Model->select();
				foreach ($result as $res )
				{
					$options[$res->id] = $res->movie_name;
				}
				$data=array('url'=>$this->base_uri,
							'options'=>$options);
				$this->load->view('/admin/trailor_view',$data);
			}	
		function insert()
			{
					
			$dir = './assets/trailors';
			$max_width =600;
			$movie=$this->input->post('movie');
			$movietime=$this->input->post('movietime');
			$trailor_name=$this->input->post('mtrailor_name');
			$ondate=$this->input->post('ondate');
			$active=$this->input->post('active');
			$values=array('movie_id'=>$movie,
						  'time_sec'=>$movietime,
						  'trailor_name'=>$trailor_name,
						  'on_date'=>$ondate,
						  'active'=>$active);
				$this->db->set($values);
				$result=$this->db->insert('trailors'); 
				$id=$this->db->insert_id();	
			
		    $config['upload_path'] = $dir;
			$config['allowed_types'] = 'flv';
			$config['max_size']	= '90000000';
			$config['max_width']  = '1024';
			$config['max_height']  = '768';
			if($result==1)
			{
				$this->load->library('upload',$config);
			}
			if ( ! $this->upload->do_upload('trailor'))
				{
					$this->db->where('t_id',$id);
					$this->db->delete('trailors');
					$error = array('error' => $this->upload->display_errors());
					echo "hh";
					print_r($error);
				}else{
				$config1=array();			
				$config1['upload_path'] = $dir.'/preview_image';
				$config1['allowed_types'] = 'gif|jpg|png';
				$config1['max_size']	= '1000';
				$config1['max_width']  = '1024';
				$config1['max_height']  = '768';
			
				$data = array('upload_data' =>$this->upload->data());
				$this->upload->initialize($config1);
					if ( ! $this->upload->do_upload('pre_image'))
					{
	
						$error = array('error' => $this->upload->display_errors());
						print_r($error);
				  	}else{
				  		$upload_data = array('upload_data' =>$this->upload->data());
						$value=$this->Trailors_Model->rename($id,$data,$upload_data);
				   //$this->upload->initialize($config1);
	  		  $filepath = $upload_data['upload_data']['file_name'];
	  		  $dir='./assets/trailors/preview_image/';
			//$value=$this->Trailors_Model->rename($id,$data,$data1);
			
				$preview_image_path = $config1['upload_path'].'/';
				$filename = 'trai_imge'.$id.'.jpg';
				echo $dir.$filename;
	  			$config2['image_library'] = 'gd2';
				$config2['source_image'] =$dir.$filename;
				$config2['create_thumb'] = TRUE;
				$config2['maintain_ratio'] = TRUE;
				$config2['width'] = 215;
				$config2['height'] = 124;
			    $this->load->library('image_lib');      
    			$this->image_lib->initialize($config2);
    
    			if(!$this->image_lib->resize())
    			{
    				$error = array('error' => $this->image_lib->display_errors());
    				print_r($error);
    			}
    			
			
				$width = $upload_data['upload_data']['image_width'];
				$height= $upload_data['upload_data']['image_height'];
			  if ($width > $max_width){
					$scale = $max_width/$width;
				}else{
					$scale = 1;
				}
				echo $scale;
		    $newImageWidth = ceil($width * $scale);
			$newImageHeight = ceil($height * $scale);
			
			$config=array();
			$config['image_library'] = 'gd2';
			$config['source_image'] = $dir.$filename;
			$config['width'] = $newImageWidth;
			$config['height'] = $newImageHeight;	
			$config['create_thumb'] = FALSE;
			$config['maintain_ratio'] = TRUE;
			
			$this->image_lib->initialize($config);
			if(!$this->image_lib->resize())
			{
				$error = array('error' => $this->image_lib->display_errors());
				print_r($error);
			}
			else {
				$data=array();
				$data['current_large_image_width'] = $newImageWidth;
				$data['current_large_image_height'] = $newImageHeight;	
				$data['thumb_width'] = '94';
				$data['thumb_height'] = '110';
				$data['upload_success'] = 'yes';
				$data['upload_path'] =$dir;
				$data['large_image_location'] = $dir.'trai_imge'.$id.'.jpg';
				$data['id'] = $id;
				$data['url'] = 'admin/trailors/crop';
				$this->load->view('admin/image_crop',$data);
			}
		 	}
	}
				
	}
	function crop()
	{
		$this->load->helper('imagecrop');

		$upload_dir = "./assets/trailors/preview_image";				// The directory for the images to be saved in
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
			redirect('admin/trailors');
	}
		function select()
		{
			$movies=$this->Trailors_Model->select();
			$data=array('movies'=>$movies);
			$this->load->view('/admin/edit_trailors',$data);
		}
		function trailors_details()
		{
			$id=$this->uri->segment(4);
			$details=$this->Trailors_Model->get_trailors($id);
			$data=array('details'=>$details);
			$this->load->view('/admin/trailors_change',$data);
		}
		function edit(){
			$id=$this->uri->segment(4);
			$details=$this->Trailors_Model->get_trailors($id);
			$data=array('details'=>$details);
			$this->load->view('/admin/trailors_editpage',$data);
		}
		function delete(){
			$id=$this->uri->segment(4);
			$result=$this->Trailors_Model->delete($id);
			redirect(base_url().'admin/trailors/trailors_details');
		}
	
}
?>