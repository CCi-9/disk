package cn.edu.dgut.cai.utils;

import java.io.File;import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.edu.dgut.cai.User.vo.User;
import cn.edu.dgut.cai.file.vo.FileInfo;

public class FileUtil {
	private static String root_path = new String("C:\\disk");
	public static String createUserDisk(User user) throws IOException {
		File rootFile = new File(root_path);
		if(!rootFile.exists()) {
			rootFile.mkdir();
		}
		String myPath = root_path+"\\"+user.getUserName();
		File file = new File(myPath);
		if(!file.exists()) {
			file.mkdir();
			return "创建成功";
		}else {
			return "用户创建失败";
		}
	}
	
	public static List<File> userFile(String path)
	{
		String myPath = root_path+"\\"+path;
		System.out.println("myPath:"+myPath);
		List<File> list = new ArrayList<File>();
		File myfile = new File(myPath);
		if(myfile.isDirectory()) {
			File[] files = myfile.listFiles(); 
			for(File f: files) {
				list.add(f);
			}
		}else {
			return null;
		}
		for(File f: list) {
			System.out.println(f.getName());
		}
		return list;
	}

	public static File findFile(String path) {
		File myfile = new File(path);
		if(!myfile.exists()) {
			return null;
		}
		return myfile;
	}
	
	public static List<List<FileInfo>> allFile(File file) {
		DecimalFormat df = new DecimalFormat("######0.00"); 
		List<List<FileInfo>> fileList = new ArrayList<List<FileInfo>>();
		File[] files = file.listFiles();
		FileInfo fi_dir;
		List<FileInfo> dir_list = new ArrayList<FileInfo>();
		List<FileInfo> file_flist = new ArrayList<FileInfo>();
		for(File f:files) {
			fi_dir = new FileInfo();
			fi_dir.setName(f.getName());
			fi_dir.setParent_node(f.getParent().replace("\\", ";"));
			fi_dir.setPath(f.getPath().replace("\\", ";"));
			fi_dir.setSize(Double.valueOf(df.format((double)f.length()/1024/1024)));
			fi_dir.setLast_modified(new Date(f.lastModified()));
			if(f.isDirectory()) {	
				dir_list.add(fi_dir);
			}else {
				file_flist.add(fi_dir);
			}
			fileList.add(dir_list);
			fileList.add(file_flist);
		}
		return fileList;
	}

	public static void delete(String deletePath) {
		File file = new File(deletePath);
		deleteDir(file);
	}

	private static void deleteDir(File file) {
		if(file.exists()) {
			File[] files = file.listFiles();
			if(files != null) {
				for(File f : files) {
					if(f.isDirectory()) {
						deleteDir(f);
					} else {
						f.delete();
					}
				}
			}
			file.delete();
		}
	}


	public static boolean createNewFile(String filename) {
		File rootFile = new File(filename);
		if(!rootFile.exists()) {
			rootFile.mkdir();
			return true;
		}
		return false;
	}
}
