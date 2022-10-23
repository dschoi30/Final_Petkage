<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<body>
	<!-- Food_dictionary 시작 -->
	<section class="tc">
		<div class="tools_container">

			<!-- 계산기 전체 상단 -->
			<div class="cal_top pr">
				<div class="cal_top_box pr area">
					<div class="cal_Tbg">
						<h3 class="">Tools For MY<span> PET</span></h3>
						<p class="cal_top_h3_line_c"></p>
					</div>
				</div>
			</div>

			<!-- 계산기 메뉴 버튼 -->
			<div class="cal_menu pr">
				<div class="cal_menu_btn">
					<ul>
						<li class='inactive'>
							<a href="${ path }/tools/ageCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/age_off.png"
										alt="나이 계산기" /></span>
								<span class="cal_txt">나이 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/bmi_off.png"
										alt="비만도 계산기" /></span>
								<span class="cal_txt">비만도 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/cal_off.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/common/dic_on.png"
										alt="식품 사전" /></span>
								<span class="cal_txt">식품 사전</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/walkOutRecommend">
								<span class="cal_icon"><img src="${ path }/resources/images/common/out_off.png"
										alt="산책코스" /></span>
								<span class="cal_txt">산책코스</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<!-- 사전 컨텐츠 -->
			<div class="cal_content pr">

				<!-- 식품 검색 박스 -->
				<div class="cal_info_box" id="contents_tab_4">

					<!-- 식품 검색 -->
					<div class="cal_write">
						<div class="content_write box_no_line">
							<div id="search_box_cover">
								<form method="GET" action="${ path }/tools/eatThis">
									<div class="tb">
										<div class="td"><input type="text" id="searchFood" name="foodName" placeholder="이거 먹어도 되나요?" value="${ param.foodName }" required></div>
										<div class="td" id="s-cover">
											<button type="submit">
											<div id="s-circle"></div>
											<span></span>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- 관리자 식품 추가 버튼 -->
					<c:if test="${ not empty loginMember && loginMember.memberRole == 'ROLE_ADMIN' }">
						<div class="cal_btn">
							<div class="cal_result" id="result_btn" onclick="addFood()"><a>식품 추가</a></div>
						</div>
					</c:if>	
				</div>

				<!-- 식품 추가 박스 -->
				<div class="dic_add_box" style="display:none">
		
					<!-- 식품 추가 -->
					<form action="${ path }/tools/foodAdd" method="POST" enctype="multipart/form-data" >
						<div class="dic_add_food" id="">
							<span class="content_write_input write_divline">
								<h5>식품명</h5>
								<input type="text" name="food_name" id="food_name" placeholder="식품명 입력" title="">
							</span>
							<span class="content_write_input write_divline">
								<h5>식품 설명</h5>
								<input type="text" name="food_comment" id="food_comment" placeholder="식품 설명 입력" title="">
							</span>
							<span class="content_write_input write_divline">
								<h5>식품 상세설명</h5>
								<input type="text" name="food_subcomment" id="food_subcomment" placeholder="식품 상세설명 입력" title="">
							</span>
							<span class="content_write_input write_divline">
								<h5>가능 여부</h5>
									<div class="food_choice">
										<fieldset>
											<input type="hidden" id="food_type" name="eatThis_type">
											<label for="eatThis_G">
												<input type="radio" class="" id="eatThis_G" name="eatThis_type" value="G" onclick="eatThis_choice(0)">
													<span>Good</span>
											</label>
											<label for="eatThis_B">
												<input type="radio" class="" id="eatThis_B" name="eatThis_type" value="B" onclick="eatThis_choice(1)">
													<span>Bad</span>
											</label>
											<label for="eatThis_S">
												<input type="radio" class="" id="eatThis_S" name="eatThis_type" value="S" onclick="eatThis_choice(2)">
													<span>Soso</span>
											</label>
											<label for="eatThis_N">
												<input type="radio" class="" id="eatThis_N" name="eatThis_type" value="N" onclick="eatThis_choice(3)">
													<span>Not</span>
											</label>
										</fieldset>
									</div>
							</span>
						</div>
			
						<!-- 계산기 다시하기 버튼-->
						<div class="cal_btn">
							<div class="cal_again" id="foodAddBtn"><a>등록하기</a></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Food_dictionary 끝 -->
<script type="text/javascript">

	function addFood() {
		$(".dic_add_box").show();
		$(".cal_info_box").hide();
	}

	function eatThis_choice(no) { 
        console.log(no + $("#food_type").val(no));

        // $("#eatThis_" + no).val(no);
    }

	$("#foodAddBtn").on("click", function() {

		if ($("#food_name").val() !== "" && $("#food_comment").val() !== "" && $('input[name="eatThis_type"]').val() !== "" ) {	// 빈칸 완료
			
			var food = {
				food_name : $("#food_name").val(),
				food_comment : $("#food_comment").val(),
				food_subcomment : $("#food_subcomment").val(),
				eatThis_type : $('input[name="eatThis_type"]:checked').val()
			}
		
			// var food_name = $("#food_name").val();
			// var food_comment = $("#food_comment").val();
			// var food_subcomment = $("#food_subcomment").val();
			// var food_type = $('input[name="eatThis_type"]:checked').val();
			
			// console.log(food_name + ", " + food_comment + ", " + food_subcomment + ", " + food_type);
					
			$.ajax({
				type: "POST",
				url: "${ path }/tools/foodAdd",
				dataType : "json",
				contentType : "application/json",
				data: JSON.stringify(food)
				// {
					// food_name,
					// food_comment,
					// food_subcomment,
					// food_type
				// } ,
				,
				success: (data) => {
					console.log(data);
					if (data['data'] == "success"){
						alert("새로운 식품이 등록되었습니다.");
						location.reload();
					} else if (data['data'] == "fail") {
						alert("이미 등록된 식품입니다.");
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
				
		} else {
			alert("빈칸을 채워주세요.")
		}
		
		
	});		

</script>	
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />