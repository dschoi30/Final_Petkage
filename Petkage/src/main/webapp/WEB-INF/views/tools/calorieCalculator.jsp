<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<style>
	.tc .selectBoxes {
	    display: inline-block;
	    position: relative;
	    width: 300px;
	    height: 35px;
	    margin: 10px;
	    background: url("${ path }/resources/images/common/arrow_down.png") calc(100% - 7px) center no-repeat;
	    border-radius: 4px;
	    border: 2px solid #E3B7A0;
	    background-size: 20px;
	    cursor: pointer;
	}
</style>
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
						<li class='active'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/cal_on.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='inactive'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/common/dic_off.png"
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
									<ul id="pet_sel" name="pet_sel">
										<li class="pet_type_0 pet_off" id="dog_on" onclick="dog_on()" value="">
											<a>
												<img src="${ path }/resources/images/common/Laughing_Dog.png" alt="BCS_s01" />
												<p>강아지</p>
											</a>
										</li>
										<li class="pet_type_3 pet_off" id="cat_on" onclick="cat_on()" value="">
											<a>
												<img src="${ path }/resources/images/common/Laughing_Cat.png" alt="BCS_s01" />
												<p>고양이</p>
											</a>
										</li>
									</ul>
								</div>
							</span>
							<span class="content_write_input write_divline">
								<h5>몸무게 입력</h5>
								<input type="text" name="pet_weight" id="pet_weight" inputmode="numeric" pattern="[0-9]*" placeholder="kg단위로 입력해주세요" title="">
							</span>
							<span class="content_write_input write_divline">
								<h5>반려동물 상태</h5>
								<div class="selectBoxList">
									<!-- selectBox1 -->
									<div class="box">
										<div class="pet_jisu selectBoxes" id="pet_jisu" name="pet_jisu">
											<button class="label">반려동물 상태 선택</button>
											<ul class="optionList" id="pet_option" name="pet_option">
												<li class="optionItem">반려동물 상태 선택</li>
											</ul>
										</div>
									</div>
									<!-- selectBox2 -->
									<div class="box">
										<div class="pet_jisu selectBoxes" id="dog_jisu" name="dog_jisu" style="display:none">
											<button class="label">반려견 상태 선택</button>
											<ul class="optionList" id="dog_option" name="dog_option">
												<li class="optionItem" id="dog_option_0" onclick="dogSel(0)">성장기(4개월 미만) 강아지</li>
												<li class="optionItem" id="dog_option_1" onclick="dogSel(1)">성장기(4 ~ 12개월) 강아지</li>
												<li class="optionItem" id="dog_option_2" onclick="dogSel(2)">중성화한 성견</li>
												<li class="optionItem" id="dog_option_3" onclick="dogSel(3)">중성화하지 않은 성견</li>
												<li class="optionItem" id="dog_option_4" onclick="dogSel(4)">체중 감량이 필요한 성견</li>
												<li class="optionItem" id="dog_option_5" onclick="dogSel(5)">체중 증량이 필요한 성견</li>
												<li class="optionItem" id="dog_option_6" onclick="dogSel(6)">가벼운 활동량의 사역견</li>
												<li class="optionItem" id="dog_option_7" onclick="dogSel(7)">중간 활동량의 사역견</li>
												<li class="optionItem" id="dog_option_8" onclick="dogSel(8)">높은 활동량의 사역견</li>
												<li class="optionItem" id="dog_option_9" onclick="dogSel(9)">임신 초기 성견</li>
												<li class="optionItem" id="dog_option_10" onclick="dogSel(10)">임신 중기 이후 성견</li>
												<li class="optionItem" id="dog_option_11" onclick="dogSel(11)">나이가 많은 성견</li>
											</ul>
										</div>
									</div>
									<!-- selectBox3 -->
									<div class="box">
										<div class="pet_jisu selectBoxes" id="cat_jisu" name="cat_jisu" style="display:none">
											<button class="label">반려묘 상태 선택</button>
											<ul class="optionList" id="cat_option" name="cat_option">
												<li class="optionItem" id="cat_option_0" onclick="catSel(0)">유아기(4개월 미만) 고양이</li>
												<li class="optionItem" id="cat_option_1" onclick="catSel(1)">고속 성장기(4 ~ 6개월) 고양이</li>
												<li class="optionItem" id="cat_option_2" onclick="catSel(2)">고속 성장기(7 ~ 12개월) 고양이</li>
												<li class="optionItem" id="cat_option_3" onclick="catSel(3)">중성화한 성묘</li>
												<li class="optionItem" id="cat_option_4" onclick="catSel(4)">중성화하지 않은 성묘</li>
												<li class="optionItem" id="cat_option_5" onclick="catSel(5)">체중 감량이 필요한 성묘</li>
												<li class="optionItem" id="cat_option_6" onclick="catSel(6)">활동량이 많은 성묘</li>
												<li class="optionItem" id="cat_option_7" onclick="catSel(7)">나이가 많은 성묘</li>
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

	<script type="text/javascript">
	
	function result_view(tab_id) {
		var pet_type = $('input[name="pet_type"]').val();

		var dog_on = $("#dog_on").val();
		var cat_on = $("#cat_on").val();

		var pet_weight = $('input[name="pet_weight"]').val().replace(/\./g,'-');

		var dog_jisu = $("#dog_option").val();
		var cat_jisu = $("#cat_option").val();

		if (tab_id == 3) {
			if (!pet_type) {
				alert("반려동물을 선택해주세요.")
			} else  {
				if(dog_on === 0 && cat_on === 0) { // 강아지 일 때
					if (!pet_weight) {
						alert("몸무게를 입력해주세요.");
						$('input[name="pet_weight"]').focus()
						return;
					} else if (!dog_jisu) {
						alert("반려동물 상태를 선택해주세요.");
						return;
					} 
					
					if (pet_weight && dog_jisu) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();

						$("#basic_meta").html(calcWeight(pet_weight) + "kcal");
						console.log("댕 기초 대사량 : " + calcWeight(pet_weight) + "kcal");

						$("#basic_kal").html((calcWeight(pet_weight) * dogSel(dog_jisu)) + "kcal");
						console.log("댕 하루 칼로리 : " + (calcWeight(pet_weight) * dogSel(dog_jisu)) + "kcal");
					}
					
				} else { // 고양이 일 때 
					if (!pet_weight) {
						alert("몸무게를 입력해주세요.");
						$('input[name="pet_weight"]').focus()
						return;
					} else if (!cat_jisu) {
						alert("반려동물 상태를 선택해주세요.");
						return;
					}

					if (pet_weight && cat_jisu) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();

						$("#basic_meta").html(calcWeight(pet_weight) + "kcal");
						console.log("냥 기초 대사량 : " + calcWeight(pet_weight) + "kcal");

						$("#basic_kal").html((calcWeight(pet_weight) * catSel(cat_jisu)) + "kcal");
						console.log("냥 하루 칼로리 : " + (calcWeight(pet_weight) * catSel(cat_jisu)) + "kcal");
					}
				}
			}
		}
	}

	function dog_on() {
		console.log("강쥐 클릭");
		console.log($("#dog_on").val());
		console.log($('input[name="pet_type"]').val());

		$("#dog_on").addClass("pet_on");
		$("#cat_on").removeClass("pet_on");
		$('input[name="pet_type"]').attr('value','강아지');
		$('#cat_on').attr('value','');

		$("#pet_jisu").hide();
		$("#dog_jisu").show();
		$("#cat_jisu").hide();
	}

	function cat_on() {
		console.log("고영희 클릭");
		console.log($("#cat_on").val());
		console.log($('input[name="pet_type"]').val());

		$("#cat_on").addClass("pet_on");
		$("#dog_on").removeClass("pet_on");
		$('input[name="pet_type"]').attr('value','고양이');
		$('#cat_on').attr('value','3');

		$("#pet_jisu").hide();
		$("#cat_jisu").show();
		$("#dog_jisu").hide();
	}

	// 몸무게 값으로 기초대사량 구하기
	function calcWeight(weight) {
		var weight = weight.replace(/[^0-9]/g, '');
		var RER = 0;
	
		// 기초 대사량 (RER)
		// 2kg ~ 45kg (체중 * 30) + 70 , 그 외 (체중 * 0.75) * 70
		if ( 2 <= weight && weight <= 45) {
			RER = (weight * 30) + 70;
		} else {
			RER = (weight * 0.75) * 70;
		}

		return RER;
	}

	// 강아지 수치
	function dogSel(no) {
		console.log(no + $("#dog_option").val(no));
		console.log("타입 번호 : " + no);

		switch (no) {
		case 0: // 성장기(4개월 미만) 강아지
			jisu = 3;
				break;
		case 1: // 성장기(4 ~ 12개월) 강아지
			jisu = 2;
				break;
		case 2: // 중성화한 성견
			jisu = 1.6;
				break;
		case 3: // 중성화하지 않은 성견
			jisu = 1.8;
				break;
		case 4: // 체중 감량이 필요한 성견
			jisu = 1;
				break;
		case 5: // 체중 증량이 필요한 성견
			jisu = 1.7;
				break;
		case 6: // 가벼운 활동량의 사역견
			jisu = 2;
				break;
		case 7: // 중간 활동량의 사역견
			jisu = 3;
				break;
		case 8: // 높은 활동량의 사역견
			jisu = 4;
				break;
		case 9: // 임신 초기 성견
			jisu = 1.8;
				break;
		case 10: // 임신 중기 이후 성견
			jisu = 3;
				break;
		case 11: // 나이가 많은 성견
			jisu = 1.3;
				break;
		default:
		}
		console.log("지수 : " + jisu);
		return jisu;
	}

	// 고양이 수치
	function catSel(no) {
		console.log(no + $("#cat_option").val(no));
		console.log("타입 번호 : " + no);

		switch (no) {
		case 0: // 유아기(4개월 미만) 고양이
			jisu = 3;
				break;
		case 1: // 고속 성장기(4 ~ 6개월) 고양이
			jisu = 2.5;
				break;
		case 2: // 고속 성장기(7 ~ 12개월) 고양이
			jisu = 2;
				break;
		case 3: // 중성화한 성묘
			jisu = 1.2;
				break;
		case 4: // 중성화하지 않은 성묘
			jisu = 1.4;
				break;
		case 5: // 체중 감량이 필요한 성묘
			jisu = 0.8;
				break;
		case 6: // 활동량이 많은 성묘
			jisu = 1.6;
				break;
		case 7: // 나이가 많은 성묘
			jisu = 0.7;
				break;
		default:
		}
		console.log("지수 : " + jisu);
		return jisu;
	}
	
	// 펫 상태 셀렉트 박스
	const label = document.querySelectorAll('.label');

	label.forEach(function(lb){
		lb.addEventListener('click', e => {
			let optionList = lb.nextElementSibling;
			let optionItems = optionList.querySelectorAll('.optionItem');
			clickLabel(lb, optionItems);
		})
	});

	const clickLabel = (lb, optionItems) => {
		if(lb.parentNode.classList.contains('active')) {
			lb.parentNode.classList.remove('active');
			optionItems.forEach((opt) => {
				opt.removeEventListener('click', () => {
					handleSelect(lb, opt)
				})
			})
		} else {
			lb.parentNode.classList.add('active');
			optionItems.forEach((opt) => {
				opt.addEventListener('click', () => {
					handleSelect(lb, opt)
				})
			})
		}
	}

	const handleSelect = (label, item) => {
		label.innerHTML = item.textContent;
		label.parentNode.classList.remove('active');
	}

	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />