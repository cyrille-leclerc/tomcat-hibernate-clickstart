<!DOCTYPE HTML PUBLIC “-//W3C//DTD HTML 4.01//EN">
<%@ page import="java.util.List" %>
<%@ page import="jsp.Item" %>
<html>
	<head>
		<meta http-equiv="content-type"
		content="text/html;charset=utf-8">
		<title>Java for the web.</title>
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
					<label for="name">Name: </label>
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
		<div id="clickstart_intro_message" style="display:none">
		  <div style="padding: 8px 35px 8px 14px; margin-bottom: 18px; color: #794F05; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);background-color: #fcf8e3;border: 1px solid #fbeed5;  -webkit-border-radius: 4px;     -moz-border-radius: 4px;          border-radius: 4px;  padding-top: 14px;  padding-bottom: 14px;">
		  Congratulations, your clickstart <a href="#CS_docUrl">#CS_name</a> is now running.
		  <div>To modify this, clone the source repo: 
		    <div style="background-color: white; font-weight:bold; color: black; font-family: courier;">git clone #CS_source awesome<br/>
		        cd awesome<br/>
		        ---- do your magic ----<br/>
		        git commit -m 'This is now even better !'<br/>
		        git push origin master</div>
		  </div>
		  Once you push your change, an army of monkeys will hand assemble and test your code, and should it be acceptable, it will be deployed to this very application !
		  <div>You can see your <a href="#CS_JenkinsUrl">Jenkins build here.</a>. You can manage your applications settings <a href="#CS_appManageUrl">here.</a>
		    Your database is <a href="#CS_dbManageUrl">here.</a>
		  </div>
		  <p>
		  <div><i>You will want to remove this notice one day</i></div>
		  </div>
		</div>
		<script type="text/javascript" src="https://s3.amazonaws.com/cloudbees-downloads/clickstart_intro.js"></script>  
		<!-- ************************************************************************************** 
		   end clickstart boilerplate section
			**************************************************************************************	-->


	</body>
</html>