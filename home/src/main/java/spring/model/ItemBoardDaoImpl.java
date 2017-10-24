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

	@Override
	public void insert(Product product) {
		//String sql = "insert into itemboard values(item_seq.nextval,?,?,?,?,?,?,?,sysdate,?,?,?,?,?)";
		String sql = "insert into itemboard values(itemboard_seq.nextval,?,?,?,?,?,?,?,sysdate,?,?,?,?)";
		Object[] args = { 
				/*product.getI_num(), product.getI_leftnum(), product.getI_price(), product.getI_color(),
				product.getI_size(), product.getI_detail(), product.getI_type(), product.getI_name(), product.getDate(),
				product.getFiletype(), product.getFilename(), product.getFilelen(), product.getSavename(),
				product.getTitle()*/
				
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
//	@Override
//	public List<Product> itemRemove(){
//		String sql = "delete itemboard where I_num = ?";
//				RowMapper<Product> mapper = (rs, index) ->{
//					return mapper.delete(product.getI_num());
//				};
//			return jdbcTemplate.query(sql,  mapper);
//			
//			this.jdbcTemplate.update("delete from actor where id = ?", Long.valueOf(actorId));
		
//	}

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

	
//	private RowMapper<Product> mapper = new RowMapper<Product>() {
//		public Product mapRow(ResultSet rs, int index) throws SQLException {
//			Product product = new Product();
//			product.setI_num(rs.getInt("i_num"));
//			product.setI_detail(rs.getString("i_detail"));
//			product.setI_price(rs.getInt("i_price"));
//			product.setI_date(rs.getString("i_date"));
//			return product;
//		}
//	}; 
//	public void update(Product product)
//		String sql = "update itemboard set "
	
	/*public void update(product product) {
		String sql = "update itemboard set 이미지='?', 내용='?', 가격='?' where no = '?' ";
		ResultSetExtractor<product> extractor = rs->{
			if(rs.next())
				return new product(rs);
			else
				return null;
		};
		return jdbcTemplate.query(sql, extractor, savename);
	}*/
	/*package jdbc2;

	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.List;

	import org.springframework.jdbc.core.JdbcTemplate;
	import org.springframework.jdbc.core.RowMapper;

	//StudentDao의 구현 클래스
	public class StudentDaoImpl implements StudentDao{
		
		//나는 반드시 jdbcTemplate을 이용할 수 있어야 하므로 변수와 setter를 준비
		private JdbcTemplate jdbcTemplate;
		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}
		
		@Override
		public void insert(Student s) {
			String sql = "insert into sw2 values(sw2_seq.nextval, ?, ?, ?, 0, sysdate)";
//			jdbcTemplate.update(sql, s.getName(), s.getId(), s.getPw());
			Object[] args = {
					s.getName(), s.getId(), s.getPw()
			};
			jdbcTemplate.update(sql, args);
		}
		
		//컴퓨터는 Student를 어떻게 꺼내서 설정해야 할지 모른다
		//컴퓨터에게 꺼내는 방법을 알려줘야 한다	RowMapper<?> 형태로 정의
		private RowMapper<Student> mapper = new RowMapper<Student>() {
			public Student mapRow(ResultSet rs, int index) throws SQLException {
				Student s = new Student();
				s.setNo(rs.getInt("no"));
				s.setName(rs.getString("name"));
				s.setId(rs.getString("id"));
				s.setPw(rs.getString("pw"));
				s.setMoney(rs.getInt("money"));
				s.setReg(rs.getString("reg"));
				return s;
			}
			
			
			
			
		}; 

		@Override
		public List<Student> select() {
			String sql = "select * from sw2 order by no";
			return jdbcTemplate.query(sql, mapper);
		}

		@Override
		public List<Student> select(String key) {
			String sql = "select * from sw2 where name like '%'||?||'%' order by no";
			return jdbcTemplate.query(sql, mapper, key);
//			return jdbcTemplate.query(sql, new Object[] {key}, mapper);
		}
		
	}
*/






}
