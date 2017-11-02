<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>
.common-table {
   border-collapse: collapse;
   border: 1px solid #d7d5d5;
   line-height: 1.5;
   width: 80%;
   font-size: 13px;
}

.common-table input {
   padding: 0 10px;
   border: 1px solid #e8e8e8;
   height: 28px;
}

.common-table th {
   border-right: 1px solid #d7d5d5;
   background-color: #fbfafa;
   border: 1px solid #dfdfdf;
   padding: 11px 0 10px 18px;
   border-left: 0;
   font-weight: normal;
   text-align: left;
}

.common-table td {
   border: 1px solid #dfdfdf;
   border-right: 0;
   padding: 8px 10px 7px;
}

.common-table input:hover {
   border: 1px solid #aaa;
}

.common-table input[name=addr2], .join-table input[name=addr3] {
   width: 280px;
   margin: 5px 0 0;
}

.common-button {
   margin: 20px 0 50px;
   text-align: center;
}
</style>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
   var fileTypes = ["bmp", "gif", "png", "jpg", "jpeg"];

   
   $(function() {
      $("#imgInp1").on('change', function() {
         readURL(this);
      });
      $("#imgInp2").on('change', function() {
         readURL2(this);
      });
   });
   

   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.readAsDataURL(input.files[0]);
         
         reader.onload = function(e) {
            $('#blah1').attr('src', e.target.result);
         }
      }
   }
   
   function readURL2(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.readAsDataURL(input.files[0]);
         
         reader.onload = function(e) {
            $('#blah2').attr('src', e.target.result);
         }
      }
   }
</script>




<div class="area-100 center">
   <div class="empty-row"></div>
   <form action="upload" method="post" enctype="multipart/form-data">
      <table class="common-table center">
         <tr>
            <td>썸네일</td>
            <td>
               <input type="file" id="imgInp1" name="file1" multiple /> 
               <input type="text" id="imgInp1" name="savename1">
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <img id="blah1" src="" alt="사진을 등록하십시오">  
            </td>
         </tr>

         <tr>
            <td>상품유형</td>
            <td><select name="i_type">
                  <option value="shoe">shoe</option>
                  <option value="sneakers">sneakers</option>
                  <option value="sandal">sandal</option>
                  <option value="flat/loafer">flat/loafer</option>
                  <option value="boots">boots</option>
                  <option value="pumps">pumps</option>
            </select></td>
         </tr>
         <tr>
            <td>상품이름</td>
            <td><input type="text" name="i_name"></td>
         </tr>
         <tr>
            <td>내용</td>

            <td><input type="text" name="i_detail"></td>
         </tr>
         <tr>
            <td>상세 이미지</td>
            <td>
               <input type="file" id="imgInp2" name="file2" multiple />
                <input type="text" id="imgInp2" name="savename2">
            </td>
         </tr>
         <tr>
            <td colspan="2"><img id="blah2" src=""
               alt="사진을 등록하십시오"> 
            </td>
         </tr>
         <tr>
            <td>가격</td>
            <td><input type="text" name="i_price"></td>
         </tr>
         <tr>
            <td>재고</td>
            <td><input type="text" name="i_leftnum"></td>
         </tr>
         <tr>
            <td>색상</td>
            <td><input type="text" name="i_color"></td>
         </tr>
         <tr>
            <td>사이즈</td>
            <td><select name="i_size">
                  <option value="210">210</option>
                  <option value="220">220</option>
                  <option value="230">230</option>
                  <option value="240">240</option>
                  <option value="250">250</option>
                  <option value="260">260</option>
                  <option value="270">270</option>
                  <option value="etc">etc</option>
            </select></td>
         </tr>
      </table>
      <div class="join-button">
         <input type="submit" value="완료">
      </div>
   </form>
   <div class="empty-row"></div>

</div>



<%@ include file="/WEB-INF/view/template/footer.jsp"%>