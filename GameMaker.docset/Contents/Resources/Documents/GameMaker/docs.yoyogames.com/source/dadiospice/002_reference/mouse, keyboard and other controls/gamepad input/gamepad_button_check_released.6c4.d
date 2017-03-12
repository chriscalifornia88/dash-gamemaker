<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>

<!-- Mirrored from docs.yoyogames.com/source/dadiospice/002_reference/mouse, keyboard and other controls/gamepad input/gamepad_button_check_released.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2017 21:49:41 GMT -->
<head>
<meta name="keywords" content="online documentation, web online help, web help, chm2web" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="generator" content="chm2web Pro 2.85 (unicode)" />
<title>gamepad_button_check_released</title>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<link rel="stylesheet" href="../../../../../files/helpindex.css"
type="text/css">
<link rel="stylesheet" href="../../../../../default.css" type=
"text/css">

<script type="text/JavaScript" src="../../../../../files/supply.js"></script>
<script type="text/JavaScript">
chmtop.c2wtopf.pageid = "dadiospice/002_reference/mouse, keyboard and other controls/gamepad input/gamepad_button_check_released.html";
</script>

</head>
<body><script type="text/JavaScript"> 
if (window.name != "content") 
  document.write(" <table width=\"100%\" bgcolor=\"#e1e1e1\"cellspacing=\"2\" cellpadding=\"0\" style=\"border-collapse: collapse; font-family: sans-serif; font-size: 14px; color: #000000; text-decoration: none;  \"> <tr> <td align=\"center\" style=\"border-bottom: 2px solid gray\" > <br>&nbsp;Click <a href=\"http://docs.yoyogames.com/index.html?page=source%2Fdadiospice%2F002_reference%2Fmouse,%20keyboard%20and%20other%20controls%2Fgamepad%20input%2Fgamepad_button_check_released.html\">here</a> to show toolbars of the Web Online Help System: <a href=\"http://docs.yoyogames.com/index.html?page=source%2Fdadiospice%2F002_reference%2Fmouse,%20keyboard%20and%20other%20controls%2Fgamepad%20input%2Fgamepad_button_check_released.html\">show toolbars</a><br>&nbsp;</td></tr></table><br> "); 
</script>
<!-- !chm2web! -->

<h1 class="studio">gamepad_button_check_released</h1>

<h2 class="studio">Returns whether a given gamepad button has been
released.</h2>

<h3 class="studio">Syntax:</h3>

<p class="code">gamepad_button_check_released(device, button);</p>

<p><br>
</p>

<div class="param">
<table>
<tr>
<th>Argument</th>
<th>Description</th>
</tr>

<tr>
<td>device</td>
<td>Which gamepad device "slot" to check.</td>
</tr>

<tr class="alt">
<td>button</td>
<td>Which gamepad button <a href="index.html">constant</a> to check
for.</td>
</tr>
</table>
</div>

<p><br>
</p>

<p><b>Returns:</b> Boolean</p>

<p><br>
</p>

<h3 class="studio">Description</h3>

<p>This function will return <tt>true</tt> or <tt>false</tt>
depending on whether the given gamepad button is detected as having
been released or not. Note that this function will only trigger
<i>once</i> for the button the moment it has been released. For it
to trigger again the button must first be pressed and then released
once more.<br>
<br></p>

<p><br>
</p>

<h3 class="studio">Example:</h3>

<p class="code">if gamepad_button_check_released(0, gp_select)<br>
&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;audio_sound_play(snd_Button, 0, false);<br>
&nbsp;&nbsp;&nbsp;global.Pause = !global.Pause;<br>
&nbsp;&nbsp;&nbsp;}<br></p>

<p>The above code will detect whether the "select" button of the
gamepad connected to device "slot" 0 has been pressed or not and
toggle the global "Pause" variable.</p>

<p><br>
</p>

<div class="clear">
<div style="float:left">Back: <a href="index.html">GamePad
Input</a></div>

<div style="float:right">Next: <a href=
"gamepad_button_count.html">gamepad_button_count</a></div>
</div>

<h5>© Copyright YoYo Games Ltd. 2015 All Rights Reserved</h5>

<script type="text/JavaScript">
var fe = FindFrame("toc", top);
if ((fe != null) && (chmtop.c2wtopf.jstree != null)) {
  if (chmtop.c2wtopf.FITEMS[chmtop.c2wtopf.pagenum] != chmtop.c2wtopf.pageid)
    chmtop.c2wtopf.jstree.OpenTreeNode("source/" + chmtop.c2wtopf.pageid);
}
</script>
</body>

<!-- Mirrored from docs.yoyogames.com/source/dadiospice/002_reference/mouse, keyboard and other controls/gamepad input/gamepad_button_check_released.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2017 21:49:41 GMT -->
</html>
