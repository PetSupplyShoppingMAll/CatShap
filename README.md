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

- **데이터베이스** : Oracle
- **프론트엔드** :  HTML/CSS/Javascript, jQuery, JSP
- **백엔드** : Servlet(Dynamic Web Project)
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
- **장바구니 보기**: 장바구니에 추가된 품목을 보려면 장바구니 아이콘을 클릭하여 확인할 수 있습니다.
- **카트 관리**: 장바구니의 내용을 검토하고 수정합니다. 제품을 비교하고 어떤 제품을 구매할지 결정할 수 있습니다.

### 9. 구매 및 결제 페이지
- **결제**: 장바구니에서 "구매"를 클릭하여 결제 페이지로 이동합니다.
- **세부정보 입력**: 배송지 주소와 결제 정보를 입력합니다. 결제 방식은 카카오톡 PAY를 이용하여 QR결제 또는 카카오톡 정보를 입력 방식을 지원합니다.
결제 완료 후 휴대폰으로 확인 메시지가 전송됩니다.

### 10. 마이페이지
- **액세스**: 메인 페이지에서 마이페이지 아이콘을 클릭하면 계정 세부정보에 액세스할 수 있습니다.
- **주문 내역**: 과거 주문의 정보를 확인할 수 있습니다.
- **회원정보 수정**: 개인정보(ID 제외)를 업데이트 할 수 있습니다.
- **리뷰 및 게시물 보기**: 자신이 작성한 리뷰와 게시물을 확인하고 관리할 수 있습니다.
- **회원 등급**: 구매 내역을 바탕으로 회원 등급을 확인할 수 있습니다. 회원 등급의 종류로는 다음과 같습니다.

| 예비 집사 | 간택된 집사 | 숙련된 집사 | 마스터 집사 |
|:-------: | :-------: |:-------: | :-------: | 
| <img src="https://github.com/user-attachments/assets/cf20d2b3-d359-46da-85a7-301992a2cd94" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/ca747fe6-eb14-4d90-ba03-077c8629c4dc" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/4de2c4be-347e-4550-94de-884b1246ed6d" alt="회원 예비집사 등급"/> | <img src="https://github.com/user-attachments/assets/8e2c9b58-863b-41e2-99cc-81e8326feb4b" alt="회원 마스터 집사 등급" /> |

## 🎥 Preview
### 회원가입 및 로그인
| ![signup_video](https://github.com/user-attachments/assets/8f0769d6-6728-46dd-8f44-211370b0c616) | ![login_video](https://github.com/user-attachments/assets/707269fc-1785-47d3-83b4-a25141a14950)|
|----------------------------|----------------------------|

### 아이디와 비밀번호 찾기
| ![find_id_video](https://github.com/user-attachments/assets/dc71ac5d-29bd-40f6-b3df-525c7f5a5c13) | ![find_pw_video](https://github.com/user-attachments/assets/c25e539e-e839-4c66-9474-01a45620ba81)|
|----------------------------|----------------------------|

### 게시글 작성 및 회원 탈퇴
| ![qna_video](https://github.com/user-attachments/assets/707f448b-86f4-4913-98e3-09451ebb9a67)  | ![user_exit_video](https://github.com/user-attachments/assets/23356fd4-3dfb-46a3-93c8-bf281998bf8e) |
|----------------------------|----------------------------|

### 장바구니 담기 및 결제
|![basket_video](https://github.com/user-attachments/assets/4c309f33-f416-4d30-a760-e765acb8906f) | ![pay_video](https://github.com/user-attachments/assets/0499c6c1-1afb-4f29-b82b-d47a89e911d3) |
|----------------------------|----------------------------|

