<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	IMP.init('imp57537634'); //iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
	IMP.request_pay({
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '결제테스트',
		amount : 1000,
		buyer_email : '${mdto.email}',
		buyer_name : '${mdto.name}',
		buyer_tel : '${mdto.phone}',
		buyer_addr : '${mdto.addr2}' + '${mdto.addr3}',
		buyer_postcode : '${mdto.addr1}'
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
</script>