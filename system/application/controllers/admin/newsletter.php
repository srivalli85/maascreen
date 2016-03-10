<?php
 class Newsletter extends Controller {
 	
 		var $layout  = 'admin';
 		var $base_uri ="";
		 function Newsletter()
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
				$this->load->model('Newsletter_model');
				$this->base_uri =base_url().$this->uri->slash_segment(1).$this->uri->segment(2);
				//if not logged in go to login page
	   			$this->Login_Model->login_validate();
			}
		 function index()
			{
				echo "Success";
			}
		function subscribers()
			{
				
				$subscribers = $this->Newsletter_model->get_subscribers();
				$data = array(
								'subscribers'	=> $subscribers,
								'base_uri'		=> $this->base_uri,
								'message'		=> $this->session->flashdata('message'),
				);
				
				$this->load->view('admin/subscribers',$data);
			}
		function delete()
		{
			$id=$this->uri->segment(4);
			$this->Newsletter_model->delete($id);
			redirect(base_url().'admin/newsletter/subscribers');
			
		}
		function sendmail()
		{
			if(isset($_POST['submit']))
			{
			$subscribers = $this->Newsletter_model->get_subscribers();
			$countarr = count($subscribers);
			if($countarr > 0)
		  {
			$subscribers1='';
			$i=0;
			 foreach($subscribers as $item)
			 {
			  $subscribers1 .= $item->email;
			  $i++;
			   if($i != $countarr)
			   {
			  	$subscribers1 .=',';	
			   }
			 			
			 } 
		   }
		    $to = "srivalli.ou@gmail.com";
			$subject = $_POST['subject'];
			$message = $_POST['maildescription'];
			$from = "maascreen@gmail.com";
			$headers = "From: $from";
			mail($to,$subject,$message,$headers);
			echo "Mail Sent.";
		   
		   
		   
//		     $this->load->library('email');
//		     $config['protocol'] = 'smtp';
//             $config['mailpath'] = '/usr/sbin/sendmail';
//             $config['charset'] = 'iso-8859-1';
//              $config['wordwrap'] = TRUE;
//
//              $this->email->initialize($config);
//
//			$this->email->from('maascreen@gmail.com', 'Maa Screen');
//			$this->email->to($subscribers1);
//			$this->email->subject($_POST['subject']);
//			$this->email->message($_POST['maildescription']);
//			
//			$this->email->send();
//
//            echo $this->email->print_debugger();
//            
            $data['mail'] = 'true';
			}
            
       
				$this->load->model('admin/Openwysiwyg_Model');
		$textarea[]= array('textarea' => 'description',
						   'skin'	  => 'none');
		$links = $this->Openwysiwyg_Model->setEditor($enable=TRUE,$textarea);
		$data['jslinks'] = $links;
		
			$this->load->view('admin/sendmail',$data);
			
		}
		
 
 }
?>