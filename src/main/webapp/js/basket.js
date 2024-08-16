$(document).ready(function() {
    const productRows = document.querySelectorAll('.product-row');
    
    productRows.forEach(row => {
        const productPriceElement = row.querySelector('.product-price');
        const totalPriceElement = row.querySelector('.total-price');
        const increaseButton = row.querySelector('.increase-btn');
        const decreaseButton = row.querySelector('.decrease-btn');
        const numberDisplay = row.querySelector('.number-display');
        const quantityDisplay = row.querySelector('.quantity-display');
        const checkbox = row.querySelector('.product-checkbox'); 

        let basePrice = parseInt(productPriceElement.textContent.replace(/[^0-9]/g, ''));
        let quantity = parseInt(numberDisplay.textContent);

        function updateDisplay() {
            numberDisplay.textContent = quantity;
            quantityDisplay.textContent = `(${quantity}개)`;
            const totalPrice = basePrice * quantity;
            totalPriceElement.textContent = `${totalPrice.toLocaleString()}원`;
        }

        increaseButton.addEventListener('click', (e) => {
            e.preventDefault();
            quantity += 1;
            updateDisplay();
        });

        decreaseButton.addEventListener('click', (e) => {
            e.preventDefault();
            if (quantity > 1) {
                quantity -= 1;
                updateDisplay();
            }
        });

        updateDisplay();
    });

    // 전체 선택 기능
    $('#allcheckbox').click(function() {
        $('.product-checkbox').prop('checked', this.checked);
    });

    // 선택상품 주문하기 버튼 클릭 처리
    $('#submitSelectedOrder').click(function(e) {
        e.preventDefault(); 
    
        let totalQuantity = 0;
        let totalPrice = 0;
    
        $('#orderForm input[name="prodno[]"]').remove();
        $('#orderForm input[name="quantity[]"]').remove();
        $('#orderForm input[name="price[]"]').remove();
        $('#orderForm input[name="prodimgpath[]"]').remove();
        $('#orderForm input[name="proddescript[]"]').remove();
        $('#orderForm input[name="totalQuantity"]').remove();
        $('#orderForm input[name="totalPrice"]').remove();
    
        $('.product-checkbox:checked').each(function() {
            let prodNo = $(this).data('prodno');
            let quantity = parseInt($(this).closest('tr').find('.number-display').text());
            let price = parseInt($(this).data('price')) * quantity;
     		let prodimgpath = $(this).data('prodimgpath');
     		let proddescript = $(this).data('proddescript');
     		
            totalQuantity += quantity;
            totalPrice += price;
    
            $('#orderForm').append('<input type="hidden" name="prodno[]" value="' + prodNo + '">');
            $('#orderForm').append('<input type="hidden" name="quantity[]" value="' + quantity + '">');
            $('#orderForm').append('<input type="hidden" name="price[]" value="' + price + '">');
            $('#orderForm').append('<input type="hidden" name="prodimgpath[]" value="' + prodimgpath + '">');
            $('#orderForm').append('<input type="hidden" name="proddescript[]" value="' + proddescript + '">');
        });
    
        $('#orderForm').append('<input type="hidden" name="totalQuantity" value="' + totalQuantity + '">');
        $('#orderForm').append('<input type="hidden" name="totalPrice" value="' + totalPrice + '">');
    
        $('#orderForm').off('submit').submit(); 
    });

});
