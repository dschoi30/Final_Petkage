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
						<li class='inactive'>
							<a href="${ path }/tools/calorieCalculator">
								<span class="cal_icon"><img src="${ path }/resources/images/cal_off.png"
										alt="권장 칼로리" /></span>
								<span class="cal_txt">권장 칼로리</span>
							</a>
						</li>
						<li class='active'>
							<a href="${ path }/tools/foodDictionary">
								<span class="cal_icon"><img src="${ path }/resources/images/dic_on.png"
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
				<div class="cal_info_box" id="contents_tab_4">

					<!-- 계산기 정보 작성-->
					<div class="cal_write">
						<div class="content_write box_no_line">
							<div id="search_box_cover">
								<form method="get" action="">
									<div class="tb">
										<div class="td"><input type="text" placeholder="이거 먹어도 되나요?" required></div>
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
				</div>

				<!-- 계산기 결과 박스 -->
				<div class="cal_result_box">

					<div class="cal_result_dictionary">
						<!-- 나이 계산기 결과 --> 
						
						<div class="dic_comment">
							<div class="cal_result_dic">
								<div class="emotion_G">
									<svg class="good" width="44px" height="44px" viewBox="0 0 44 44" version="1.1" >
										<g id="good" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(0, 0)">
											<circle id="gBody" cx="22" cy="22" r="22"></circle>
											<g class="scaleFace">
												<g class="face">  
													<ellipse id="Eye-right" fill="#2C0E0F" cx="29.0875" cy="21.75" rx="1.89926471" ry="1.75"></ellipse>
													<ellipse id="Eye-left" fill="#2C0E0F" cx="14.8992647" cy="21.75" rx="1.89926471" ry="1.75"></ellipse>
													<path id="gMouth" fill="#2C0E0F" d="M21.8941176,27.8819633 C24.8588235,27.8819632 25.4941176,25.5404999 25.4941176,24.5648901 C25.4941176,23.5892803 24.4352941,23.9795242 22.1058824,23.9795242 C19.7764706,23.9795242 18.2941176,23.5892803 18.2941176,24.5648901 C18.2941176,25.5404999 18.9294118,27.8819633 21.8941176,27.8819633 Z"></path>
													<ellipse id="Tung" fill="#E23D18" cx="21.8941176" cy="26.4390244" rx="1.69411765" ry="0.780487805"></ellipse>
												</g>
											</g> 
										</g>
									</svg>
								</div>
								<p><span class="spread_underline under_G">먹어도 돼요!</span></p>
								<dl>
									<dt class="data_G searchWord">망고</dt>
									<dd id="basic_meta">
									비타민 A, C, D와 식이섬유 및 황산화 물질이
									풍부하게 함유되어 있어
									강아지가 섭취할 경우 
									시력 개선 및 변비 개선, 모질과 면역력 강화에 도움이 된다.
									</dd>
								</dl>	
							</div>
	
							<div class="cal_result_dic">
								<div class="emotion_S" >
									<svg class="soso" width="44px" height="44px" viewBox="0 0 44 44" version="1.1">
										<g id="soso" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<circle id="sBody" cx="22" cy="22" r="22"></circle>
											<g class="matrix" transform="translate(22.000000, 32.000000)">
												<g class="face-container">
													<g class="face" transform="translate(-9, -12)">
														<g class="face-upAndDown">
															<ellipse class="right-eye" fill="#2C0E0F" cx="16.0941176" cy="1.75609756" rx="1.90588235" ry="1.75609756"></ellipse>
															<ellipse class="left-eye" fill="#2C0E0F" cx="1.90588235" cy="1.75609756" rx="1.90588235" ry="1.75609756"></ellipse>
															<path id="sMouth" stroke="#2C0E0F" stroke-linecap="round" stroke-linejoin="round" d="M6.18823529,4.90499997 C6.18823529,5.95249999 7.48721095,7 9.08957864,7 C10.6919463,7 11.990922,5.95249999 11.990922,4.90499997"></path>
														</g>
													</g>
												</g>
											</g>
										</g>
									</svg>
								</div>
								<p><span class="spread_underline under_S">음.. 나쁘진 않아요</span></p>
								<dl>
									<dt class="data_S searchWord">고구마</dt>
									<dd id="basic_meta">소화를 촉진 시켜 변비와 피부, 눈 건강에 좋아요

										⚠ 단, 살이 찔 수 있으니 적당히 주기! </dd>
								</dl>
							</div>
						</div>

						<div class="dic_comment" >
							<div class="cal_result_dic">
								<div class="emotion_N">
									<svg class="not" width="44px" height="44px" viewBox="0 0 44 44" version="1.1">
										<g id="not" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(0, 0)">
											<circle id="nBody" cx="22" cy="22" r="22"></circle>
											<g class="face">
												<g transform="translate(13.000000, 20.000000)" fill="#2C0E0F">
													<ellipse class="right-eye" cx="16.0941176" cy="1.75" rx="1.90588235" ry="1.75"></ellipse>
													<ellipse class="left-eye" cx="1.90588235" cy="1.75" rx="1.90588235" ry="1.75"></ellipse>
													<g class="mouth">
														<g transform="translate(9, 5)" >
														<rect x="-2" y="0" width="4" height="2" rx="2"></rect>
														</g>
													</g>
												</g>
											</g>
										</g>
									</svg>
								</div>
								<p><span class="spread_underline under_N">네? 정말이에요??</span></p>
								<dl>
									<dt class="data_N searchWord">라면</dt>
									<dd id="basic_meta">진심으로 먹일꺼에요?</dd>
								</dl>
							</div>
	
							<div class="cal_result_dic" >
								<div class="emotion_B" >
									<svg class="bad" width="44px" height="44px" viewBox="0 0 44 44" version="1.1">
										<g id="bad" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(0, 0)">
											<circle id="bBody" cx="22" cy="22" r="22"></circle>
											<g id="face" transform="translate(13.000000, 20.000000)">
												<g class="face">
													<ellipse class="right-eye" fill="#2C0E0F" cx="16.0941176" cy="1.75609756" rx="1.90588235" ry="1.75609756"></ellipse>
													<ellipse class="left-eye" fill="#2C0E0F" cx="1.90588235" cy="1.75609756" rx="1.90588235" ry="1.75609756"></ellipse>
													<path class="bMouth" stroke="#2C0E0F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" transform="translate(9.000000, 5.000000) rotate(-180.000000) translate(-9.000000, -5.000000)" d="M7,4 C7,5.1045695 7.8954305,6 9,6 C10.1045695,6 11,5.1045695 11,4" ></path>
												</g>
											</g>
										</g>
									</svg>
								</div>
								<p><span class="spread_underline under_B">먹으면 안 돼요..</span></p>
								<dl>
									<dt class="data_B searchWord">우유</dt>
									<dd id="basic_meta">
										강아지는 락타아제라고 불리는 유당 분해 효소가 부족하기때문에
										우유나 우유로 만든 유제품을 급여한다면 
										설사와 같은 소화기계 문제를 야기시킬 수 있고 
										음식 알러지를 일으킬 수 있습니다.
										
										그러니 유당-free인 제품이나 반려동물 전용 우유를 주어야 합니다.
									</dd>	
								</dl>
							</div>
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
	<!-- Food_dictionary 끝 -->

	<script src="${ path }/resources/js/calculator.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />