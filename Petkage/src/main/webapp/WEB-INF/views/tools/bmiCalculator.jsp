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
								<span class="cal_icon"><img src="${ path }/resources/images/common/age_off.png"
										alt="나이 계산기" /></span>
								<span class="cal_txt">나이 계산</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/bmiCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/common/bmi_on.png"
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
										<li onclick="bcs_sel(0)" id="dog_bcs_type_0" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Dog_Fat1.png" alt="BCS_d01" value=""/></a></li>
										<li onclick="bcs_sel(1)" id="dog_bcs_type_1" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Dog_Fat2.png" alt="BCS_d02" value=""/></a></li>
										<li onclick="bcs_sel(2)" id="dog_bcs_type_2" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Dog_Fat3.png" alt="BCS_d03" value="" /></a></li>
										<li onclick="bcs_sel(3)" id="dog_bcs_type_3" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Dog_Fat4.png" alt="BCS_d04" value=""/></a></li>
										<li onclick="bcs_sel(4)" id="dog_bcs_type_4" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Dog_Fat5.png" alt="BCS_d05" value=""/></a></li>
									</ul>
									<ul id="bcs_sel_cat_img" style="display:none">
										<li onclick="bcs_sel(5)" id="cat_bcs_type_5" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Cat_Fat1.png" alt="BCS_c01" value=""/></a></li>
										<li onclick="bcs_sel(6)" id="cat_bcs_type_6" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Cat_Fat2.png" alt="BCS_c02" value=""/></a></li>
										<li onclick="bcs_sel(7)" id="cat_bcs_type_7" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Cat_Fat3.png" alt="BCS_c03" value=""/></a></li>
										<li onclick="bcs_sel(8)" id="cat_bcs_type_8" class="bcs_off"><a><img
													src="${ path }/resources/images/common/Cat_Fat4.png" alt="BCS_c04" value=""/></a></li>
										<li onclick="bcs_sel(9)" id="cat_bcs_type_9" class="bcs_off"> <a><img
													src="${ path }/resources/images/common/Cat_Fat5.png" alt="BCS_c05" value=""/></a></li>
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
							<div id="pet_ob_1">
								<dl>
									<dt id="bsc_type_str1">1단계</dt>
									<dd id="bsc_type_str2">(매우 마름, 심한 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈를 비롯한 몸의 뼈들이<br>
									두드러지게 보입니다. <br>
									체지방이 없어 보이고,<br>
									몸 전체적으로 근육이 없어 보입니다.
								</p>
							</div>
							<div id="pet_ob_2" style="display:none">
								<dl>
									<dt id="bsc_type_str1">2단계</dt>
									<dd id="bsc_type_str2">(마름, 저체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈, 척추뼈, 골반뼈가 밖에서 보이며 쉽게 만져집니다.<br>
									갈비뼈를 만졌을 때 만져지는 지방이 거의 없습니다.<br>
									옆에서 보면 허리가 매우 잘록하게 들어가 있고,<br>
									앞에서 보면 복부가 매우 잘록해 보입니다.
								</p>
							</div>
							<div id="pet_ob_3" style="display:none">
								<dl>
									<dt id="bsc_type_str1">3단계</dt>
									<dd id="bsc_type_str2">(정상 체중)</dd>
								</dl>
								<p id="bsc_type_str3">갈비뼈 아래로 약간의 피하지방이 느껴집니다.<br>
									지방 아래로 갈비뼈가 쉽게 만져집니다.<br>
									위에서 보면 허리를 쉽게 알아차릴 수 있습니다.<br>
									옆에서 보면 복부가 뚜렷한 곡선을 그리며 올라갑니다.
								</p>
							</div>
							<div id="pet_ob_4" style="display:none">
								<dl>
									<dt id="bsc_type_str1">4단계</dt>
									<dd id="bsc_type_str2">(과체중)</dd>
								</dl>
								<p id="bsc_type_str3">척추와 꼬리 부분에 많은 지방이 있어 보입니다.<br>
									갈비뼈 아래의 지방이 두꺼워 힘을 주어야 뼈가 만져집니다.<br>
									위에서 보면 허리가 잘 구분되지 않습니다.<br>
									옆에서 보면 복부의 굴곡이 보이지 않습니다.
								</p>
							</div>
							<div id="pet_ob_5" style="display:none">
								<dl>
									<dt id="bsc_type_str1">5단계</dt>
									<dd id="bsc_type_str2">(고도 비만)</dd>
								</dl>
								<p id="bsc_type_str3">흉부, 척추, 꼬리, 다리, 목 부분에 지방이 매우 많아 살이 접힙니다.<br>
									피하지방이 몸 전체에 많아서, 갈비뼈를 찾기 어렵습니다.<br>
									위에서 보면 허리가 없거나 바깥으로 튀어 나와 있습니다.<br>
									옆에서 보면 복부가 아래로 쳐져 있습니다.
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

	<script type="text/javascript">

	function result_view(tab_id) {
    var pet_type = $('input[name="pet_type"]').val();

    var dog_on = $("#dog_on").val();
    var cat_on = $("#cat_on").val();

    var dog_type = $('input[name="animal_check"]').val();

    var bcs_type = $('#bcs_type').val();

    if (tab_id == 2) {
			if (!pet_type) {
				alert("반려동물을 선택해주세요.")
			} else  {
				if(dog_on === 0 && cat_on === 0) { // 강아지 일 때
					if (!bcs_type) {
						alert("BCS를 선택해주세요.");
						return;
					} else if (!dog_type) {
						alert("몸무게를 선택해주세요.");
						return;
					} 
					
					if (bcs_type && dog_type) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();
					
						$("#bsc_type_str1").html(r.msg_pc[0]);
						$("#bsc_type_str2").html(r.msg_pc[1]);
						$("#bsc_type_str3").html(r.msg_pc[2]);
					}
					
				} else { // 고양이 일 때 
					if (!bcs_type) {
						alert("BCS를 선택해주세요.");
						return;
					}

					if (bcs_type) {
						$(".cal_result_box").show();
						$(".cal_info_box").hide();

						$("#bsc_type_str1").html(r.msg_pc[0]);
						$("#bsc_type_str2").html(r.msg_pc[1]);
						$("#bsc_type_str3").html(r.msg_pc[2]);
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
		$("#bcs_sel_dog_img").show();
		$("#bcs_sel_cat_img").hide();
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
		$("#bcs_sel_cat_img").show();
		$("#bcs_sel_dog_img").hide();
		$('input[name="pet_type"]').attr('value','고양이');
		$("[name=animal_check]").attr("disabled", true);
		$('#cat_on').attr('value','3');
	}

	function weigh_choice(no) { 
        console.log(no + $("#dog_type").val(no));

        $("#dog_type"+no).val(no);
    }

	function bcs_sel(no) { 
		console.log($('input[name="bcs_type"]').val());
		console.log(no + $("#bcs_sel_dog_img").val(no));
		console.log("타입 번호 : " + no);

		if (0 <= no && no <= 4) { // 강아지 비만도 선택
			$('input[name="bcs_type"]').attr('value',("강아지 BCS" + no));
			$("#dog_bcs_type"+"_"+no).attr('value', no );
			console.log("댕 타입 : " + $("#dog_bcs_type_"+no).val());

			$(".bcs_off").removeClass("bcs_on");
			$("#dog_bcs_type_" + no).addClass("bcs_on");

		} else if (5 <= no && no <= 9) { // 고양이 비만도 선택
			$('input[name="bcs_type"]').attr('value',("고양이 BCS" + no));
			$("#cat_bcs_type"+"_"+no).attr('value', no );
			console.log("냥 타입 : " + $("#cat_bcs_type_"+no).val());

			$(".bcs_off").removeClass("bcs_on");
			$("#cat_bcs_type_" + no).addClass("bcs_on");
		}
	}	

 function {

 }


	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />