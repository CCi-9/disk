package cn.edu.dgut.cai.file.service;

import java.io.File;
import java.util.List;

import cn.edu.dgut.cai.User.vo.User;
import cn.edu.dgut.cai.utils.FileUtil;

public class FileService {

	/*	public File findByUser(User existUser) {
		String path="E:\\Program Files\\disk_user";
		return FileUtil.findFile(path+"\\"+existUser.getUserName());
	}
*/

	public List<File> findByUser(User user) {
		List<File> list = FileUtil.userFile(user.getUserName());
		if(list != null) {
			return list;
		}
		return null;
	}

	public File findByPath(String path) {
		return FileUtil.findFile(path);
	}



	public void delete(String deletePath) {
		 FileUtil.delete(deletePath);
	}

	public boolean createNewFile(String filename) {
		// TODO Auto-generated method stub
		return FileUtil.createNewFile(filename);
	}

}
