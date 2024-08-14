$(function () {
    const productPriceElement = document.getElementById('product-price');
    const totalPriceElement = document.getElementById('total-price');
    const increaseButton = document.getElementById('increase-btn');
    const decreaseButton = document.getElementById('decrease-btn');
    const numberDisplay = document.getElementById('number-display');
    const quantityDisplay = document.getElementById('quantity-display');

    let basePrice = parseInt(productPriceElement.textContent.replace(/[^0-9]/g, ''));
    let quantity = 1;

    function updateDisplay() {
        numberDisplay.textContent = quantity;
        quantityDisplay.textContent = `(${quantity}개)`;

        const totalPrice = basePrice * quantity;
        totalPriceElement.textContent = `${totalPrice}원`;
    }

    increaseButton.addEventListener('click', () => {
        quantity += 1;
        updateDisplay();
    });

    decreaseButton.addEventListener('click', () => {
        if (quantity > 1) {
            quantity -= 1;
            updateDisplay();
        }
    });

    updateDisplay();

    // 구매 버튼을 클릭한 경우
    $("#buyBtn").on('click', (e) => {
        e.preventDefault();

        const prodNo = $(e.currentTarget).data('prodno');
        const prodCnt = $('#number-display').text();
        if (prodNo) {
            $.ajax({
                url: '/catshap/registOrder',
                type: 'POST',
                data: {
                    prodNo: prodNo,
                    prodCnt: prodCnt
                },
                success: (response) => {
                    if (response.success) {
                        window.location.href = `productOrders.jsp?prodNo=${prodNo}`;
                    } else {
						alert(response.falseMessage);
                        window.location.href = 'user_orders_page.jsp';
                    }
                },
                error: (textStatus, errorThrown) => {
                    console.error('Error:', textStatus, errorThrown);
                }
            });
        } else {
            console.error('해당 상품이 존재하지 않습니다.');
        }
    });
});

function goToScroll(name) {
    var location = document.querySelector("#" + name).offsetTop;
    window.scrollTo({ top: location - 100, behavior: 'smooth' });
}
