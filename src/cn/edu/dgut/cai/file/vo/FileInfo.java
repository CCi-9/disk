package cn.edu.dgut.cai.file.vo;

import java.io.File;
import java.util.Date;
import java.util.List;

public class FileInfo {
	private String name;//文件名
	private String path;//文件路径
	private String file_type;//文件类型
	private double size;//文件大小
	private Date last_modified;//修改时间
	private String parent_node;//父节点
	private List<File> child_list;//所有子文件
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	public Date getLast_modified() {
		return last_modified;
	}
	public void setLast_modified(Date last_modified) {
		this.last_modified = last_modified;
	}
	public String getParent_node() {
		return parent_node;
	}
	public void setParent_node(String parent_node) {
		this.parent_node = parent_node;
	}
	public List<File> getChild_list() {
		return child_list;
	}
	public void setChild_list(List<File> child_list) {
		this.child_list = child_list;
	}
	
}
