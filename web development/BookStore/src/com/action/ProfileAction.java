package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.*;
import com.mongodb.client.*;
import com.mongodb.client.gridfs.*;
import com.mongodb.client.gridfs.model.GridFSDownloadByNameOptions;
import com.mongodb.client.gridfs.model.GridFSUploadOptions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProfileAction extends ActionSupport {
	private File file;
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String upload(){
		if(file!=null){
			System.out.print("chenggongle");
		}
		Map<String, Object> session = ActionContext.getContext().getSession();
		int uid=(int)session.get("userid");
		MongoClient mongoClient = new MongoClient("localhost" , 27017 );
		MongoDatabase db = mongoClient.getDatabase("mydb");
		GridFSBucket gridFSBucket = GridFSBuckets.create(db,"userIMG");
		try {
			InputStream streamToUploadFrom = new FileInputStream(file);
			 GridFSUploadOptions gridFSUploadOptions = new GridFSUploadOptions()
	                    .chunkSizeBytes(1024)
	                    .metadata(new Document("type", "presentation"));
			 ObjectId fileId = gridFSBucket.uploadFromStream(uid+".jsp", streamToUploadFrom, gridFSUploadOptions);
			 gridFSBucket.rename(fileId,uid+".jpg");
			 mongoClient.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "success";
	}
	
}
