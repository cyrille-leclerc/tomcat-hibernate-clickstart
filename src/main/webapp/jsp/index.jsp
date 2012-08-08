<!DOCTYPE HTML PUBLIC “-//W3C//DTD HTML 4.01//EN">
<%@ page import="java.util.List" %>
<%@ page import="jsp.Item" %>
<html>
	<head>
		<meta http-equiv="content-type"
		content="text/html;charset=utf-8">
		<title>Java for the web.</title>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	</head>
	<body>
		<form action="/" method="post">
			<div class = "input">
				<p>
					<label for="name">Name: </label>
					<input type="text" name="name" id="name" />
					<label for="id">Comments: </label>
					<input type="text" name="comment" id="comment" />
					<input type="submit" name="add" value="Add new item" />
				</p>
			</div>
		</form>
		<form action="/" method="post">
			<div class = "remove">
				<p>
					<label for="removeName">Name: </label>
					<input type="text" name="removeName" id="removeName" />
					<input type="submit" name="remove" value="Remove item" />
				</p>
			</div>
		</form>

		<table class = "item_table">
			<div class = "item_properties">
				<tr><td>Name</td><td>Comment</td></tr>
			</div>
			<% List<Item> itemList = (List<Item>) request.getAttribute("items");
			StringBuilder sb = new StringBuilder();
			for (Item item : itemList) {
				sb.append("<div class=\"item\">\n<tr><td>");
				sb.append(item.getName());
				sb.append("</td><td>");
				sb.append(item.getComment());
				sb.append("</td></tr>\n</div>\n");
			}
			out.print(sb.toString()); %>
		</table>


		<!-- ************************************************************************************** 
		   this is for the message that shows up once clickstart is created. Feel free to remove it 
			 **************************************************************************************	-->
		    <!-- This section is used for first time display of clickstart -->
		    <script type="text/javascript">
		    var CloudBeesNamespace = (function(){
		      var attachScript = function(path){
		        var newscript = document.createElement('script');
		            newscript.type = 'text/javascript';
		            newscript.async = true;
		            newscript.src = path;
		        (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(newscript);      
		      }
		      var attachCss = function(path){
		        var newLink = document.createElement('link');
		           newLink.type = 'text/css';
		           newLink.href = path;
		           newLink.rel = 'stylesheet';
		        (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(newLink); 
		      } 
		      if(window.location.href.indexOf('CS_appName=') > -1){
		        attachScript('https://s3.amazonaws.com/cloudbees-downloads/clickstart/clickstart_intro.js');  
		      } 
		      return {attachScript:attachScript,attachCss:attachCss};
		    })();   
		    </script> 
		    <!-- end clickstart intro section --> 
		<!-- ************************************************************************************** 
		   end clickstart boilerplate section
			**************************************************************************************	-->


	</body>
</html>