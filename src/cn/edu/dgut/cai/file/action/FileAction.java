package cn.edu.dgut.cai.file.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.edu.dgut.cai.User.vo.User;
import cn.edu.dgut.cai.file.service.FileService;
import cn.edu.dgut.cai.file.vo.FileInfo;
import cn.edu.dgut.cai.utils.FileUtil;

public class FileAction extends ActionSupport implements ModelDriven<FileInfo>{
	private FileInfo fileInfo = new FileInfo();
	private File uploadfile;
	private String uploadfileContentType;
	private String uploadfileFileName;
	private String inputPath;
	private String downloadFilename;
	private String deletePath;
	private InputStream downLoadStream;
	private FileService fileService;
	public FileService getFileService() {
		return fileService;
	}
	
	public File getUploadfile() {
		return uploadfile;
	}




	public String getDeletePath() {
		return deletePath;
	}

	public void setDeletePath(String deletePath) {
		this.deletePath = deletePath;
	}

	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}



	public String getDownloadFilename() {
		return downloadFilename;
	}

	public void setDownloadFilename(String downloadFilename) {
		this.downloadFilename = downloadFilename;
	}

	public InputStream getDownLoadStream() throws FileNotFoundException {
		inputPath = inputPath.replace(";", "\\");
		System.out.println("filename:"+downloadFilename);
		File fileDes = new File(inputPath);//path是要下载文件所在的路径，可以写成任意本地路径  
		InputStream is = new FileInputStream(fileDes);  
		return is;  
	}

	public void setDownLoadStream(InputStream downLoadStream) {
		this.downLoadStream = downLoadStream;
	}

	public String getUploadfileFileName() {
		return uploadfileFileName;
	}

	public void setUploadfileFileName(String uploadfileFileName) {
		this.uploadfileFileName = uploadfileFileName;
	}

	public String getUploadfileContentType() {
		return uploadfileContentType;
	}

	public void setUploadfileContentType(String uploadfileContentType) {
		this.uploadfileContentType = uploadfileContentType;
	}



	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}



	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	public FileInfo getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
	}

	@Override
	public FileInfo getModel() {
		// TODO Auto-generated method stub
		return fileInfo;
	}
	
	public String findByUser() {
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null) {
			this.addActionMessage("您还未登陆，请先登陆");
			return "msg";
		}
		
		File rootfile = new File("C:\\disk\\"+existUser.getUserName());
		allFile(rootfile);
		return "findByUser";
		/*
		List<File> root_list = fileService.findByUser(existUser);
		List<FileInfo> dir_list = new ArrayList<FileInfo>();
		List<FileInfo> file_flist = new ArrayList<FileInfo>();
		FileInfo fi_dir;
		fileInfo.setName("root");
		
		for(File f:root_list) {
			fi_dir = new FileInfo();
			fi_dir.setPath(f.getPath().replace("\\", ";"));
			fi_dir.setName(f.getName());
			fi_dir.setParent_node(f.getParent().replace("\\", ";"));
			fi_dir.setSize((double)f.length());
			fi_dir.setLast_modified(new Date(f.lastModified()));
			if(f.isDirectory()) {	
				dir_list.add(fi_dir);
			}else {
				file_flist.add(fi_dir);
			}
		}
		this.setSessionList(dir_list, file_flist);
		ServletActionContext.getRequest().getSession().setAttribute("fileInfo", fileInfo);*/
	}

	
	public String findByDirname() {
		File file = fileService.findByPath(fileInfo.getPath().replace(";", "\\"));
		allFile(file);
		return "findByDirname";
	}
	
	public String goBack() {
		File file = fileService.findByPath(fileInfo.getPath().replace(";", "\\"));		
		File pfile = file.getParentFile();
		allFile(pfile);
		return "goBack";
	}
	
	public String getAllfile() {
		findByUser();
		return "getAllfile";
	}
	
	public String refreshPage() {
		String CurrentPath = localPath();
		File file = fileService.findByPath(CurrentPath.replace(";", "\\"));		
		allFile(file);
		return "refreshPage";
	}
	
	public String saveUpload() throws IOException {
		FileInfo fileInfo = (FileInfo) ServletActionContext.getRequest().getSession().getAttribute("fileInfo");
		System.out.println("fileInfo.path:"+fileInfo.getPath());
		System.out.println("uploadfile:"+uploadfile.getName());
		System.out.println("uploadfileFilename:"+uploadfileFileName);
		String path = fileInfo.getPath().replace(";", "\\");
		if(uploadfile == null) {
			System.out.println("文件为空==================");
		}
		
		File file = new File(path+"\\"+uploadfileFileName);
		
		FileUtils.copyFile(uploadfile, file);
		return "saveUpload";
	}
	
	public String download() {
		return "downloadSuccess";
	}
	
	public String delete() {
		deletePath = deletePath.replace(";", "\\");
		System.out.println("deletePath:"+deletePath);
		fileService.delete(deletePath);
		return "deleteSuccess";
	}
	
	@ResponseBody
	public String createNewFile() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String CurrentPath = localPath();
		
		String filename = fileInfo.getName();
		PrintWriter out = response.getWriter(); 
		boolean createOk = fileService.createNewFile(CurrentPath.replace(";", "\\")+"\\"+filename);
		System.out.println("fileInfo.getName()"+fileInfo.getName());
		if(createOk == true) {
			System.out.println("ok");
			out.write("createNewFile");
			return "createNewFile";
		}
		out.write("dir has exist");
		return NONE;
	}
	
	
	private String localPath() {
		return ((FileInfo)ServletActionContext.getRequest().getSession().getAttribute("fileInfo")).getPath();
	}
	
	
	private void allFile(File file) {
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(file.getPath().equals("C:\\disk\\"+existUser.getUserName())) {
			fileInfo.setName("root");
		}else {
			fileInfo.setName("other");
		}
		fileInfo.setPath(file.getPath().replace("\\", ";"));
		List<List<FileInfo>> fileList = FileUtil.allFile(file);
		System.out.println(fileList != null);
		System.out.println("fileList.size():"+fileList.size());
		if(fileList != null && fileList.size() >0) {		
			this.setSessionList(fileList.get(0), fileList.get(1));
		}else {
			List<FileInfo> dir_list = new ArrayList<FileInfo>();
			List<FileInfo> file_flist = new ArrayList<FileInfo>();
			this.setSessionList(dir_list, file_flist);
		}
		ServletActionContext.getRequest().getSession().setAttribute("fileInfo", fileInfo);
		/*
		File[] files = file.listFiles();
		FileInfo fi_dir;
		List<FileInfo> dir_list = new ArrayList<FileInfo>();
		List<FileInfo> file_flist = new ArrayList<FileInfo>();
		for(File f:files) {
			fi_dir = new FileInfo();
			fi_dir.setPath(f.getPath().replace("\\", ";"));
			fi_dir.setName(f.getName());
			fi_dir.setParent_node(f.getParent().replace("\\", ";"));
			fi_dir.setSize((double)f.length());
			fi_dir.setLast_modified(new Date(f.lastModified()));
			if(f.isDirectory()) {	
				dir_list.add(fi_dir);
			}else {
				file_flist.add(fi_dir);
			}*/
		}
	
	
	
	
	private void setSessionList(List<FileInfo> dir_list,List<FileInfo> file_flist) {
		ServletActionContext.getRequest().getSession().setAttribute("dir_list", dir_list);
		ServletActionContext.getRequest().getSession().setAttribute("file_flist", file_flist);
	}
}
