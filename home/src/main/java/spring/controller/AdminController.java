package spring.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.bean.Product;
import spring.model.AdminDao;

@ControllerAdvice
@RequestMapping("/admin")
public class AdminController {
   
   @Autowired
   private AdminDao adminDao;
   
   
   @Autowired
   private ServletContext servletContext;
   
   
   private Logger log = LoggerFactory.getLogger(getClass());
   
//   @RequestMapping("/mkdir")
//   public String mkdir() {
//      File f = new File("C:\\Users\\IT202-24\\git\\shoes\\home\\src\\main\\webapp\\resource\\img\\i_name");
//      if(!f.exists()) {
//         f.mkdirs();
//         
//         System.out.println("폴더 생성 완료");
//      }
//      String path = servletContext.getRealPath("resource/img/i_name");
//      File target = new File(path);
//      
//      System.out.println(target);
//      if(!target.exists()) {
//         target.mkdirs();
//         
//         System.out.println("폴더 생성 완료");
//      }
//      return "redirect:/";
//   }
   
   
   @RequestMapping("/home")
   public String home() {
      return "admin/home";
   }
   
//   @RequestMapping("/memberlist")
//   public String memberlist() {
//      return "admin/memberlist";
//   }
   
   //회원 목록 리스트
   @RequestMapping({"/memberlist", "/memberlist/"})
   public String memberlist(Model model) {
      model.addAttribute("list", adminDao.list());
      return "admin/memberlist";
   }
   
   //회원 검색
   @RequestMapping("/memberlist/{key}")
   public String memberlist(Model model, @PathVariable String key) {
      model.addAttribute("list", adminDao.search(key));
      return "admin/memberlist";
   }
   
   // 회원 삭제
      @RequestMapping(value = {"/memberlist","/memberlist/{key}"}, method = RequestMethod.POST)
      public String deletemember(HttpServletRequest request, Model model) {
         model.addAttribute("list", adminDao.list());
         String[] check = request.getParameterValues("check");
         System.out.println(check.toString());

         for (String check2 : check) {
            System.out.println(check2);
            adminDao.delete(check2);
         }
         return "admin/memberlist2";
      }

   @RequestMapping(value = "/upload", method=RequestMethod.POST)
   public String upload(MultipartHttpServletRequest mrequest) throws IllegalStateException, IOException{
      
      Product product = new Product(mrequest);
      
      MultipartFile mf = mrequest.getFile("file1");
      String filename1 = mf.getOriginalFilename();
      product.setFilename1(filename1);
      String filetype1 = mf.getContentType();
      product.setFiletype1(filetype1);
      long filelen1 = mf.getSize();
      product.setFilelen1(filelen1);
      
      MultipartFile mf2 = mrequest.getFile("file2");
      String filename2 = mf.getOriginalFilename();
      product.setFilename2(filename2);
      String filetype2 = mf.getContentType();
      product.setFiletype2(filetype2);
      long filelen2 = mf.getSize();
      product.setFilelen2(filelen2);
      
      System.out.println("product : " + product);
      
      
      log.debug("savename = {}", product.getSavename1());
      log.debug("savename2 = {}", product.getSavename2());
      
      
      String path = servletContext.getRealPath("/upload");
      File target = new File(path, product.getSavename1());
      File target2 = new File(path, product.getSavename2());
      
      
      if(!target.exists()) {
         target.mkdirs();
         System.out.println("폴더 생성 완료");
      }
      
      if(!target2.exists()) {
         target2.mkdirs();
         System.out.println("폴더 생성 완료");
      }
      
      mf.transferTo(target);
      mf2.transferTo(target2);
      adminDao.insert(product);

      System.out.println("저장 완료");
      
      return "redirect:/home";
   }
   @RequestMapping("/upload")
   public String upload() {
      return "upload";
   }
   
   //상품메뉴
   @RequestMapping("/pmenu")
   public String pmenu(){
      return "admin/pmenu";
   }
   
   //상품 등록
   @RequestMapping("/itemadd")
   public String itemadd() {
      return "admin/itemadd";
   }
   
   
   
   //상품 목록 리스트
   @RequestMapping("/list")
   public String list(Model model) {
      List<Product> list = adminDao.plist();
      System.out.println(list.toString());
      model.addAttribute("plist", list);
      return "admin/list";
   }
   
   // 상품삭제
   @RequestMapping("/remove")
   public String remove() {

      return "admin/remove";
   }

   @RequestMapping(value = "/list", method = RequestMethod.POST)
   public String removeitems(HttpServletRequest request, Model model) {
      model.addAttribute("list", adminDao.plist());
      String[] check = request.getParameterValues("check");
      System.out.println(check.toString());
      
      for(String check2 : check) {
         System.out.println(check2);
         adminDao.remove(check2);
      }
      return "admin/list2";
   }
   
    //상품 수정
     @RequestMapping("/itemedit")
       public String itemedit(@RequestParam("no") String no, HttpServletRequest request) {
         request.setAttribute("product", adminDao.itemedit(no));
         request.setAttribute("no", no);
          return "admin/itemedit";
       }
    
    @RequestMapping(value = "/itemedit", method=RequestMethod.POST)
    public String itemedit2(Product p, Model model, HttpServletRequest request) {
       
       String i_name = (String)request.getParameter("i_name");
       p.setI_name(i_name);
       System.out.println("i_name = " + i_name);
       model.addAttribute("product", adminDao.itemedit2(p));
       adminDao.itemedit2(p);
       return "redirect:/admin/list";
      
    }
    
    
}