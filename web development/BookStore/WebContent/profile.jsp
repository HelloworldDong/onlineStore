<%@ page language="java"  import='java.util.ArrayList,java.util.List,org.bson.Document,com.mongodb.MongoClient,
com.mongodb.client.MongoCollection,
 com.mongodb.client.MongoDatabase,
  com.mongodb.client.gridfs.*,
 java.io.File,
 java.io.FileOutputStream,
 com.mongodb.client.gridfs.model.GridFSDownloadByNameOptions'
contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String username= (String) session.getAttribute("username");
	if (username == null) {
		response.sendRedirect("index.jsp");
	}
	out.print(username+",Welcome to DongLiang's BookStore!");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

	<form action="profile" method="post" enctype="multipart/form-data">
	<input type="file" name="file"><br>
	<input type="submit" value="submit">
	</form>
   <%
	 MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	 MongoDatabase db = mongoClient.getDatabase("mydb");  
	 GridFSBucket gridFSBucket = GridFSBuckets.create(db,"userIMG");
	 String uid=(String) session.getAttribute("userid").toString();
	 File display=new File(uid+".jpg");
	 FileOutputStream streamToDownloadTo = new FileOutputStream(display);  
     GridFSDownloadByNameOptions downloadOptions = new GridFSDownloadByNameOptions().revision(-1);  
     gridFSBucket.downloadToStreamByName(uid+".jpg", streamToDownloadTo, downloadOptions);  
     streamToDownloadTo.close();
     mongoClient.close();
	%>  
	<img width="40%" src="<%="/"+display.getPath() %>"></img> 
</body>
</html>