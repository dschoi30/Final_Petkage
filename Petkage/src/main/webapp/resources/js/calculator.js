
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

    var bcs_type = $('#bcs_type').val();

    var pet_weight = $('input[name="pet_weight"]').val();
    var dog_jisu = $('select[name="dog_jisu"]').val();
    var cat_jisu = $('select[name="cat_jisu"]').val();

    if (tab_id == 1) {
        if (!pet_type) {
            alert("반려동물을 선택해주세요.")
        } else {
            if(dog_on === 0 && cat_on === 0) {
                if (!pet_date) {
                    alert("생년월일을 입력해주세요.");
                    $('input[name="pet_date"]').focus()
                    return;
                } else if (!dog_type) {
                    alert("몸무게를 선택해주세요.");
                    return;
                }
            
            } else {
                if (!pet_date) {
                    alert("생년월일을 입력해주세요.");
                    $('input[name="pet_date"]').focus()
                    return;
                } 
            }
        }

        if (!isBirthday(pet_date)) { //생년월일 유효성 검사
            return;
        }

    }


    $.ajax ({
        type: "POST",
        url: "${ path }/tools/calResult",
        dataType: "json",
        data: {
            data
        },
        success: function(r){
			$(".cal_result_box").show();
			// $(".calculator_sns").show(); // 공유하기
			$(".cal_info_box").hide();

			//나이계산기
			if(tab_id==1){
                $(".cal_result_age").css("display","block");
                
                if (pet_type === "강아지") {
                    $("#dog_age").html(r.msg[0]);
                    $("#dog_age_cal").html(r.msg[1]+"살");
                    $("#dog_life").html(r.msg[2]);
                } else if (pet_type === "고양이") {
                    $("#dog_age").html(r.msg[0]);
                    $("#dog_age_cal").html(r.msg[1]+"살");
                    $("#dog_life").html(r.msg[2]);
                }

			}else if(tab_id==2){//칼로리계산
				$(".Cc_result_calorie").css("display","block");
				$("#basic_meta").html(r.msg[0]+"kcal");
				$("#basic_kal").html(r.msg[1]+"kcal");
				
			}else if(tab_id==3){//칼로리계산
				$(".Cc_result_obesity").css("display","block");
				$("#bsc_type_str1").html(r.msg_pc[0]);
				$("#bsc_type_str2").html(r.msg_pc[1]);
				$("#bsc_type_str3").html(r.msg_pc[2]);
			}

		}

    });


}

function dog_on() {
    console.log("강쥐 클릭");
    console.log($("#dog_on").val());
    console.log($('input[name="pet_type"]').val());

    $("#cat_hide").show();
    $('input[name="pet_type"]').attr('value','강아지');
    $("[name=animal_check]").attr("disabled", false);
    $('#cat_on').attr('value','');
}

function cat_on() {
    console.log("고영희 클릭");
    console.log($("#cat_on").val());
    console.log($('input[name="pet_type"]').val());

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
    var year = Number(dateStr.substr(0, 4)); // 입력한 값의 0 ~ 4자리까지 (연) 
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