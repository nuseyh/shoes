package spring.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.Format;

import org.springframework.web.multipart.MultipartHttpServletRequest;

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
   private String filetype1;
   private String filename1;
   private long filelen1;
   private String savename1;
   private String filetype2;
   private String filename2;
   private long filelen2;
   private String savename2;

   public Product(MultipartHttpServletRequest mrequest) {
      String i_num = mrequest.getParameter("i_num");
      setI_num(i_num == null ? 0 : Integer.parseInt(i_num));
      String i_leftnum = mrequest.getParameter("i_leftnum");
      setI_leftnum(i_leftnum == null ? 0 : Integer.parseInt(i_leftnum));
      String i_price = mrequest.getParameter("i_price");
      setI_price(i_price == null ? 0 : Integer.parseInt(i_price));
      setI_color(mrequest.getParameter("i_color"));
      setI_size(mrequest.getParameter("i_size"));
      setI_detail(mrequest.getParameter("i_detail"));
      setI_type(mrequest.getParameter("i_type"));
      setI_name(mrequest.getParameter("i_name"));
      setI_date(mrequest.getParameter("i_date"));

      setFiletype1(mrequest.getParameter("filetype1"));
      setFilename1(mrequest.getParameter("filename1"));
      String filelen1 = mrequest.getParameter("filelen1");
      setFilelen1(filelen1 == null ? 0 : Integer.parseInt(filelen1));
      setSavename1(mrequest.getParameter("savename1"));

      setFiletype2(mrequest.getParameter("filetype2"));
      setFilename2(mrequest.getParameter("filename2"));
      String filelen2 = mrequest.getParameter("filelen2");
      setFilelen2(filelen2 == null ? 0 : Integer.parseInt(filelen2));
      setSavename2(mrequest.getParameter("savename2"));
   }

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

   public String getFiletype1() {
      return filetype1;
   }

   public void setFiletype1(String filetype1) {
      this.filetype1 = filetype1;
   }

   public String getFilename1() {
      return filename1;
   }

   public void setFilename1(String filename1) {
      this.filename1 = filename1;
   }

   public long getFilelen1() {
      return filelen1;
   }

   public void setFilelen1(long filelen1) {
      this.filelen1 = filelen1;
   }

   public String getSavename1() {
      return savename1;
   }

   public void setSavename1(String savename1) {
      this.savename1 = savename1;
   }

   public String getFiletype2() {
      return filetype2;
   }

   public void setFiletype2(String filetype2) {
      this.filetype2 = filetype2;
   }

   public String getFilename2() {
      return filename2;
   }

   public void setFilename2(String filename2) {
      this.filename2 = filename2;
   }

   public long getFilelen2() {
      return filelen2;
   }

   public void setFilelen2(long filelen2) {
      this.filelen2 = filelen2;
   }

   public String getSavename2() {
      return savename2;
   }

   public void setSavename2(String savename2) {
      this.savename2 = savename2;
   }

   public Product() {
      super();
   }

   public Product(int i_num, int i_leftnum, int i_price, String i_color, String i_size, String i_detail, String i_type,
         String i_name, String i_date, String filetype1, String filename1, long filelen1, String savename1,
         String filetype2, String filename2, long filelen2, String savename2) {
      super();
   }

   public Product(ResultSet rs) throws SQLException {
      setI_num(rs.getInt("i_num"));
      setI_leftnum(rs.getInt("i_leftnum"));
      setI_price(rs.getInt("i_price"));
      setI_color(rs.getString("i_color"));
      setI_size(rs.getString("i_size"));
      setI_detail(rs.getString("i_detail"));
      setI_type(rs.getString("i_type"));
      setI_name(rs.getString("i_name"));
      setI_date(rs.getString("i_date"));
      setFiletype1(rs.getString("filetype1"));
      setFilename1(rs.getString("filename1"));
      setFilelen1(rs.getLong("filelen1"));
      setSavename1(rs.getString("savename1"));
      setFiletype2(rs.getString("filetype2"));
      setFilename2(rs.getString("filename2"));
      setFilelen2(rs.getLong("filelen2"));
      setSavename2(rs.getString("savename2"));
   }

   public String getLength() {
      Format f = new DecimalFormat("#,###.##");
      if (filelen1 < 1024L) {
         return f.format(filelen1) + " bytes";
      } else if (filelen1 < 1024L * 1024L) {
         return f.format(filelen1 / 1024.0) + " KB";
      } else if (filelen1 < 1024L * 1024L * 1024L) {
         return f.format(filelen1 / 1024.0 / 1024.0) + " MB";
      } else {
         return f.format(filelen1 / 1024.0 / 1024.0 / 1024.0) + " GB";
      }
   }

   public String getLength2() {
      Format f2 = new DecimalFormat("#,###.##");
      if (filelen2 < 1024L) {
         return f2.format(filelen2) + " bytes";
      } else if (filelen2 < 1024L * 1024L) {
         return f2.format(filelen2 / 1024.0) + " KB";
      } else if (filelen2 < 1024L * 1024L * 1024L) {
         return f2.format(filelen2 / 1024.0 / 1024.0) + " MB";
      } else {
         return f2.format(filelen2 / 1024.0 / 1024.0 / 1024.0) + " GB";
      }
   }

   @Override
   public String toString() {
      return "Product [i_num=" + i_num + ", i_leftnum=" + i_leftnum + ", i_price=" + i_price + ", i_color=" + i_color
            + ", i_size=" + i_size + ", i_detail=" + i_detail + ", i_type=" + i_type + ", i_name=" + i_name
            + ", i_date=" + i_date + ", filetype1=" + filetype1 + ", filename1=" + filename1 + ", filelen1="
            + filelen1 + ", savename1=" + savename1 + ", filetype2=" + filetype2 + ", filename2=" + filename2
            + ", filelen2=" + filelen2 + ", savename2=" + savename2 + "]";
   }

}