<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/tools/calculator.css">
<body>
	<!-- Eat_This 시작 -->
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

			<!-- 계산기 컨텐츠 -->
			<div class="cal_content pr">

				<!-- 사전 결과 박스 -->
				<div class="cal_result_box">

					<div class="cal_result_dictionary">
						<!-- 사전 검색 결과 --> 
						
						<div class="dic_comment">
							<div class="cal_result_dic">

							<c:if test="${ food.eatThis == 'G' }">
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
									<dt class="data_G searchWord">${ food.foodName }</dt>
									<dd id="basic_meta">
										${ food.comment }
									</dd>
									<dd id="basic_meta">
										${ food.subComment }
									</dd>
								</dl>
							</c:if>	
	
							<c:if test="${ food.eatThis == 'S' }">
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
									<dt class="data_S searchWord">${ food.foodName }</dt>
									<dd id="basic_meta">
										${ food.comment }
									</dd>
									<dd id="basic_meta">
										${ food.subComment }
									</dd>
								</dl>
							</c:if>

							<c:if test="${ food.eatThis == 'B' }">
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
									<dt class="data_B searchWord">${ food.foodName }</dt>
									<dd id="basic_meta">
										${ food.comment }
									</dd>
									<dd id="basic_meta">
										${ food.subComment }
									</dd>
								</dl>
							</c:if>	
							
							<c:if test="${ food.eatThis != 'G' && food.eatThis != 'B' && food.eatThis != 'S'}">
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
									<dt class="data_N searchWord">${ food.foodName }</dt>
									<dd id="basic_meta">진심으로 먹일꺼에요?</dd>
								</dl>
							</c:if>
							</div>
						</div>
						
					</div>

					<!-- 계산기 다시하기 버튼-->
					<div class="cal_btn"> 
						<div class="cal_again" onclick="location.href='${ path }/tools/foodDictionary'"><a>다시하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Eat_This 끝 -->

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />