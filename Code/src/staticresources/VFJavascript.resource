function myFun(){
          alert('function calling.');
          //var nm = document.getElementById('j_id0:frm:pb:pbs:pbsi:name');
          var nm = document.getElementById('{!$Component.frm.pb.pbs.pbsi.name}');
          
          alert('Name entered is:'+nm.value);
      }
      function afterCOmplete(){
          alert('Process completed...');
          var nm = document.getElementById('msg');
          //alert('HTML is:'+nm);
          nm.innerHTML='Thanks for using javascript';
          
      }
