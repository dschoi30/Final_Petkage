<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<body>
	<!-- calorie_calculator 시작 -->
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
								<span class="cal_icon"><img src="${ path }/resources/images/age_off.png"
										alt="나이 계산기" /></span>
								<span class="cal_txt">나이 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/bmi_off.png"
										alt="비만도 계산기" /></span>
								<span class="cal_txt">비만도 계산</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/cal_on.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/dic_off.png"
										alt="식품 사전" /></span>
								<span class="cal_txt">식품 사전</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/walkOutRecommend">
								<span class="cal_icon"><img src="${ path }/resources/images/out_off.png"
										alt="산책코스" /></span>
								<span class="cal_txt">산책코스</span>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<!-- 계산기 컨텐츠 -->
			<div class="cal_content pr">
	
				<!-- 계산기 정보 박스 -->
				<div class="cal_info_box" id="contents_tab_3">
	
					<!-- 계산기 정보 작성-->
					<div class="cal_write">
						<div class="content_write">
							<span class="content_write_input write_divline">
								<h5>반려동물 선택</h5>
								<div class="pet_choice">
									<input type="hidden" id="pet_type" name="pet_type">
									<ul id="pet_sel">
										<li onclick="pet_sel(0)" class="pet_type_0 pet_off"><a><img
													src="${ path }/resources/images/Laughing_Dog.png" alt="BCS_s01" />
												<p>강아지</p>
											</a></li>
										<li onclick="pet_sel(3)" class="pet_type_3 pet_off"><a><img
													src="${ path }/resources/images/Laughing_Cat.png" alt="BCS_s01" />
												<p>고양이</p>
											</a></li>
									</ul>
								</div>
							</span>
							<span class="content_write_input write_divline">
								<h5>몸무게 입력</h5>
								<input type="text" name="pet_weight" id="pet_weight"  inputmode="numeric" pattern="[0-9]*" placeholder="kg단위로 입력해주세요" title="">
							</span>
							<span class="content_write_input write_divline">
								<h5>반려동물 상태</h5>
								<div class="selectBoxList">
									<!-- selectBox1 -->
									<div class="box">
										<div  class="pet_jisu selectBoxes" id="pet_jisu" name="pet_jisu">
											<button class="label">반려동물 상태 선택</button>
											<ul class="optionList">
												<li class="optionItem">반려동물 상태 선택</li>
											</ul>
										</div>
									</div>
									<!-- selectBox2 -->
									<div class="box">
										<div class="pet_jisu selectBoxes" id="dog_jisu" name="dog_jisu" style="display:none">
											<button class="label">반려견 상태 선택</button>
											<ul class="optionList">
												<li class="optionItem" value="1">성장기(4개월 미만) 강아지</li>
												<li class="optionItem" value="2">성장기(4 ~ 12개월) 강아지</li>
												<li class="optionItem" value="3">중성화한 성견</li>
												<li class="optionItem" value="4">중성화하지 않은 성견</li>
												<li class="optionItem" value="5">체중 감량이 필요한 성견</li>
												<li class="optionItem" value="6">체중 증량이 필요한 성견</li>
												<li class="optionItem" value="7">가벼운 활동량의 사역견</li>
												<li class="optionItem" value="8">중간 활동량의 사역견</li>
												<li class="optionItem" value="9">높은 활동량의 사역견</li>
												<li class="optionItem" value="10">임신 초기 성견</li>
												<li class="optionItem" value="11">임신 중기 이후 성견</li>
												<li class="optionItem" value="12">나이가 많은 성견</li>
											</ul>
										</div>
									</div>
									<!-- selectBox3 -->
									<div class="box">
										<div class="pet_jisu selectBoxes" id="cat_jisu" name="cat_jisu" style="display:none">
											<button class="label">반려묘 상태 선택</button>
											<ul class="optionList">
												<li class="optionItem" value="1">유아기(4개월 미만) 고양이</li>
												<li class="optionItem" value="2">고속 성장기(4 ~ 6개월) 고양이</li>
												<li class="optionItem" value="3">고속 성장기(7 ~ 12개월) 고양이</li>
												<li class="optionItem" value="4">중성화한 성묘</li>
												<li class="optionItem" value="5">중성화하지 않은 성묘</li>
												<li class="optionItem" value="6">체중 감량이 필요한 성묘</li>
												<li class="optionItem" value="7">활동량이 많은 성묘</li>
												<li class="optionItem" value="8">나이가 많은 성묘</li>
											</ul>
										</div>
									</div>
								</div>
							</span>
						</div>
					</div>
	
					<!-- 계산기 결과보기 버튼 -->
					<div class="cal_btn">
						<div class="cal_result" id="result_btn" onclick="result_view(3)"><a>결과보기</a></div>
					</div>
				</div>
	
				<!-- 계산기 결과 박스 -->
				<div class="cal_result_box" style="display:none">
		
					<!-- 칼로리 계산기 결과 -->
					<div class="cal_result_calorie">
	
						<div class="cal_result_calo">
							<span class="calo_img"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/calculator/result_img04.png" alt="저울" /></span>
							<dl>
								<dt>1일 기초 대사량</dt>
								<dd id="basic_meta">205kcal</dd>
							</dl>
						</div>
	
						<div class="cal_result_calo" >
							<span class="calo_img"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/calculator/result_img04.png" alt="저울" /></span>
							<dl>
								<dt>1일 권장 칼로리</dt>
								<dd id="basic_kal">1100kcal</dd>
							</dl>
						</div>
	
						<div class="calo_txt">
							<span class="calo_txt_b">※ 기초대사량</span> : 생물체가 생명을 유지하는데 필요한 최소한의 에너지량<br>
							<span class="calo_txt_b">※ 권장칼로리</span> : 몸을 움직이는 데 필요한 에너지인 작업 대사량을 위한 칼로리
						</div>
					</div>
		
					<!-- 계산기 다시하기 버튼-->
					<div class="cal_btn">
						<div class="cal_again" onclick="location.reload()"><a>다시하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- calorie_calculator 끝 -->

	<script src="${ path }/resources/js/calculator.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />