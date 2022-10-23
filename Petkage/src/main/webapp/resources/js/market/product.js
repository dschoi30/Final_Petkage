$(document).ready(() => {
    // 카테고리 버튼 클릭을 통한 상품 목록 조회
    
    var btn = document.getElementsByClassName("categoryBtn");

    btnIterator();

    function btnIterator() {
        for (var i = 0; i < btn.length; i++) {
            btn[i].addEventListener("click", btnChange);
        }
        for (var i = 0; i < btn.length; i++) {
            btn[i].addEventListener("click", btnClicked);
        }
    }

    function btnChange(event) {
        console.log(event.target);
        // console.log(this);
        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
        } else {
            for (var i = 0; i < btn.length; i++) {
                btn[i].classList.remove("clicked");
            }
            event.target.classList.add("clicked");
        }
    }

	function btnClicked(event) {
		
	}

    const modal = document.querySelector(".modal");
    const img = document.querySelector(".img");
    const modal_img = document.querySelector(".modal_content");
    const span = document.querySelector(".close");

    img.addEventListener('click', () => {
        modalDisplay("block");
        modal_img.src = img.src;
    });
    span.addEventListener('click', () => {
        modalDisplay("none");
    });
    modal.addEventListener('click', () => {
        modalDisplay("none");
    });
    function modalDisplay(text){
        modal.style.display = text;
    }
    
    $("#btnDelProd").on("click", () => {
        if(confirm("정말로 게시글을 삭제하시겠습니까?")) {
            location.replace("${ path }/market/product-delete?proNo=${ product.proNo }");
        };
    });
});