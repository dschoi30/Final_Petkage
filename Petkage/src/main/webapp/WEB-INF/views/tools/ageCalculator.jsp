<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<body>
	<!-- Age_calculator 시작 -->
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
						<li class='active'>
							<a href="${ path }/tools/ageCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/age_on.png"
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
				<div class="cal_info_box" id="contents_tab_1">
		
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
								<h5>생년월일 입력</h5>
								<input type="text" name="pet_date" id="pet_date" inputmode="numeric" pattern="[0-9]*"
									maxlength="10" xonkeyup="myFunction()"
									placeholder="반려동물의 생년월일을 입력해주세요. ex) 20221031" title="">
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
						</div>
					</div>
		
					<!-- 계산기 결과보기 버튼 -->
					<div class="cal_btn">
						<div class="cal_result" id="result_btn" onclick="result_view(1)"><a>결과보기</a></div>
					</div>
				</div>
		
				<!-- 계산기 결과 박스 -->
				<div class="cal_result_box" style="display:none">
		
					<!-- 나이 계산기 결과 -->
					<div class="cal_result_age" id="dog_life">
						<div class="age_circle">
							<span class="age_img"><img src="${ path }/resources/images/common/Laughing_Dog.png" alt="강아지" /></span>
							<span class="age_number" id="dog_age">1살</span>
						</div>
		
						<div class="age_same"><img
								src="http://appdata.hungryapp.co.kr/images/hatdog/img/calculator/result_img03.png"
								alt="같다" /></div>
		
						<div class="age_circle">
							<!-- ! 이미지 수정하기 -->
							<span class="age_img"><img class="human_img" id="dog_to_human" src="${ path }/resources/images/Agegroup_W1.png" alt="사람" /></span>
							<span class="age_number" id="dog_age_cal">몇 살</span>
						</div>
		
						<div class="age_lifecycle" id="dog_lifecycle">기</div>
					</div>
		
					<div class="cal_result_age" id="cat_life" style="display:none">
						<div class="age_circle">
							<span class="age_img"><img src="${ path }/resources/images/common/Laughing_Cat.png" alt="고양이" /></span>
							<span class="age_number" id="cat_age">1살</span>
						</div>
		
						<div class="age_same"><img
								src="http://appdata.hungryapp.co.kr/images/hatdog/img/calculator/result_img03.png"
								alt="같다" /></div>
		
						<div class="age_circle">
							<!-- ! 이미지 수정하기 -->
							<span class="age_img"><img class="human_img" id="cat_to_human" src="${ path }/resources/images/.png" alt="사람" /></span>
							<span class="age_number" id="cat_age_cal">몇 살</span>
						</div>
		
						<div class="age_lifecycle" id="cat_lifecycle">기</div>
					</div>
		
					<!-- 계산기 다시하기 버튼-->
					<div class="cal_btn">
						<div class="cal_again" onclick="location.reload()"><a>다시하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Age_calculator 끝 -->
	
	<script>
	
	function parseType(type) {
		switch (type) {
		case 0:
			type = '강아지 소'
				break;
		case 1:
			type = '강아지 중'
				break;
		case 2:
			type = '강아지 대'
				break;
		case 3:
			type = '고양이'
				break;
		default:
		}
		return type;
	}

	var cellBirth = document.getElementById('pet_date');
		cellBirth.onkeyup = function(event){
		event = event || window.event;
		var _val = this.value.trim();
	}

	function result_view(tab_id) {
		var pet_type = $('input[name="pet_type"]').val();

		var dog_on = $("#dog_on").val();
		var cat_on = $("#cat_on").val();

		var pet_date = $('input[name="pet_date"]').val().replace(/\./g, '-');
		var dog_type = $('input[name="animal_check"]').val();

		if (tab_id == 1) {
			if (!pet_type) {
				alert("반려동물을 선택해주세요.")
			} else  {
				if(dog_on === 0 && cat_on === 0) { // 강아지 일 때
					if (!pet_date) {
						alert("생년월일을 입력해주세요.");
						$('input[name="pet_date"]').focus()
						return;
					} else if (!dog_type) {
						alert("몸무게를 선택해주세요.");
						return;
					} 

					if (!isBirthday(pet_date)) { //생년월일 유효성 검사
						return;
					}
					
					if (pet_date && dog_type && isBirthday(pet_date)) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();

						$("#dog_life").show();
						$("#cat_life").hide();

						$("#dog_age").html(petAges(pet_date));
						console.log("댕 나이 : " + petAges(pet_date));

						$("#dog_age_cal").html(dogToHumanAge(pet_date));
						console.log("댕 사람나이 : " + dogToHumanAge(pet_date));

						$("#dog_lifecycle").html(dogAgeGroup(pet_date));
						console.log("댕 시기 : " + dogAgeGroup(pet_date));
					}
					
				} else { // 고양이 일 때 
					if (!pet_date) {
						alert("생년월일을 입력해주세요.");
						$('input[name="pet_date"]').focus()
						return;
					}
					
					if (!isBirthday(pet_date)) { //생년월일 유효성 검사
						return;
					}

					if (pet_date && isBirthday(pet_date)) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();

						$("#cat_life").show();
						$("#dog_life").hide();

						$("#cat_age").html(petAges(pet_date));
						console.log("냥 나이 : " + petAges(pet_date));

						$("#cat_age_cal").html(catToHumanAge(pet_date));
						console.log("냥 사람나이 : " + catToHumanAge(pet_date));

						$("#cat_lifecycle").html(catAgeGroup(pet_date));
						console.log("냥 시기 : " + catAgeGroup(pet_date));
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
		$("#cat_hide").show();
		$('input[name="pet_type"]').attr('value','강아지');
		$("[name=animal_check]").attr("disabled", false);
		$('#cat_on').attr('value','');
	}

	function cat_on() {
		console.log("고영희 클릭");
		console.log($("#cat_on").val());
		console.log($('input[name="pet_type"]').val());

		$("#cat_on").addClass("pet_on");
		$("#dog_on").removeClass("pet_on");
		$("#cat_hide").hide();
		$('input[name="pet_type"]').attr('value','고양이');
		$("[name=animal_check]").attr("disabled", true);
		$('#cat_on').attr('value','3');
	}

	function weigh_choice(no) { 
        console.log(no + $("#dog_type").val(no));

        $("#dog_type"+no).val(no);
    }

	function isBirthday(dateStr) {
		$("#birth_chk_str").hide();
		dateStr = dateStr.replace(/[^0-9]/g, '');
		var year = Number(dateStr.substr(0, 4)); // 입력한 값의 0~4자리까지 (연) 
		var month = Number(dateStr.substr(4, 2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월) 
		var day = Number(dateStr.substr(6, 2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일) 
		var today = new Date(); // 날짜 변수 선언 
		var yearNow = today.getFullYear(); // 올해 연도 가져옴 

		if (dateStr.length <= 10) { // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다. 
			if (1900 > year || year > yearNow) {
				alert("날짜형식이 다릅니다.");
				$('input[name="pet_date"]').focus()
				return false;
			} else if (month < 1 || month > 12) {
				alert("날짜형식이 다릅니다.");
				$('input[name="pet_date"]').focus()
				return false;
			} else if (day < 1 || day > 31) {
				alert("날짜형식이 다릅니다.");
				$('input[name="pet_date"]').focus()
				return false;
			} else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
				alert("날짜형식이 다릅니다.");
				$('input[name="pet_date"]').focus()
				return false;
			} else if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day > 29 || (day == 29 && !isleap)) {
					alert("날짜형식이 다릅니다.");
					$('input[name="pet_date"]').focus()
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			}
		} else { //1.입력된 생년월일이 8자 초과할때 : auth:false 
			alert("날짜형식이 다릅니다.");
			$('input[name="pet_date"]').focus()
			return false;
		}
	}

	function petAges(birth) {
		var date = new Date; // 날짜 변수 선언
		var year = date.getFullYear(); 
		var month = (date.getMonth() + 1); 
		var day = date.getDate();

		var today = new Date(year, month, day);
		console.log("오늘 : " + today);

		var birth = birth.replace(/[^0-9]/g, '');
		var birthdayy = birth.substr(0, 4); 
		var birthdaym = birth.substr(4, 2);
		var birthdayd = birth.substr(6, 2);

		var birthday = new Date(birthdayy, birthdaym, birthdayd);
		console.log("생일 : " + birthday);

		var dif = today - birthday; // 두 날짜의 차이
		var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		var cMonth = cDay * 30;// 월 만듬
		var cYear = cMonth * 12; // 년 만듬
		
		console.log("차이 : " + dif);
		
		if (parseInt(dif/cYear) > 0) {
			console.log(parseInt(dif/cYear));
			age = parseInt(dif/cYear) + "살";
		} else {
			console.log(parseInt(dif/cMonth));
			age = parseInt(dif/cMonth) + "개월";
		}

		return age;
	}

	function dogAgeGroup(age) {
		petAge = petAges(age);

		if (petAge == '0개월' || petAge == '1개월' || petAge == '2개월' || 
			petAge == '3개월' || petAge == '4개월') {
			$('#dog_to_human').attr('src','${ path }/resources/images/common/age1_1.png');
			group = "영유아기"

		} else if (petAge == '5개월' || petAge == '6개월' || petAge == '7개월' || petAge == '8개월' ||
					petAge == '9개월' || petAge == '10개월' || petAge == '11개월' || petAge == '1살') {
			document.getElementById("dog_to_human").src = "${ path }/resources/images/common/age2_1.png"
			group = "아동 청소년기"
		} else if (petAge == '2살' || petAge == '3살' || petAge == '4살') {
			document.getElementById("dog_to_human").src = "${ path }/resources/images/common/age3_1.png"
			group = "청년기"
		} else if (petAge == '5살' || petAge == '6살' || petAge == '7살' || 
					petAge == '8살' || petAge == '9살' || petAge == '10살') {
			document.getElementById("dog_to_human").src = "${ path }/resources/images/common/age4_1.png"
			group = "중장년기"
		} else {
			document.getElementById("dog_to_human").src = "${ path }/resources/images/common/age5_1.png"
			group = "노년기"
		}
		return group
	}

	function catAgeGroup(age) {
		petAge = petAges(age);

		if (petAge == '0개월' || petAge == '1개월' || petAge == '2개월' ||
			petAge == '3개월' || petAge == '4개월') {
			document.getElementById("cat_to_human").src = "../resources/images/common/age1_2.png"
			group = "영유아기"
		} else if (petAge == '5개월' || petAge == '6개월' || petAge == '7개월' || petAge == '8개월' ||
					petAge == '9개월' || petAge == '10개월' || petAge == '11개월' || petAge == '1살') {
			document.getElementById("cat_to_human").src = "${ path }/resources/images/common/age2_2.png"
			group = "아동 청소년기"
		} else if (petAge == '2살' || petAge == '3살' || petAge == '4살') {
			document.getElementById("cat_to_human").src = "${ path }/resources/images/common/age3_2.png"
			group = "청년기"
		} else if (petAge == '5살' || petAge == '6살' || petAge == '7살' || 
					petAge == '8살' || petAge == '9살' || petAge == '10살' || 
					petAge == '11살' || petAge == '12살') {
			document.getElementById("cat_to_human").src = "${ path }/resources/images/common/age4_2.png"
			group = "중장년기"
		} else {
			document.getElementById("cat_to_human").src = "${ path }/resources/images/common/age5_2.png"
			group = "노년기"
		}
		return group
	}

	function dogToHumanAge(age) {
		petAge = petAges(age);
		var dogType_no = $('input[name="animal_check"]').val();

		if (petAge == '0개월' || petAge == '1개월') {
			age = "1살"
		} else if (petAge == '2개월') {
			age = "2살"
		} else if (petAge == '3개월') {
			age = "5살"
		} else if (petAge == '4개월') {
			age = "6살"
		} else if (petAge == '5개월') {
			age = "8살"
		} else if (petAge == '6개월') {
			age = "10살"
		} else if (petAge == '7개월') {
			age = "11살"
		} else if (petAge == '8개월') {
			age = "12살"
		} else if (petAge == '9개월') {
			age = "13살"
		} else if (petAge == '10개월') {
			age = "14살"
		} else if (petAge == '11개월') {
			age = "15살"
		} else if (petAge == '1살') {
			age = "16살"
		} else if (petAge == '2살') {
			age = "24살"
		} 
		else {
			var agelength = petAge.length;
			var basicAge = 24;

			if (agelength < 3) {
				var ageNum = parseInt(petAge.substr(0,1)); // petAge의 숫자만 추출

				console.log("1자리 나이 : " + ageNum);

				if (ageNum) {
					if (dogType_no == 0) {
						age = (basicAge + (5 * (ageNum - 2))) + "살"
					} else if (dogType_no == 1) {
						age = (basicAge + (6 * (ageNum - 2))) + "살"
					} else if (dogType_no == 2) {
						age = (basicAge + (7 * (ageNum - 2))) + "살"
					}
				}
			} else if (agelength == 3) {
				var ageNum = parseInt(petAge.substr(0,2)); // petAge의 숫자만 추출

				console.log("2자리 나이 : " + ageNum);

				if (ageNum) {
					if (dogType_no == 0) {
						age = (basicAge + (5 * (ageNum - 2))) + "살"
					} else if (dogType_no == 1) {
						age = (basicAge + (6 * (ageNum - 2))) + "살"
					} else if (dogType_no == 2) {
						age = (basicAge + (7 * (ageNum - 2))) + "살"
					}
				}
			} else if (agelength > 3) {
				var ageNum = parseInt(petAge.substr(0,3)); // petAge의 숫자만 추출

				console.log("3자리 나이 : " + ageNum);

				if (ageNum) {
					if (dogType_no == 0) {
						age = (basicAge + (5 * (ageNum - 2))) + "살"
					} else if (dogType_no == 1) {
						age = (basicAge + (6 * (ageNum - 2))) + "살"
					} else if (dogType_no == 2) {
						age = (basicAge + (7 * (ageNum - 2))) + "살"
					}
				}
			}
		}
		return age
	}

	function catToHumanAge(age) {
		petAge = petAges(age);

		if (petAge == '0개월' || petAge == '1개월') {
			age = "1살"
		} else if (petAge == '2개월') {
			age = "3살"
		} else if (petAge == '3개월') {
			age = "5살"
		} else if (petAge == '4개월') {
			age = "6살"
		} else if (petAge == '5개월') {
			age = "8살"
		} else if (petAge == '6개월') {
			age = "9살"
		} else if (petAge == '7개월') {
			age = "10살"
		} else if (petAge == '8개월') {
			age = "11살"
		} else if (petAge == '9개월') {
			age = "12살"
		} else if (petAge == '10개월') {
			age = "13살"
		} else if (petAge == '11개월') {
			age = "14살"
		} else if (petAge == '1살') {
			age = "15살"
		} else if (petAge == '2살') {
			age = "24살"
		} else {
			var agelength = petAge.length;
			var basicAge = 24;

			if (agelength < 3) {
				var ageNum = parseInt(petAge.substr(0,1)); // petAge의 숫자만 추출
				console.log("1자리 나이 : " + ageNum);

				age = (basicAge + (4 * (ageNum - 2))) + "살"
			} else if (agelength == 3) {
				var ageNum = parseInt(petAge.substr(0,2)); // petAge의 숫자만 추출
				console.log("2자리 나이 : " + ageNum);

				age = (basicAge + (4 * (ageNum - 2))) + "살"
			} else if (agelength > 3) {
				var ageNum = parseInt(petAge.substr(0,3)); // petAge의 숫자만 추출
				console.log("3자리 나이 : " + ageNum);

				age = (basicAge + (4 * (ageNum - 2))) + "살"
			}		
		}
		return age
	}

	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />