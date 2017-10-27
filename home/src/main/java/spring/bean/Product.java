package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.Format;

public class Product {
	private int i_num;
	private int i_leftnum;
	private int i_price;
	private String i_color;
	private String i_size;
	private String i_detail;
	private String i_type;
	private String i_name;
	private String i_date;
	private String filetype;
	private String filename;
	private long filelen;
	private String savename;
	
	
	public int getI_num() {
		return i_num;
	}



	public void setI_num(int i_num) {
		this.i_num = i_num;
	}



	public int getI_leftnum() {
		return i_leftnum;
	}



	public void setI_leftnum(int i_leftnum) {
		this.i_leftnum = i_leftnum;
	}



	public int getI_price() {
		return i_price;
	}



	public void setI_price(int i_price) {
		this.i_price = i_price;
	}



	public String getI_color() {
		return i_color;
	}



	public void setI_color(String i_color) {
		this.i_color = i_color;
	}



	public String getI_size() {
		return i_size;
	}



	public void setI_size(String i_size) {
		this.i_size = i_size;
	}



	public String getI_detail() {
		return i_detail;
	}



	public void setI_detail(String i_detail) {
		this.i_detail = i_detail;
	}



	public String getI_type() {
		return i_type;
	}



	public void setI_type(String i_type) {
		this.i_type = i_type;
	}



	public String getI_name() {
		return i_name;
	}



	public void setI_name(String i_name) {
		this.i_name = i_name;
	}



	public String getI_date() {
		return i_date;
	}



	public void setI_date(String i_date) {
		this.i_date = i_date;
	}



	public String getFiletype() {
		return filetype;
	}



	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public long getFilelen() {
		return filelen;
	}



	public void setFilelen(long filelen) {
		this.filelen = filelen;
	}



	public String getSavename() {
		return savename;
	}



	public void setSavename(String savename) {
		this.savename = savename;
	}


	

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	


	public Product(int i_num, int i_leftnum, int i_price, String i_color, String i_size, String i_detail, String i_type,
			String i_name, String i_date, String filetype, String filename, long filelen, String savename) {
		super();
		this.i_num = i_num;
		this.i_leftnum = i_leftnum;
		this.i_price = i_price;
		this.i_color = i_color;
		this.i_size = i_size;
		this.i_detail = i_detail;
		this.i_type = i_type;
		this.i_name = i_name;
		this.i_date = i_date;
		this.filetype = filetype;
		this.filename = filename;
		this.filelen = filelen;
		this.savename = savename;
	}

	public Product(ResultSet rs) throws SQLException{
		setI_num(rs.getInt("i_num"));
		setI_leftnum(rs.getInt("i_leftnum"));
		setI_price(rs.getInt("i_price"));
		setI_color(rs.getString("i_color"));
		setI_size(rs.getString("i_size"));
		setI_detail(rs.getString("i_detail"));
		setI_type(rs.getString("i_type"));
		setI_name(rs.getString("i_name"));
		setI_date(rs.getString("i_date"));
		setFiletype(rs.getString("filetype"));
		setFilename(rs.getString("filename"));
		setFilelen(rs.getLong("filelen"));
		setSavename(rs.getString("savename"));
	}
	


	public String getLength() {
		Format f = new DecimalFormat("#,###.##");
		if (filelen < 1024L) {
			return f.format(filelen) + " bytes";
		} else if (filelen < 1024L * 1024L) {
			return f.format(filelen / 1024.0) + " KB";
		} else if (filelen < 1024L * 1024L * 1024L) {
			return f.format(filelen / 1024.0 / 1024.0) + " MB";
		} else {
			return f.format(filelen / 1024.0 / 1024.0 / 1024.0) + " GB";
		}
	}
	
	
	

}