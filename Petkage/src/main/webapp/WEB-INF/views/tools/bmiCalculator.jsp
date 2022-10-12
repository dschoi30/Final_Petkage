<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<body>
    <!-- Bmi_calculator 시작 -->
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
						<li class='active'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/bmi_on.png"
										alt="비만도 계산기" /></span>
								<span class="cal_txt">비만도 계산</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/cal_off.png"
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
				<div class="cal_info_box" id="contents_tab_2">
		
					<!-- 계산기 정보 작성-->
					<div class="cal_write">
						<div class="content_write">
							<span class="content_write_input write_divline">
								<h5>반려동물 선택</h5>
								<div class="pet_choice">
									<input type="hidden" id="pet_type" name="pet_type">
									<ul id="pet_sel" name="pet_sel">
										<li class="pet_type_0 pet_off" id="dog_on" onclick="dog_on()" value="">
											<a>
												<img src="${ path }/resources/images/Laughing_Dog.png" alt="BCS_s01" />
												<p>강아지</p>
											</a>
										</li>
										<li class="pet_type_3 pet_off" id="cat_on" onclick="cat_on()" value="">
											<a>
												<img src="${ path }/resources/images/Laughing_Cat.png" alt="BCS_s01" />
												<p>고양이</p>
											</a>
										</li>
									</ul>
								</div>
							</span>
							<span class="content_write_input write_divline" id="cat_hide" style="display:none">
								<h5>몸무게 선택</h5>
								<div class="cal_choice">
									<fieldset>
										<input type="hidden" id="dog_type" name="animal_check">
										<label for="dog_type0">
											<input type="radio" class="dog_type_btn dog_type0" id="dog_type0"
												name="animal_check" value="dog_check0" onclick="weigh_choice(0)">
												<span>소(~ 9kg)</span>
										</label>
										<label for="dog_type1">
											<input type="radio" class="dog_type_btn dog_type1" id="dog_type1" 
												name="animal_check" value="dog_check1" onclick="weigh_choice(1)">
												<span>중(9 ~ 23kg)</span>
										</label>
										<label for="dog_type2">
											<input type="radio" class="dog_type_btn dog_type2" id="dog_type2" 
												name="animal_check" value="dog_check2" onclick="weigh_choice(2)">
												<span>대(23kg 이상)</span>
										</label>
									</fieldset>
								</div>
							</span>
							<span class="content_write_input write_divline">
								<h5>BCS 선택</h5>
								<div class="bcs_choice">
									<input type="hidden" id="bcs_type" name="bcs_type">
									<ul id="bcs_sel_dog_img">
										<li onclick="bcs_sel(0)" class="bcs_type_0"><a><img
													src="${ path }/resources/images/Dog_Fat1.png" alt="BCS_s01" /></a></li>
										<li onclick="bcs_sel(2)" class="bcs_type_2"><a><img
													src="${ path }/resources/images/Dog_Fat2.png" alt="BCS_s03" /></a></li>
										<li onclick="bcs_sel(4)" class="bcs_type_4"><a><img
													src="${ path }/resources/images/Dog_Fat3.png" alt="BCS_s05" /></a></li>
										<li onclick="bcs_sel(6)" class="bcs_type_6"><a><img
													src="${ path }/resources/images/Dog_Fat4.png" alt="BCS_s07" /></a></li>
										<li onclick="bcs_sel(8)" class="bcs_type_8"><a><img
													src="${ path }/resources/images/Dog_Fat5.png" alt="BCS_s09" /></a></li>
									</ul>
									<ul id="bcs_sel_cat_img" style="display:none">
										<li onclick="bcs_sel(0)" class="bcs_type_0"><a><img
													src="${ path }/resources/images/Cat_Fat1.png" alt="BCS_l01" /></a></li>
										<li onclick="bcs_sel(2)" class="bcs_type_2"><a><img
													src="${ path }/resources/images/Cat_Fat2.png" alt="BCS_l03" /></a></li>
										<li onclick="bcs_sel(4)" class="bcs_type_4"><a><img
													src="${ path }/resources/images/Cat_Fat3.png" alt="BCS_l05" /></a></li>
										<li onclick="bcs_sel(6)" class="bcs_type_6"><a><img
													src="${ path }/resources/images/Cat_Fat4.png" alt="BCS_l07" /></a></li>
										<li onclick="bcs_sel(8)" class="bcs_type_8"><a><img
													src="${ path }/resources/images/Cat_Fat5.png" alt="BCS_l09" /></a></li>
									</ul>
								</div>
							</span>
						</div>
					</div>
		
					<!-- 계산기 결과보기 버튼 -->
					<div class="cal_btn">
						<div class="cal_result" id="result_btn" onclick="result_view(2)"><a>결과보기</a></div>
					</div>
				</div>
		
				<!-- 계산기 결과 박스 -->
				<div class="cal_result_box" style="display:none">
		
					<!-- 비만도 계산기 결과 -->
					<div class="cal_result_obesity">
						<div class="cal_result_ob">
							<span class="cal_ob_img"><img src="http://appdata.hungryapp.co.kr/images/hatdog/img/calculator/result_img05.png" alt="체중계" /></span>
							<div id="dog_ob_1">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">멀리서 봐도 갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이 <br>
									두드러지게 보입니다.<br>
									한 눈에 보아도 체지방이 없어 보입니다.<br>
									몸 전체적으로 명백하게 근육이 없어 보입니다.
								</p>
							</div>
							<div id="dog_ob_2" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">멀리서 봐도 갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이 <br>
									두드러지게 보입니다.<br>
									한 눈에 보아도 체지방이 없어 보입니다.<br>
									몸 전체적으로 명백하게 근육이 없어 보입니다.
								</p>
							</div>
							<div id="dog_ob_3" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">멀리서 봐도 갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이 <br>
									두드러지게 보입니다.<br>
									한 눈에 보아도 체지방이 없어 보입니다.<br>
									몸 전체적으로 명백하게 근육이 없어 보입니다.
								</p>
							</div>
							<div id="dog_ob_4" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">멀리서 봐도 갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이 <br>
									두드러지게 보입니다.<br>
									한 눈에 보아도 체지방이 없어 보입니다.<br>
									몸 전체적으로 명백하게 근육이 없어 보입니다.
								</p>
							</div>
							<div id="dog_ob_5" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">멀리서 봐도 갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이 <br>
									두드러지게 보입니다.<br>
									한 눈에 보아도 체지방이 없어 보입니다.<br>
									몸 전체적으로 명백하게 근육이 없어 보입니다.
								</p>
							</div>
		
							<div id="cat_ob_1" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 두드러지게 보입니다.<br>
									만져지는 지방이 거의 없고, <br>
									갈비뼈가 불거진 것이 느집니다.<br>
									몸 전체적으로 근육 손실이 느껴집니다.
								</p>
							</div>
							<div id="cat_ob_2" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 두드러지게 보입니다.<br>
									만져지는 지방이 거의 없고, <br>
									갈비뼈가 불거진 것이 느집니다.<br>
									몸 전체적으로 근육 손실이 느껴집니다.
								</p>
							</div>
							<div id="cat_ob_3" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 두드러지게 보입니다.<br>
									만져지는 지방이 거의 없고, <br>
									갈비뼈가 불거진 것이 느집니다.<br>
									몸 전체적으로 근육 손실이 느껴집니다.
								</p>
							</div>
							<div id="cat_ob_4" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 두드러지게 보입니다.<br>
									만져지는 지방이 거의 없고, <br>
									갈비뼈가 불거진 것이 느집니다.<br>
									몸 전체적으로 근육 손실이 느껴집니다.
								</p>
							</div>
							<div id="cat_ob_5" style="display:none">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(너무 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 두드러지게 보입니다.<br>
									만져지는 지방이 거의 없고, <br>
									갈비뼈가 불거진 것이 느집니다.<br>
									몸 전체적으로 근육 손실이 느껴집니다.
								</p>
							</div>
							<span class="cal_ob_txt">※ BCS(Body Contdition Score)의 각 단계별 체중의 차이는 대략 10%입니다.</span>
						</div>
					</div>
		
					<!-- 계산기 다시하기 버튼-->
					<div class="cal_btn">
						<div class="cal_again" onclick="location.reload()"><a>다시하기</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Bmi_calculator 끝 -->

	<script src="${ path }/resources/js/calculator.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />