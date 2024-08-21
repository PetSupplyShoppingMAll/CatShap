# CatShap
![catShapLogo](https://github.com/user-attachments/assets/60acbba1-a07b-448c-a773-ef25509a9390)

**냥# - 고양이 용품 쇼핑몰** <br />
**개발기간** : 2024.07.30 ~ 2024.08.17

--- 

## 📖 프로젝트 소개

- 냥#은 6가지의 카테고리를 선택하여 다양한 상품을 고를 수 있는 고양이 용품 쇼핑몰입니다.
- 쇼핑몰의 핵심 기능을 이해하고 실제로 웹사이트를 구축해보는 데 중점을 두었습니다.
- 원하는 상품을 장바구니에 담고 선택하여 맞춤형 주문이 가능합니다. 
- 회원은 직접 상품의 리뷰와 별점을 남길 수 있습니다.
- 상품 QnA에서 불편한 점에 대해 바로 문의를 할 수 있습니다.

## 🛠️ 기술 스택

- **데이터베이스** : MyBatis
- **프론트엔드** :  HTML/CSS/Javascript, jQuery
- **백엔드** : JSP/Servlet
- **서버** : Apache Tomcat 9.0
- **커뮤니케이션** : Notion, figma

## 📚 ERD
<p align="center">
<img src="https://github.com/user-attachments/assets/8033bb41-32df-4a55-91ab-c6075cb3bbb9" alt="ERD"/>
</p>

## 🚀 주요기능

### 1. 메인 페이지
- **개요**: 메인 페이지에는 제품 카테고리와 추천 제품이 표시됩니다. 로그인, 회원가입, 주문정보, QnA, 리뷰 등 다양한 섹션에 접근할 수 있습니다.
- **카테고리**: 상품은 전체, 간식, 식품, 장난감, 의류, 기타로 분류됩니다. 카테고리를 클릭하시면 관련상품을 보실 수 있습니다.
- **검색 및 정렬**: 검색창을 사용하여 제품을 찾을 수 있습니다. 또한 가격, 인기 또는 리뷰를 기준으로 검색 결과를 정렬합니다.

### 2. 회원가입 및 로그인
- **회원가입**: 회원가입을 통해 계정을 생성할 수 있습니다. 아이디, 비밀번호, 이메일, 전화번호, 주소를 입력합니다. 
입력한 정보들은 정규화 규칙을 따르고 중복되지 않는지 확인합니다.
- **로그인**: 생성한 ID와 비밀번호를 이용하여 로그인합니다.

### 3. 아이디와 비밀번호 찾기
- **아이디 찾기**: 아이디를 잊어버린 경우 로그인 페이지에서 "아이디 찾기"를 이용할 수 있습니다. 
이름과 이메일을 입력하시면 아이디를 찾으실 수 있습니다.
- **비밀번호 찾기**: 비밀번호를 잊어버린 경우 로그인 페이지에서 "비밀번호 찾기"를 이용할 수 있습니다.
이름, 아이디, 이메일을 입력하면 이메일로 인증번호를 발송됩니다.
인증번호가 인증되면 비밀번호를 재설정할 수 있습니다.

### 4. 회원 탈퇴
- **처리방법**: 로그인 후 마이페이지로 이동하여 '회원탈퇴'를 클릭하면 계정을 탈퇴 할 수 있습니다.
탈퇴하면 더 이상 해당 아이디로 로그인할 수 없습니다.

### 5. 게시판 생성 및 상세정보 보기
- **게시물 작성**: QnA 섹션으로 이동하여 "게시물 작성"을 클릭하여 새 QnA 항목을 작성할 수 있습니다.
제목과 내용을 통해 검색이 가능합니다.
참고할 제품을 선택하여 상품 문의글을 작성할 수 있습니다.
- **상세보기**: 상품 상세보기를 클릭하시면 자세한 상품 정보를 보실 수 있습니다. 
작성된 게시글을 클릭하면 게시글의 상세 보기가 가능합니다.

### 6. 리뷰 작성
- **리뷰 작성**: 제품 세부 정보 페이지에서 맨 아래로 스크롤하여 "리뷰 작성"을 할 수 있습니다.
- **리뷰 평점**: 제목, 내용, 평점(별 1~5개)을 입력한 후 등록할 수 있습니다.
작성하신 리뷰는 상품상세페이지와 마이페이지에서 확인하실 수 있습니다.

### 7. 제품 상세 페이지 설명 및 장바구니에 제품 추가
- **상품 상세정보**: 메인 페이지에서 상품을 클릭하시면 상세 설명, 이미지, 리뷰를 보실 수 있습니다.
- **장바구니에 추가**: 장바구니에 제품을 포함하려면 세부 정보 페이지의 "장바구니에 추가" 버튼을 클릭합니다.

### 8. 장바구니
**장바구니 보기**: 장바구니에 추가된 품목을 보려면 장바구니 아이콘을 클릭하여 확인할 수 있습니다.
**카트 관리**: 장바구니의 내용을 검토하고 수정합니다. 제품을 비교하고 어떤 제품을 구매할지 결정할 수 있습니다.

### 9. 구매 및 결제 페이지
**결제**: 장바구니에서 "구매"를 클릭하여 결제 페이지로 이동합니다.
**세부정보 입력**: 배송지 주소와 결제 정보를 입력합니다. 결제 방식은 카카오톡 PAY를 이용하여 QR결제 또는 카카오톡 정보를 입력 방식을 지원합니다.
결제 완료 후 휴대폰으로 확인 메시지가 전송됩니다.

### 10. 마이페이지
- **액세스**: 메인 페이지에서 마이페이지 아이콘을 클릭하면 계정 세부정보에 액세스할 수 있습니다.
- **주문 내역**: 과거 주문의 정보를 확인할 수 있습니다.
- **회원정보 수정**: 개인정보(ID 제외)를 업데이트 할 수 있습니다.
- **리뷰 및 게시물 보기**: 자신이 작성한 리뷰와 게시물을 확인하고 관리할 수 있습니다.
- **회원 등급**: 구매 내역을 바탕으로 회원 등급을 확인할 수 있습니다. 회원 등급의 종류로는 다음과 같습니다.

| 예비 집사 | 집사 | 숙련된 집사 | 마스터 집사 |
|:-------: | :-------: |:-------: | :-------: | 
| <img src="https://github.com/user-attachments/assets/cf20d2b3-d359-46da-85a7-301992a2cd94" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/ca747fe6-eb14-4d90-ba03-077c8629c4dc" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/4de2c4be-347e-4550-94de-884b1246ed6d" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/8e2c9b58-863b-41e2-99cc-81e8326feb4b" alt="회원 마스터 집사 등급" /> |

## 🎥 Preview
### 회원가입 및 로그인
| ![Signup](https://github.com/user-attachments/assets/f7f2f147-4108-4287-8f85-ca6a4ca7bcde) | ![Login](https://github.com/user-attachments/assets/245d0f4d-5fcb-4a24-a601-ef40bf849746) |
|----------------------------|----------------------------|

### 아이디와 비밀번호 찾기
| ![FindId](https://github.com/user-attachments/assets/8118471e-b635-4984-95c1-51b1e569b279) | ![FindPw](https://github.com/user-attachments/assets/88b5d445-e506-4bc6-bb80-22ae2d7ba669) |
|----------------------------|----------------------------|

### 메인화면 및 회원 탈퇴
| ![Main](https://github.com/user-attachments/assets/4a5e1a80-0b71-4579-a4eb-35f5a25cd69c) | ![ExitUser](https://github.com/user-attachments/assets/dc78dfd3-16ee-4485-bf62-a83acb4b40ad) |
|----------------------------|----------------------------|

### 게시글 작성 및 리뷰 작성
| ![QnA](https://github.com/user-attachments/assets/e45b28e4-c1d7-47b0-ba25-55ddf4441cae) | ![Review](https://github.com/user-attachments/assets/18fc223a-c950-4de6-836e-2f21faedb875) |
|----------------------------|----------------------------|

### 장바구니 담기 및 결제
| ![Basket](https://github.com/user-attachments/assets/e0721eee-137e-4876-a595-0822f7c03d31) | ![Pay](https://github.com/user-attachments/assets/de841049-c734-48f8-8a79-03edd471b6c6) |
|----------------------------|----------------------------|

## 📁 파일 구조
```
📦src
 ┗ 📂main
 ┃ ┣ 📂java
 ┃ ┃ ┗ 📂catshap
 ┃ ┃ ┃ ┗ 📂butler
 ┃ ┃ ┃ ┃ ┣ 📂bean
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Basket.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketOrder.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Delivery.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Grade.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Image.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Main.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MyOrderProduct.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderProduct.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Orders.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Pay.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Product.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductView.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoard.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaProduct.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewView.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Search.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcode.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserQnA.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜Users.java
 ┃ ┃ ┃ ┃ ┣ 📂conf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Basket.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketOrder.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜configuration.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜db.properties
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Delivery.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Image.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Main.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderProduct.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Orders.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Pay.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜Product.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductView.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardMapper.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardProduct.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewView.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜User.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcode.xml
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserGrade.xml
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserQnA.xml
 ┃ ┃ ┃ ┃ ┣ 📂dao
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketOrderDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜DeliveryDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ImageDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MainDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderProductDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrdersDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜PayDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductViewDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardProductDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewViewDao.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserDao.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserQnADao.java
 ┃ ┃ ┃ ┃ ┣ 📂exception
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcodeNotInsertException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcodeNotVerifyException.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserIdNotFoundException.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserPwNotFoundException.java
 ┃ ┃ ┃ ┃ ┣ 📂filter
 ┃ ┃ ┃ ┃ ┃ ┗ 📜EncodingFilter.java
 ┃ ┃ ┃ ┃ ┣ 📂interfaces
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜BasketOrderInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜DeliveryInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ImageInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜MainInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderProductInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrdersInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜PayInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductPriceInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductViewInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜QnaBoardProductDaoInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ReviewViewInterface.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInterface.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserQnAInterFace.java
 ┃ ┃ ┃ ┃ ┣ 📂servlet
 ┃ ┃ ┃ ┃ ┃ ┣ 📜CheckLoginStatusServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜DeliveryRegisterServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderProductRegisterServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrderRegisterServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜OrdstatusUpdateServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜PayRegisterServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ProductSearchServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜RegistReviewServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UpdateUserInfoServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcodeVerifyServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserChangePwServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserChangeStatusServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserFindIdServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserFindPwServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserGetQnAServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserGetReviewServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserInfoServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserJoinCheckDuplicateServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserLoginServlet.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserMypageChangePwServlet.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UserRegisterServlet.java
 ┃ ┃ ┃ ┃ ┣ 📂test
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserAuthcodeVerifyTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserFindIdTest.java
 ┃ ┃ ┃ ┃ ┃ ┣ 📜UserFindPwTest.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜UsersTest.java
 ┃ ┃ ┃ ┃ ┗ 📂util
 ┃ ┃ ┃ ┃ ┃ ┣ 📜EmailUtil.java
 ┃ ┃ ┃ ┃ ┃ ┗ 📜MyBatisUtil.java
 ┃ ┗ 📂webapp
 ┃ ┃ ┣ 📂api
 ┃ ┃ ┃ ┗ 📜product.jsp
 ┃ ┃ ┣ 📂css
 ┃ ┃ ┣ 📂image
 ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┣ 📜basket.js
 ┃ ┃ ┃ ┣ 📜buy.js
 ┃ ┃ ┃ ┣ 📜check_login.js
 ┃ ┃ ┃ ┣ 📜daumAddress.js
 ┃ ┃ ┃ ┣ 📜header.js
 ┃ ┃ ┃ ┣ 📜Product.js
 ┃ ┃ ┃ ┣ 📜productOrders.js
 ┃ ┃ ┃ ┣ 📜productView.js
 ┃ ┃ ┃ ┣ 📜qna.js
 ┃ ┃ ┃ ┣ 📜review.js
 ┃ ┃ ┃ ┣ 📜user.js
 ┃ ┃ ┃ ┣ 📜user_info.js
 ┃ ┃ ┃ ┣ 📜user_myQnA.js
 ┃ ┃ ┃ ┣ 📜user_myReview.js
 ┃ ┃ ┃ ┣ 📜user_orders.js
 ┃ ┃ ┃ ┗ 📜user_regex.js
 ┃ ┃ ┣ 📂META-INF
 ┃ ┃ ┃ ┗ 📜MANIFEST.MF
 ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┣ 📂lib
 ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┣ 📜add.jsp
 ┃ ┃ ┣ 📜basket.jsp
 ┃ ┃ ┣ 📜basketDelete.jsp
 ┃ ┃ ┣ 📜footer.jsp
 ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┣ 📜ImageProc.jsp
 ┃ ┃ ┣ 📜main.jsp
 ┃ ┃ ┣ 📜mainProc.jsp
 ┃ ┃ ┣ 📜productList.jsp
 ┃ ┃ ┣ 📜productOrders.jsp
 ┃ ┃ ┣ 📜productOrdersProc.jsp
 ┃ ┃ ┣ 📜productProc.jsp
 ┃ ┃ ┣ 📜productView.jsp
 ┃ ┃ ┣ 📜qnaboarddetail.jsp
 ┃ ┃ ┣ 📜qnaboardmain.jsp
 ┃ ┃ ┣ 📜qnaboardmainProc.jsp
 ┃ ┃ ┣ 📜qnaboardregist.jsp
 ┃ ┃ ┣ 📜qnaboardregistProc.jsp
 ┃ ┃ ┣ 📜qnaproductsearch.jsp
 ┃ ┃ ┣ 📜userOrdersPageProc.jsp
 ┃ ┃ ┣ 📜user_change_pw.jsp
 ┃ ┃ ┣ 📜user_change_pw_ok.jsp
 ┃ ┃ ┣ 📜user_exit.jsp
 ┃ ┃ ┣ 📜user_find_id.jsp
 ┃ ┃ ┣ 📜user_find_id_ok.jsp
 ┃ ┃ ┣ 📜user_find_pw.jsp
 ┃ ┃ ┣ 📜user_find_pw_code.jsp
 ┃ ┃ ┣ 📜user_join.jsp
 ┃ ┃ ┣ 📜user_login.jsp
 ┃ ┃ ┣ 📜user_logoutProc.jsp
 ┃ ┃ ┣ 📜user_logoutProc_to_login.jsp
 ┃ ┃ ┣ 📜user_modify.jsp
 ┃ ┃ ┣ 📜user_mypage.jsp
 ┃ ┃ ┣ 📜user_mypage_change_pw.jsp
 ┃ ┃ ┣ 📜user_myQnA.jsp
 ┃ ┃ ┣ 📜user_myReview.jsp
 ┃ ┃ ┗ 📜user_orders_page.jsp
```
