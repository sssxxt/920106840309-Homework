<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<script language="javascript">
 	var schoolArray = new Array();
  	schoolArray[schoolArray.length] = new Array("1","计算机院");
  	schoolArray[schoolArray.length] = new Array("2","电光院");
  	schoolArray[schoolArray.length] = new Array("3","化院");
 	var departmentArray = new Array();
 	departmentArray[departmentArray.length]=new Array("1","1","计算机科学与技术");
 	departmentArray[departmentArray.length]=new Array("1","2","软件工程");
 	departmentArray[departmentArray.length]=new Array("1","3","人工智能");
 	departmentArray[departmentArray.length]=new Array("2","4","通信工程");
 	departmentArray[departmentArray.length]=new Array("2","5","电子工程");
 	departmentArray[departmentArray.length]=new Array("2","6","光学工程");
 	departmentArray[departmentArray.length]=new Array("2","7","光电技术");
 	departmentArray[departmentArray.length]=new Array("2","8","探测与控制工程");
 	departmentArray[departmentArray.length]=new Array("3","9","制药与精细化工");
 	departmentArray[departmentArray.length]=new Array("3","10","应用化学");
 	departmentArray[departmentArray.length]=new Array("3","11","化学工程");
 	departmentArray[departmentArray.length]=new Array("3","12","化学");
 	departmentArray[departmentArray.length]=new Array("3","13","非金属材料科学与工程");
 	departmentArray[departmentArray.length]=new Array("3","14","安全工程");
 	function setDepartment(id1, id2){
   		var school = document.getElementById(id1);
        var department = document.getElementById(id2);
        var i;
        var itemArray = null;
        if(school.value.length > 0){
       		itemArray = new Array();
            for(i=0; i<departmentArray.length; i++){
            	if(departmentArray[i][0] == school.value){
                    itemArray[itemArray.length]=new Array(departmentArray[i][1],departmentArray[i][2]);
                }
             }
        }
        for(i = department.options.length ; i >= 0 ; i--){
        	department.options[i] = null;
        }
        department.options[0] = new Option("--请选择系别--");
        department.options[0].value = "";
  		if(itemArray != null){
         	for(i = 0 ; i < itemArray.length; i++){
         		department.options[i+1] = new Option(itemArray[i][1]);
                if(itemArray[i][0] != null){
                	department.options[i].value = itemArray[i][0];
                }
         	}
        }
   } 
</script>
<body>
<br><br><br>
<form action="LoginController" method="post">
<table align="center" valign="middle">
	<tr height="50"> 
		<td width="80" align="right">用&emsp;&emsp;户：</td>
		<td width="80"><input type="text" name="uname"/></td>
	</tr>
	<tr height="50"> 
		<td width="80" align="right">密&emsp;&emsp;码：</td>
		<td width="80"><input type="password" name="upwd"/></td>
	</tr>
	<tr height="50"> 
		<td width="80" align="right">验&emsp;证&emsp;码：</td>
		<td width="80"><input type="text" name="checkcode" style="width:80px"/>&emsp;&emsp;
		<input type="hidden" name="checkword" id="checkword">
		<script>
			var chars = new Array("q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m",
						"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
						"0","1","2","3","4","5","6","7","8","9");
			var checkword = "";
			for(i=0;i<4;i++){
				var n = Math.floor(Math.random()*62);
				checkword += chars[n];
			}
			//session.setAttribute("checkword",checkword);
			document.getElementById("checkword").value = checkword;  // 将JS变量值存储到隐藏控件中
			document.write(checkword);
		</script>
        </td>
	</tr>
	<tr height="50">
		<td width="80" align="right" style="font-size:15px"><strong>所在学院：</strong></td>
		<td><select name="school" id="id1" onChange="setDepartment('id1', 'id2')">
  		<option value="">--请选择学院--</option>
  		<option value="1">计算机院</option>
  		<option value="2">电光院</option>
  		<option value="3">化院</option>
		</select></td>	
	</tr>
	<tr height="50">
		<td width="80" align="right" style="font-size:15px"><strong>所在系：</strong></td>
		<td><select name="department" id="id2">
		<option value="">--请选择系别--</option>
		</select></td>	
	</tr>
	<tr height="50"> 
		<td width="80" align="right"><input type="submit" value="登录" name="submit"/></td>
	</tr>
</table>
</form>
</body>
</html>