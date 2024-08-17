$(function() {
    initializePage("ALL");
});

let products = [];
let currentCategory = 'ALL';
let filteredProducts = [];
let currentPage = 1;
const productsPerPage = 8;

// 전체적으로 데이터를 JSON파일로 api파일 안에서 만들걸 배열로 받고 그걸 카테고리별로 분리후 카테고리에 맞는 것만 뿌린다
// 검색을하면  searchValue 랑 ${product.prodDescript} 의 값이랑 비교후 출력
// 페이징 처리는 그 받은 데이터 배열을 productsPerPage로 값을 정해줘서 그 수에 맞춰 짜른뒤 
// 페이지 이동 버튼을 클릭하면 현재 페이지를 업데이트하고, 새로운 페이지의 데이터를 표시

const initializePage = function(initialCategory) {
    currentCategory = initialCategory || 'ALL';  
    loadProducts(currentCategory);

    // 카테고리 링크 클릭 시 해당 카테고리의 제품을 로드
    $('.category-name a').on('click', function(e) {
        e.preventDefault();
        const category = $(this).text().trim();
        loadProducts(category);
    });

    // 정렬 링크 클릭 시 제품을 정렬
    $('.sort-links a').on('click', function(e) {
        e.preventDefault();
        const sortBy = $(this).data('sortby');
        const sortOrder = $(this).data('sortorder');
        sortProducts(sortBy, sortOrder);
    });

    // 검색 버튼 클릭 시 검색 기능 실행
    $('#search-button').on('click', function() {
        const searchValue = $('#search-input').val().trim();
        searchProducts(searchValue);
    });

    // 검색 입력 필드에서 키 입력 시 검색 기능 실행
    $('#search-input').on('keyup', function() {
        const searchValue = $(this).val().trim();
        searchProducts(searchValue);
    });

    // 이전 페이지 버튼 클릭 시 페이지 이동
    $('#prev-page').on('click', function() {
        if (currentPage > 1) {
            currentPage--;
            displayProducts(filteredProducts);
        }
    });

    // 다음 페이지 버튼 클릭 시 페이지 이동
    $('#next-page').on('click', function() {
        if (currentPage < Math.ceil(filteredProducts.length / productsPerPage)) {
            currentPage++;
            displayProducts(filteredProducts);
        }
    });
};

const loadProducts = function(category) {
    const encodedCategory = encodeURIComponent(category);
    const url = category === 'ALL' 
        ? '/catshap/api/product.jsp' 
        : `/catshap/api/product.jsp?prdCatname=${encodedCategory}`;

    $.get(url)
        .done(function(data) {
            if (typeof data === 'string') {
                data = JSON.parse(data);  
            }
            products = data;
            filteredProducts = products; 
            currentPage = 1; // 새로운 카테고리 로드 시 페이지를 1로 리셋
            displayProducts(filteredProducts);
            $('#currentCategory').text(category);
        });
};

const sortProducts = function(sortBy, sortOrder) {
    const sortedProducts = filteredProducts.slice().sort((a, b) => {
        const result = sortOrder === 'ASC' ? 1 : -1;
        if (sortBy === 'price') {
            return (a.prodPrice - b.prodPrice) * result;
        } else if (sortBy === 'count') {
            return (a.prodCount - b.prodCount) * result;
        } else if (sortBy === 'reviews') {
            return (a.revCount - b.revCount) * result;
        }
        return 0;
    });
    
    filteredProducts = sortedProducts;
    displayProducts(filteredProducts);
};

const displayProducts = function(productList) {
    const productListContainer = $('#product-list');
    productListContainer.empty();

    const totalProducts = productList.length;
    const startIndex = (currentPage - 1) * productsPerPage;
    const endIndex = Math.min(startIndex + productsPerPage, totalProducts);

    if (totalProducts === 0) {
        productListContainer.html('<p>검색 조건에 일치하는 내용이 없습니다</p>');
        $('#page-numbers').empty();
        $('#prev-page').prop('disabled', true);
        $('#next-page').prop('disabled', true);
        return;
    }

    // 현재 페이지에 해당하는 제품만 표시
    productList.slice(startIndex, endIndex).forEach(product => {
        const productHtml = `
            <div class="product ${product.prodNo}">
                <a href="productView.jsp?prodNo=${product.prodNo}">
                    <img src="/catshap/image/${product.prodImgPath}" alt="${product.prodDescript}" />
                    <h3 id="name">${product.prodDescript}</h3>
                    <p id="name2">${product.prodPrice}원</p>
                </a>
            </div>
        `;
        productListContainer.append(productHtml);
    });

    // 페이지 네비게이션 생성
    generatePagination(totalProducts);

    // 이전 페이지 및 다음 페이지 버튼 상태 업데이트
    $('#prev-page').prop('disabled', currentPage === 1);
    $('#next-page').prop('disabled', currentPage === Math.ceil(totalProducts / productsPerPage));
};

const generatePagination = function(totalProducts) {
    const pageNumbersContainer = $('#page-numbers');
    pageNumbersContainer.empty();

    const totalPages = Math.ceil(totalProducts / productsPerPage);

    // 페이지 번호 버튼 생성
    for (let i = 1; i <= totalPages; i++) {
        const pageNumberHtml = `<button class="page-number" data-page="${i}">${i}</button>`;
        pageNumbersContainer.append(pageNumberHtml);
    }

    // 현재 페이지에 해당하는 버튼 강조
    $('.page-number').each(function() {
        if ($(this).data('page') === currentPage) {
            $(this).addClass('current-page');
        } else {
            $(this).removeClass('current-page');
        }
    });

    // 페이지 번호 버튼 클릭 시 페이지 변경
    $('.page-number').on('click', function() {
        currentPage = $(this).data('page');
        displayProducts(filteredProducts);
    });
};

const searchProducts = function(searchValue) {
    filteredProducts = products.filter(product => 
        product.prodDescript.toLowerCase().includes(searchValue.toLowerCase())
    );
    currentPage = 1; // 검색 시 페이지를 1로 리셋
    displayProducts(filteredProducts);
};
