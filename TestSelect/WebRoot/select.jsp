<HTML> 
<HEAD> 
<META http-equiv='Content-Type' content='text/html; charset=utf-8'> 
<TITLE>可输入的下拉框</TITLE> 
</HEAD> 
<BODY > 
<Script Language="Javascript"> 
var j = 0; 
function SelectValue(obj) 
{ 
var input = obj.parentNode.nextSibling; 
document.all.box2.value = obj.options[obj.selectedIndex].text; 
document.getElementById("txtSection").value=obj.options[obj.selectedIndex].value; 
alert(document.getElementById("txtSection").value); 
} 
function InputValue(obj) 
{ 
var n = 1; 
var tmpObj; 
var src = document.all.SelectOption; 
var msg = document.all.msg; 
if(event.keyCode != 40 && event.keyCode != 38 && event.keyCode != 13){ 
if(obj.value!=""){ 
msg.style.display=""; 
msg.innerHTML=""; 
if(msg.hasChildNodes()) 
{ 
msg.childNodes[0].parentNode.removeChild(msg.childNodes[0]); 
} 
for (var i=0;i<src.length;i++){ 
var selValue = document.createElement("div"); 
var selText = document.createElement("div"); 
selText.value = src(i).value; 
selText.innerHTML = src(i).text; 
if (src(i).text.toLowerCase().indexOf(obj.value.toLowerCase())==0){ 
selText.setAttribute("id","selText"+n); 
selText.onmouseover=function (){ 
this.style.backgroundColor='#003399'; 
this.style.color ='#ffffff'; 
} 
selText.onmouseout=function (){ 
this.style.backgroundColor='#ffffff'; 
this.style.color ='#000000'; 
} 
selText.onclick=function (){ 
document.all.box2.value = this.innerHTML; 
msg.style.display="none"; 
document.getElementById("txtSection").value=this.value; 
} 
msg.appendChild(selText); 
n++; 
} 
} 
} 
else { 
document.all.msg.style.display="none"; 
} 
} 
else { 
//press down key 
if(event.keyCode==40){ 
j++; 
for (var i=0; i<src.length; i++) 
{ 
tmpObj = document.getElementById("selText"+i); 
if(tmpObj != null){ 
tmpObj.style.backgroundColor='#ffffff'; 
tmpObj.style.color ='#000000'; 
} 
} 
tmpObj = document.getElementById("selText"+j); 
if(tmpObj != null){ 
tmpObj.style.backgroundColor='#003399'; 
tmpObj.style.color ='#ffffff'; 
}else{ 
j = 0; 
} 
} 
//press up key 
if (event.keyCode==38){ 
j--; 
for (var i=0; i<src.length; i++) 
{ 
tmpObj = document.getElementById("selText"+i); 
if(tmpObj != null){ 
tmpObj.style.backgroundColor='#ffffff'; 
tmpObj.style.color ='#000000'; 
} 
} 
tmpObj = document.getElementById("selText"+j); 
if(tmpObj != null){ 
tmpObj.style.backgroundColor='#003399'; 
tmpObj.style.color ='#ffffff'; 
}else{ 
j = 2; 
} 
} 
//press enter key 
if (event.keyCode==13){ 
tmpObj = document.getElementById("selText"+j); 
document.all.box2.value = tmpObj.innerHTML; 
msg.style.display="none"; 
document.getElementById("txtSection").value=tmpObj.value; 
} 
} 
} 
function SelMatch(src) 
{ 
var currSel = document.all.box2.value; 
for (var i=0;i<src.length;i++){ 
if (src(i).text==currSel) 
{ 
src.options(i).selected = true; 
} 
} 
} 
function NoMsg() 
{ 
if(document.activeElement.id=="msg") 
return false; 
else
document.all.msg.style.display='none'; 
} 
</Script> 
<TABLE border=0 cellPadding=1 cellSpacing=0 width="100%"> 
<TR> 
<TD width="24%"><font face="Arial" size="2">Section</font></TD> 
<TD COLSPAN=3 width="76%"> 
<div style="position:relative;"> 
<span style="margin-left:230px;width:18px;overflow:hidden;"> 
<select style="HEIGHT: 22px; WIDTH: 250px; margin-left:-232px;" onchange="SelectValue(this)" onclick="SelMatch(this)" id="SelectOption" name="SelectOption" > 
<OPTION value='ALL' Selected>ALL</OPTION> 
<OPTION value='0TEST1'>0TEST1 = Testing 1 
<OPTION value='0TEST1'>0TEST2 = Testing 1 
<OPTION value='0TEST1'>0TEST3 = Testing 1 
<OPTION value='SECTION'>SECTION = Section Description XXXXX AAA 
</OPTION> 
</select>
</span> 
<input name="box2" id="box2" style="width:230px;position:absolute;left:0px;" onkeyup="InputValue(this)" onblur="NoMsg()" onfocus="this.select();InputValue(this)" value="0" > 
<div id="msg" style="border:1px solid green; font-size :14PX;white-space:nowrap;overflow:hidden; 
width:230px;position:absolute;left:0px;top:20px;display:none"></div> 
</div> 
<Input Type="Hidden" Name="txtSection" id="txtSection"> 
</TD> 
</TR> 
</TABLE> 
<p> 
</BODY></HTML>