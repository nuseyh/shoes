package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.bean.Product;

@Repository("itemboardDao")
public class ItemBoardDaoImpl implements ItemBoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Override
//	public void remove(Product product) {
//		String sql = "delete ? from itemboard where i_num=?";
//		Object[] args = {
//				product.get
//		};
//		jdbcTemplate.update(sql, args);
//	}

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
	public List<Product> list() {
		String sql = "select * from itemboard order by i_date desc";
		RowMapper<Product> mapper = (rs, index) -> {
			return new Product(rs);
		};
		return jdbcTemplate.query(sql, mapper);
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
	
	@Override
	public boolean remove(String i_name) {
		String sql = "delete itemboard where i_num=?";
		Object[] args = {i_name};
		
		return jdbcTemplate.update(sql, args) > 0;
	}
//	public void edit(Product product) throws Exception{
//		
//		String sql = "update itemboard set i_leftnum=?, i_price=?, i_color=?, i_size=?, i_detail=?, i_type=?, i_name=?, filetype=?, filename=?, filelen=?, savename=? where i_num=?";
//		
//		PreparedStatement ps = con.prepareStatement(sql);
//		
//		ps.setInt(1, product.getI_leftnum());
//		ps.setInt(2, product.getI_price());
//		ps.setString(3, product.getI_color());
//		ps.setString(4, product.getI_size());
//		ps.setString(5, product.getI_detail());
//		ps.setString(6, product.getI_type());
//		ps.setString(7, product.getI_name());
//		ps.setString(8, product.getFiletype());
//		ps.setString(9, product.getFilename());
//		ps.setInt(10, product.getFilelen());
//		ps.setString(11, product.getSavename());
//		
//		con.close();
//	}

}
