package spring.model;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Product;

@Repository(value="productDao")
public class ProductDaoImpl implements ProductDao{
	
	private RowMapper<Product> mapper = (rs,index)->{
		return new Product(rs);
	};
	
	private ResultSetExtractor<Product> extractor = (rs)->{
		return rs.next()?new Product(rs):null;
	};

	
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	
	
	
	//
	@Override
	public List<Product> plist(String type) {
		String sql = "";	
		switch(type) {
		case "all":
			sql = "select * from itemBoard order by i_date desc"; break;
		case "pumps" :
			sql =  "select * from itemBoard where i_type= 'pumps' order by i_date desc"; break;
		case "boots" :
			sql =  "select * from itemBoard where i_type='boots' order by i_date desc"; break;
		case "sneakers":	
			sql =  "select * from itemBoard where i_type='sneakers' order by i_date desc"; break;
		case "flat/loafer":		
			sql =  "select * from itemBoard where i_type='flat/loafer' order by i_date desc"; break;
		case "sandal":	
			sql =  "select * from itemBoard where i_type='sandal' order by i_date desc"; break;
		case "shoe":	
			sql =  "select * from itemBoard where i_type='shoe' order by i_date desc"; break;
			
		}
		return jdbcTemplate.query(sql, mapper);
	}

	//상품추가
	@Override
	public void insert(Product product) {
		String sql = "insert into itemboard values(itemboard_seq.nextval,?,?,?,?,?,?,?,sysdate,?,?,?,?)";
		Object[] args = { 
				
				product.getI_leftnum(),
				product.getI_price(),
				product.getI_color(),
				product.getI_size(),
				product.getI_detail(),
				product.getI_type(),
				product.getI_name(),
				product.getFiletype(),
				product.getFilename(),
				product.getFilelen(),
				product.getSavename()

		};
		jdbcTemplate.update(sql, args);
	}
	
	
	@Override
	public Product get(String savename) {
		String sql = "select * from itemBoard where savename = ?";
		ResultSetExtractor<Product> extractor = rs -> {
			if (rs.next())
				return new Product(rs);
			else
				return null;
		};
		return jdbcTemplate.query(sql, extractor, savename);
	}
	

	
	//상품상세보기
	@Override
	public Product detail(int no) {
		String sql ="select * from itemBoard where i_num=?";
		Object[] obj = {no};
		return jdbcTemplate.query(sql, obj, extractor);
	}
	
	
	
}