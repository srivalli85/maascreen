function validate()
{
//alert("hello");
  catname = document.getElementById('id').value;
  if(catname == '')
  {
   document.getElementById('display').innerHTML = "enter categeory name";
   return false;
  }
  else{
   return true;
  }
}
function focusthis(divid)
{
 document.getElementById(divid).innerHTML='';
}


function fun()
{ var i;
  for(i=1;i<=10;i++)
 {
    var sn = 'c'+i;

    document.getElementById(sn).checked= true;
   // document.getElementById('c2').checked='true';
    
  }
}
function fun1()
{ var i;
  for(i=1;i<=10;i++)
 {
    var sn = 'c'+i;

    document.getElementById(sn).checked=false;
   
    
  }
}

