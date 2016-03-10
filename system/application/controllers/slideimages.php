<? class Slideimages extends Controller {
	function Slideimages()
	{
		parent::Controller();
	}
	function get_slide_images()
	{
		//$this->load->library('MAA_home');
		//$output = $this->MAA_home->flash_block();
	    $this->load->model('Slideimages_model');
			$slideimagequery = $this->Slideimages_model->show(array('main'));
		$slides = $slideimagequery->result();

				$output ="<result>";
   $i=1;
  foreach($slides as $item)
  {
  $output.="<item position='$i'><id>".$item->id."</id>";
  $output.= "<title>".$item->title."</title>";
  $output.= "<link>http://www.maascreen.com/".$item->link."</link></item>";
  $i++;
   }
  $output.="</result>";
    print $output;
	}
  function get_slide_images_sub()
	{
		//$this->load->library('MAA_home');
		//$output = $this->MAA_home->flash_block();
	    $this->load->model('Slideimages_model');
		$slideimagequery = $this->Slideimages_model->show(array('sub'));
		$slides = $slideimagequery->result();
    	$output ="<result>";
   $i=1;
  foreach($slides as $item)
  {
  $output.="<item position='$i'><id>".$item->id."</id>";
  $output.= "<title>".$item->title."</title>";
  $output.= "<link>http://www.maascreen.com/".$item->link."</link></item>";
  $i++;
   }
  $output.="</result>";
    print $output;
	}
 }