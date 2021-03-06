<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.boco.xxzx.model.Menu"%>
<%@page import="com.boco.xxzx.model.Dictionary"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dtree.js"></script>
<link href="dtree.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/css.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<title>角色授权</title>
</head>

<script>
	var arrOP = [];
	var opNum = 0;
	var arrData = [];
	var dataNum = 0;
	var ch_text = '';
	var ch_val = '';
	function add_role_pow() {
		var mobj = document.getElementsByName("menuId");
		var mnobj= document.getElementsByName("menuName");
		var arrMenu = [];
		var arrMenuName=[];
		for(k1=0;k1<mobj.length;k1++){
			if(mobj[k1].checked){
				arrMenu.push(mobj[k1].value);
			    arrMenuName.push(mnobj[k1].value);
			}
			}	
		var dobj = document.getElementsByName("dataId");
		var dnobj = document.getElementsByName("dataName");
		var arrData=[];
		var arrDataName=[];
		for(k2=0;k2<dobj.length;k2++){//遍历所有被选中的data
			if(dobj[k2].checked){
				arrData.push(dobj[k2].value);
			    arrDataName.push(dnobj[k2].value);
			}
			}
		for (var j1 = 0; j1 < arrMenu.length; j1++) {//遍历所有被选中的菜单
			for (var j2 = 0; j2 < arrData.length; j2++) {
					var flag=true;
				for (var j3 = 0; j3 < form1.cur_choose.length; j3++) {
					if (form1.cur_choose.options[j3].value==(arrMenu[j1]+'-'+arrData[j2])) {
						flag=false;
					}
				}
				if (flag==true) {		
				form1.cur_choose.options[form1.cur_choose.length] = new Option(arrMenuName[j1]+'['+arrDataName[j2]+']');
				form1.cur_choose.options[form1.cur_choose.length-1].value = arrMenu[j1]+'-'+arrData[j2];	
				}
			}
		}
		
	}
	function remove_role_pow() {
		while (form1.cur_choose.selectedIndex != -1) {
			form1.cur_choose.options.remove(form1.cur_choose.selectedIndex);
		}
	}
	function clear_role_pow() {
		while (form1.cur_choose.length != 0) {
			form1.cur_choose.options.remove(0);
		}
	}
	function check() {
		if (document.form1.cur_choose.length == 0) {
			alert("权限列表不能为空！");
			return false;
		}

		for (i = 0; i < document.form1.cur_choose.length; i++)
			form1.cur_choose.options[i].selected = true;
		 $.ajax({  
 		    type: "POST",  
 		    url:"${pageContext.request.contextPath}/role/authorizeRole.do",
 		    dataType: "text",
 		    data:$('#form1').serialize(),  
 		    async: false,
 		    error: function(XMLHttpRequest, textStatus, errorThrown) {
                 alert(XMLHttpRequest.status);
                 alert(XMLHttpRequest.readyState);
                 alert(textStatus);
             },
 		    success: function(result) {  
 		        alert(result);
 		        window.location.reload();
 		    }  
 		  });
	}
	function checkStatus(no,chkBox){
		checkPar(chkBox);//当子目录选中时,父目录也选中
		var chks = document.getElementsByTagName('input');//得到所有input
		for(var i=0;i <chks.length;i++){
if(chks[i].name == 'menuId'){//得到所名为check的input
if(chks[i].className == no){//ID等于传进父目录ID时
                chks[i].checked = chkBox.checked;//保持选中状态和父目录一致
                checkStatus(chks[i].value,chks[i]);//递归保持所有的子目录选中
                }
}
}
		} 
	function checkPar(chkBox) {
		if(chkBox.name == 'menuId' && chkBox.checked && chkBox.className != 0){//判断本单击为选中,并且不是根目录,则选中父目录
			var chkObject = document.getElementById("ch"+chkBox.className);//得到父目录对象
			chkObject.checked=true;
			checkPar(chkObject);
			}
		} 
</script>

<body class="main_body">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"><div id='KB1Parent' class='parent'>
					<img
						src="${pageContext.request.contextPath}/images/right_sw_1_1.gif"
						width="257" height="25">
				</div></td>
		</tr>
		<tr>
			<td bgcolor="#CCCCCC"><img
				src="${pageContext.request.contextPath}/images/space.gif" width="5"
				height="1"></td>
		</tr>
	</table>
	<form name="form1" id="form1" method="post" action="">
		<table align="center">
			<tr>
				<td></td>
				<td width="25%">
					<fieldset style="height: 400px; width: 70%;">
						<legend>操作</legend>
						<table border="0" cellpadding="0" cellspacing="1" width="100%"
							height="400">
							<tr>
								<td>

									<div
										style="height: 400px; width: 100%; overflow: auto; background-color: white;"
										id="divObjectTree1"></div>
								</td>
							</tr>
						</table>
						<script type="text/javascript">
d = new dTree('d');
d.add(0,-1,'');
<%
List<Menu> menuList=(List<Menu>)request.getAttribute("menuList");  
for(int i=0;i<menuList.size();i++){
%>
d.add(<%=menuList.get(i).getMenuId()%>,<%=menuList.get(i).getParentId()%>,'<input type="checkbox" name="menuId" id="ch<%=menuList.get(i).getMenuId()%>" class="<%=menuList.get(i).getParentId()%>" value="<%=menuList.get(i).getMenuId()%>" onClick="checkStatus(<%=menuList.get(i).getMenuId()%>,this)"><input type="hidden" name="menuName" value="<%=menuList.get(i).getMenuName()%>"/><%=menuList.get(i).getMenuName()%>');
<%
}
%>
divObjectTree1.innerHTML=d;
</script>
					</fieldset>
				</td>
				<td width="20%">
					<fieldset style="height: 400px; width: 70%;">
						<legend>数据</legend>
						<div id="divDataTree1"
							style="height: 400px; width: 100%; overflow: auto; background-color: white;"></div>
						<script>
data = new dTree('data');
data.add('0','-1','全部');
<%
List<Dictionary> dataList=(List<Dictionary>)request.getAttribute("dataList");  
for(int i=0;i<dataList.size();i++){
%>
data.add(<%=dataList.get(i).getKey()%>,0,'<input type="checkbox" name="dataId" value="<%=dataList.get(i).getId()%>"><input type="hidden" name="dataName" value="<%=dataList.get(i).getDescription()%>"/><%=dataList.get(i).getDescription()%>');
						<%}%>
							divDataTree1.innerHTML = data;
						</script>
					</fieldset>
				</td>
				<td width="10%"><input type="button" value=" >  " title="添加"
					onClick="add_role_pow()"><br> <input type="button"
					value=" <  " title="删除" onClick="remove_role_pow()"><br>
					<input type="button" value=" << " title="清空"
					onClick="clear_role_pow()"></td>
				<td width="10%">
					<fieldset style="height: 400px; width: 90%;">
						<legend>当前选择</legend>
						<select name="cur_choose" size="20" multiple id="cur_choose"
							style="height: 400px" ondblclick="remove_role_pow()">
							<c:forEach var="roledict" items="${roleDictList }">
								<option value="${roledict.menuId}-${roledict.dataId}">${roledict.menu.menuName }[${roledict.data.description }]</option>
							</c:forEach>
						</select> <input type="hidden" name="roleId" value="${roleId}">
					</fieldset>
				</td>
				<td></td>
			</tr>
		</table>
		<br>
		<table align="center">
			<tr>
				<td><input type="button" name="Submit" value="提交"
					onClick="return check();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="reset" type="reset" id="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>