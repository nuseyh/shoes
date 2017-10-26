//package spring.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.OutputStream;
//import java.util.List;
//import java.util.UUID;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.io.FileUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import spring.bean.Product;
//import spring.model.ItemBoardDao;
//
//@Controller
//public class ItemBoardController {
//	
//	@Autowired
//	private ItemBoardDao itemBoardDao;
//	
//	private Logger log = LoggerFactory.getLogger(getClass());
//	
//	@Autowired
//	private ServletContext servletContext;
//	
//	@RequestMapping("/upload")
//	public String upload() {
//		return "upload";
//	}
//	
//	@RequestMapping(value = "/upload", method=RequestMethod.POST)
//	public String upload(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException{
//		//String title = mRequest.getParameter("title");
//		//String i_num	= mRequest.getParameter("i_num");
//		int i_leftnum = Integer.parseInt(mRequest.getParameter("i_leftnum").trim());
//		String i_detail = mRequest.getParameter("i_detail").trim();
//		int i_price = Integer.parseInt(mRequest.getParameter("i_price").trim());
//		//String i_date = mRequest.getParameter("i_date").trim();
//		String i_color = mRequest.getParameter("i_color").trim();
//		String i_size = mRequest.getParameter("i_size").trim();
//		String i_type = mRequest.getParameter("i_type").trim();
//		String i_name = mRequest.getParameter("i_name").trim();
//		
//		MultipartFile mf = mRequest.getFile("file");
//		String filename = mf.getOriginalFilename();
//		String filetype = mf.getContentType();
//		long filelen = mf.getSize();
//		
//		String ip = mRequest.getRemoteAddr();
//		long time = System.currentTimeMillis();
//		UUID uuid = UUID.randomUUID();
//		String savename = ip+")"+time+"_"+uuid.toString();
//		log.debug("savename = {}", savename);
//		
//		Product product = new Product();
//		product.setI_leftnum(i_leftnum);
//		product.setI_detail(i_detail);
//		product.setI_price(i_price);
//		//product.setI_date(i_date);
//		product.setI_color(i_color);
//		product.setI_size(i_size);
//		product.setI_type(i_type);
//		product.setI_name(i_name);
//		product.setFiletype(filetype);
//		product.setFilename(filename);
//		product.setFilelen(filelen);
//		product.setSavename(savename);
//		
//		itemBoardDao.insert(product);
//		
//		String path = servletContext.getRealPath("/upload");
//		File target = new File(path, savename);
//		System.out.println(path);
//		System.out.println(target);
//		mf.transferTo(target);
//		log.debug("저장 완료");
//		
//		return "redirect:/";
//	}
//	
//	
////	@RequestMapping(value = "/itemAdd", method=RequestMethod.POST)
////	public String itemAdd(MultipartHttpServletRequest mRequest) throws Exception{
////		
////		//int i_num = Integer.parseInt(mRequest.getParameter("i_num").trim());
////		
////		
////		
////		MultipartFile mf = mRequest.getFile("file");
////		String filename = mf.getOriginalFilename();
////		String filetype = mf.getContentType();
////		long filelen = mf.getSize();
////		String savename = mRequest.getParameter("savename").trim();
////		
////		Product product = new Product();
////		
////		//product.setI_num(i_num);
////		
////		
////		itemBoardDao.insert(product);
////		
////		//String path = servletContext.getRealPath("/itemAdd");
////		
////		return "redirect:/";
////	}
//	
//	
//	@RequestMapping("/list")
//	public String list(Model model) {
//		List<Product> list = itemBoardDao.list();
//		model.addAttribute("list", list);
//		return "list";
//	}
//	@RequestMapping("/itemadd")
//	public String itemadd() {
//		return "/itemadd";
//	}
//	
////	@RequestMapping("/itemRemove")
////	public String itemRemove(Model model) {
////		List<Product> list = itemBoardDao.list();
////		model.
////	}
//	
//	//path variable의 경우는 .이 포함되면 경로가 끊겨서 인식된다
//		//표현식을 추가하여 받도록 설정
//		@RequestMapping("/download/{filename:.+}")
//		public void download(@PathVariable String filename,
//											HttpServletResponse response) throws IOException{
//			log.debug("filename = {}", filename);
//			
//			//전송해줄 때 사용할 이름
//			Product product = itemBoardDao.get(filename);
//			String sendFilename = product.getFilename();
//			
//			//파일 읽기
//			String realPath = servletContext.getRealPath("/upload");
//			File target = new File(realPath, filename);
//			
//			//apache common-io의 기능을 이용하여 파일을 한줄로 byte[] 읽기
//			byte[] data = FileUtils.readFileToByteArray(target);
//			
//			//전송 설정 - 파일 전송용으로 response를 다시 설정
//			response.setContentType("application/octet-stream");
//			response.setContentLength(data.length);
//			response.setHeader("Content-Disposition", 
//												"attachment; fileName=\""+sendFilename+"\";");
//			response.setHeader("Content-Transfer-Encoding", "binary");
//			
//			//파일 전송
//			OutputStream out = response.getOutputStream();
//			out.write(data);
//			out.close();
//		}
//}
