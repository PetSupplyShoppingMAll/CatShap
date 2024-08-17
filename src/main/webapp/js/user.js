$(function () {
   
    // 로그인 버튼 클릭한 경우
    $("#userLoginBtn").on('click', (e) => {
      e.preventDefault();
      
      const isUsidValid = validate('usid', regex.usid, '아이디를 입력해주세요.', '아이디 형식이 올바르지 않습니다.');
      const isUpassValid = validatePassword();
      if (isUsidValid && isUpassValid) {
         const usid = $('#usid').val().trim();
         const upass = $('#upass').val().trim();
         
         $.ajax({
            type: 'POST',
            url: '/catshap/login',
            data: {
               usid: usid,
               upass: upass
            },
            success: function(response) {
               if (response.success) {
                  alert(response.uname + '님 환영합니다.');
                  window.location.href = 'main.jsp';
               } else {
                  alert("로그인 실패... 정보를 확인해주세요.");
               }
            },
            error: function() {
               alert('서버 오류가 발생했습니다.');
            }
         });
      }
      
   });

    // 로그인의 아이디 찾기 버튼 클릭한 경우
    $('#userLoginFindIdBtn').on('click', () => {
        window.location.href = 'user_find_id.jsp';
    });

    // 로그인의 비밀번호 찾기 버튼 클릭한 경우
    $('#userLoginFindPassBtn').on('click', () => {
        window.location.href = 'user_find_pw.jsp';
    });

    // 로그인의 회원가입 버튼 클릭한 경우
    $('#userLoginSignupBtn').on('click', () => {
        window.location.href = 'user_join.jsp';
    });

    // 아이디 찾기의 아이디 찾기 버튼 클릭한 경우
    $('#userFindIdBtn').on('click', (e) => {
        e.preventDefault();
        
        const isUnameValid = validate('uname', regex.uname, '이름을 입력해주세요.', '이름 형식이 올바르지 않습니다.');
      const isEmailValid = validate('email', regex.email, '이메일을 입력해주세요.', '이메일 형식이 올바르지 않습니다.');
        if (isUnameValid && isEmailValid) {
            const uname = $('#uname').val().trim();
            const email = $('#email').val().trim();

            $.ajax({
                type: 'POST',
                url: '/catshap/user-id-recovery',
                data: {
                    uname: uname,
                    email: email
                },
                success: function (response) {
                    if (response.success) {
                        window.location.href = 'user_find_id_ok.jsp';
                    } else {
                        alert("올바르지 않은 계정입니다.");
                    }
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    });

    // 비밀번호 찾기의 비밀번호 찾기 버튼을 클릭한 경우
    $('#userFindPwBtn').on('click', (e) => {
        e.preventDefault();
        
        const isUnameValid = validate('uname', regex.uname, '이름을 입력해주세요.', '이름 형식이 올바르지 않습니다.');
      	const isUsidValid = validate('usid', regex.usid, '아이디를 입력해주세요.', '아이디 형식이 올바르지 않습니다.');
      	const isEmailValid = validate('email', regex.email, '이메일을 입력해주세요.', '이메일 형식이 올바르지 않습니다.');
        if (isUnameValid && isUsidValid && isEmailValid) {
            const uname = $('#uname').val().trim();
            const usid = $('#usid').val().trim();
            const email = $('#email').val().trim();

            $.ajax({
                type: 'POST',
                url: '/catshap/user-pw-recovery',
                data: {
                    uname: uname,
                    usid: usid,
                    email: email
                },
                success: function (response) {
                    if (response.success) {
                        sessionStorage.setItem('user', JSON.stringify(response.user));
                        window.location.href = 'user_find_pw_code.jsp';
                    } else {
                        alert("올바르지 않은 계정입니다.");
                    }
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    });

    // 비밀번호 찾기의 인증코드 확인 버튼 클릭한 경우
    $('#user_find_pw_code').on('click', (e) => {
        e.preventDefault();
        const uauthcode = $('#uauthcode').val().trim();
        const isUauthcodeValid = validate('uauthcode', regex.uauthcode, '인증코드를 입력해주세요.', '인증코드는 6개의 숫자입니다.');
        const user = JSON.parse(sessionStorage.getItem('user'));
        if (isUauthcodeValid) {
            $.ajax({
                type: 'POST',
                url: '/catshap/user-authcode-verify',
                data: {
                    uauthcode: uauthcode,
                    usid: user.usid
                },
                success: function (response) {
                    if (response.success) {
                        $('#uauthcode-error').hide();
                        window.location.href = 'user_change_pw.jsp';
                    } else {
                        $('#uauthcode-error').text("인증코드 불일치합니다! 다시 입력해주세요.").show();
                    }
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            })
        }
    });

    // 비밀번호 찾기의 인증코드 다시받기 버튼 클릭한 경우
    $('#userTryPwcodeBtn').on('click', () => {
        const user = JSON.parse(sessionStorage.getItem('user'));
        $.ajax({
            type: 'POST',
            url: '/catshap/user-pw-recovery',
            data: {
                uname: user.uname,
                usid: user.usid,
                email: user.email
            },
            success: function (response) {
                if (response.success) {
                    alert("인증코드가 재전송 되었습니다.");
                } else {
                    alert("인증코드 재전송 실패... 다시 클릭해주세요.");
                }
            },
            error: function () {
                alert('서버 오류가 발생했습니다.');
            }
        })
    });

    // 비밀번호 변경의 비밀번호 변경 버튼 클릭한 경우
    $('#userChangePwBtn').on('click', (e) => {
        e.preventDefault();

        const upass = $('#upass').val().trim();
        const upassConfirm = $('#upassConfirm').val().trim();
        const user = JSON.parse(sessionStorage.getItem('user'));
        const isUpassValid = validatePassword();
        const isEequalPassword = equalPassword(upass, upassConfirm);
        if (isUpassValid && isEequalPassword) {
            $.ajax({
                type: 'POST',
                url: '/catshap/user-pass-change',
                data: {
                    usid: user.usid,
                    upass: upass
                },
                success: function (response) {
                    if (response.success) {
                        window.location.href = 'user_change_pw_ok.jsp';
                    } else {
                        alert('비밀번호 변경 실패...');
                    }
                },
                error: function () {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    });

    if ($('body').hasClass('user_join') || $('body').hasClass('user_modify')) {
        validateInput();
    }

   // 회원가입의 회원가입 버튼을 클릭한 경우
   $('#joinBtn').click((event) => {
       event.preventDefault(); // 기본 폼 제출 동작 방지
   
       if (isFormValid()) {
           // `mktAgree` 체크 여부에 따라 값 설정
           const mktAgreeValue = $('#mktAgree').is(':checked') ? 'Y' : 'N';
   
           // 폼 데이터에서 하이픈 제거
           const phoneNumber = $('#uphone').val().replace(/-/g, '');
   
           // 데이터를 객체 형태로 준비
           const formData = {
               usid: $('#usid').val(),
               upass: $('#upass').val(),
               upass_re: $('#upass_re').val(),
               uname: $('#uname').val(),
               unick: $('#unick').val(),
               utelecom: $('#utelecom').val(),
               uphone: phoneNumber,
               email: $('#email').val(),
               umailAddress: $('#umailAddress').val(),
               uaddress: $('#uaddress').val(),
               udetailAddress: $('#udetailAddress').val(),
               mktAgree: mktAgreeValue
           };
   
           // AJAX 요청을 보내서 서버로 데이터를 전송
           $.ajax({
             type: 'POST',
             url: '/catshap/register',
             data: $.param(formData), // 데이터 URL 인코딩
             contentType: 'application/x-www-form-urlencoded; charset=utf-8', // 요청 데이터 형식 설정
             success: function(response) {
                 alert('등록이 완료되었습니다!');
                 window.location.href = '/catshap/user_login.jsp'; 
             },
             error: function(xhr, status, error) {
                 alert('등록 중 오류가 발생했습니다. 다시 시도해 주세요.');
                 console.error('Error:', error); 
             }
         });
       } else {
           alert('폼을 올바르게 작성해 주세요.');
       }
   });

    const setupCheckButton = (buttonId, fieldId, checkType) => {
        $(buttonId).click(function (event) {
            event.preventDefault();
            const fieldValue = $(fieldId).val();
            checkDuplicate(checkType, fieldValue);
        });
    }

    // 중복 확인 버튼 설정
    setupCheckButton('#idCheckButton', '#usid', 'usid');
    setupCheckButton('#nickCheckButton', '#unick', 'unick');

    // 모달 창 설정
    const setupModal = (modalId, buttonId, fileUrl) => {
        var $modal = $(modalId);
        var $btn = $(buttonId);
        var $modalContent = $modal.find('.modal-content');

        // 버튼 클릭 시 모달 열기
        $btn.on('click', event => {
            event.preventDefault(); // 기본 링크 클릭 동작 방지

            $.ajax({
                url: fileUrl,
                method: 'GET',
                success: function (data) {
                    $modalContent.html('<span class="close">&times;</span><h2>이용약관</h2><p>' + data.replace(/\n/g, '<br>') + '</p>');
                    $modal.show();
                },
                error: function () {
                    alert('파일을 불러오는 데 실패했습니다.');
                }
            });
        });

        // 모달 닫기 버튼 클릭 시 모달 닫기
        $modal.on('click', '.close', function () {
            $modal.hide();
        });

        // 모달 외부 클릭 시 모달 닫기
        $(window).on('click', function (event) {
            if ($(event.target).is($modal)) {
                $modal.hide();
            }
        });
    }

    // 모달 설정
    const modals = [
        { modalId: '#termsModal', buttonId: '#showTerms', fileUrl: './image/termsOfUseAgree.txt' },
        { modalId: '#privacyModal', buttonId: '#showPrivacy', fileUrl: './image/privacyAgree.txt' },
        { modalId: '#mktModal', buttonId: '#showMktAgree', fileUrl: './image/mktAgree.txt' }
    ];

    modals.forEach(modal => setupModal(modal.modalId, modal.buttonId, modal.fileUrl));

    // 취소 버튼을 클릭한 경우
    $('#userCancelBtn').on('click', (e) => {
        e.preventDefault();
        window.location.href = 'user_login.jsp';
    });

    // 로그인하러 가기 버튼 클릭 시
    $('#toLoginBtn').on('click', () => {
        window.location.href = 'user_login.jsp';
    });

    // 메인화면으로 이동 버튼 클릭 시
    $('#toMainBtn').on('click', () => {
        window.location.href = 'main.jsp';
    });

    $('#modifyBtn').click((e) => {
        e.preventDefault();  // 기본 동작을 막음

        const userData = {
            uname: $('#uname').val(),
            unick: $('#unick').val(),
            utelecom: $('#utelecom').val(),
            uphone: $('#uphone').val(),
            email: $('#email').val(),
            umailAddress: $('#umailAddress').val(),
            uaddress: $('#uaddress').val(),
            udetailAddress: $('#udetailAddress').val()
        };

        $.ajax({
            type: 'POST',
            url: '/catshap/update-user-info',  // 서블릿의 매핑 URL
            data: JSON.stringify(userData),
            contentType: 'application/json; charset=utf-8',
            success: (response) => {
                alert('회원 정보가 수정되었습니다.');
            },
            error: (xhr, status, error) => {
                alert('회원 정보 수정에 실패했습니다.');
                console.error('Error:', xhr, status, error);
            }
        });
        
    });
    
     // 회원 탈퇴 동의 버튼을 클릭한 경우
    $('#accountExitBtn').on('click', (e) => {
        e.preventDefault();
        const upass = $('#upass').val().trim();
        const upassConfirm = $('#upassConfirm').val().trim();
        const isPasswordValid = validatePassword();
        const isEequalPassword = equalPassword(upass, upassConfirm);
        const userNo = $('#user-data').data('user-no');

        if (isPasswordValid && isEequalPassword) {
            $('#upassConfirm-error').text("비밀번호가 일치합니다.").css('color', 'blue').show();
            if ($('#accountExit').is(':checked')) {
                $.ajax({
                    type: 'POST',
                    url: '/catshap/user-exit-pass-confirm',
                    data: {
                        userNo: userNo,
                        upass: upass
                    },
                    success: function (response) {
                        if (response.success) {
                            alert('회원탈퇴 성공!');
                            window.location.href = 'user_logoutProc.jsp';
                        } else {
                            alert('회원탈퇴 실패...');
                        }
                    },
                    error: function () {
                        alert('서버 오류가 발생했습니다.');
                    }
                });
            } else {
                alert('회원 탈퇴를 하기 위해서는 탈퇴 동의를 체크해야합니다.');
            }
        }
    });

    // 회원 탈퇴 취소 버튼을 클릭한 경우
    $('#userExitCancelBtn').on('click', () => {
        window.location.href = 'user_mypage.jsp';
    });

    // 취소 버튼 클릭 시 페이지를 이전 페이지로 이동
    $('#modifyCancelBtn').click(function () {
        window.history.back();
    });

});

// 유효성 검사 메소드
const validate = (id, regex, blankErrorMsg, regexErrorMsg) => {
    return validateField(`#${id}`, `#${id}-error`, blankErrorMsg) &&
        validateFormat(`#${id}`, `#${id}-error`, regexErrorMsg, regex);
}

// 새로운 비밀번호 유효성 검사 메소드
const validatePassword = () => {
    const upass = $('#upass').val().trim();
    const typesCount = [regex.lowerCase.test(upass),
    regex.upperCase.test(upass),
    regex.number.test(upass),
    regex.specialChar.test(upass)]
        .filter(Boolean).length;

    const upassBlankValid = validateField('#upass', '#upass-error', '비밀번호를 입력해주세요.');
    let upassPatternValid = false;
    if (!regex.upasslength.test(upass) || typesCount < 3) {
        $('#upass-error').text('비밀번호는 8~16자 사이이며, 대문자, 소문자, 숫자, 특수문자 중 3가지 이상을 포함해야 합니다.').show();
        upassPatternValid = false;
    } else {
        $('#upass-error').hide();
        upassPatternValid = true;
    }
    return upassBlankValid && upassPatternValid;
}

// 비밀번호 일치 여부 확인 메소드
const equalPassword = (upass, upassConfirm) => {
    if (upass !== upassConfirm) {
        $('#upassConfirm-error').text("비밀번호가 일치하지 않습니다.").css('color', 'red').show();
        return false;
    } else {
        $('#upassConfirm-error').text('비밀번호가 일치합니다.').css('color', 'blue');
        return true;
    }
}

//정규식까지 맞을 때 비밀번호일치 메세지 표시
const validateAndCheckPassword = () => {
    // 비밀번호 필드와 비밀번호 확인 필드가 존재하는지 확인
    const passwordElement = $('#upass');
    const confirmPasswordElement = $('#upass_re');

    if (passwordElement.length && confirmPasswordElement.length) {
        const password = passwordElement.val() ? passwordElement.val().trim() : '';
        const confirmPassword = confirmPasswordElement.val() ? confirmPasswordElement.val().trim() : '';

        const isPasswordValid = validatePassword();
        if (isPasswordValid) {
            equalPassword(password, confirmPassword);
        } else {
            $('#upassConfirm-error').hide(); // 비밀번호 유효하지 않으면 일치 여부 메시지 숨김
        }
    } else {
        console.error("Password input elements not found.");
    }
};

//약관동의 체크 확인
const validateAgreement = (checkboxId, errorMsgId, errorMsg) => {
    const errorField = $(errorMsgId);
    if ($(checkboxId).is(':checked')) {
        errorField.text('');
        return true;
    } else {
        errorField.text(errorMsg);
        return false;
    }
}

//회원가입 버튼클릭시 유효검사
const isFormValid = () => {
    return (
        validateAgreement('#termsOfUseAgree', '#termsOfUseAgree_error', '이용약관에 동의해야 합니다.') &&
        validateAgreement('#privacyAgree', '#privacyAgree_error', '개인정보 수집 및 이용에 동의해야 합니다.')
    );
}

// 전화번호 형식화 함수
const formatPhoneNumber = (value) => {
    if (value === undefined || value === null) {
        return '';
    }

    value = value.replace(/\D/g, ''); // 숫자만 남기기
    if (value.length <= 3) {
        return value;
    } else if (value.length <= 7) {
        return value.slice(0, 3) + '-' + value.slice(3);
    } else {
        return value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
    }
}

// 아이디 닉네임 중복확인 함수
const checkDuplicate = (type, value) => {
    const errorField = $(`#${type}-error`);
    if (value === '') {
        errorField.text('필드를 입력해 주세요.');
        return;
    }

    $.post('/catshap/checkDuplicate', { type, value })
        .done(function (data) {
            if (data.isAvailable) {
                errorField.text(`사용 가능한 ${type === 'usid' ? '아이디' : '닉네임'}입니다.`).css('color', 'blue').show();
            } else {
                errorField.text(`${type === 'usid' ? '아이디' : '닉네임'}가 이미 사용 중입니다.`).css('color', 'red').show();
            }
        })
        .fail(function (error) {
            console.error('Error:', error);
        });
}

// 실시간 회원가입 입력 유효성 검사 이벤트 추가
const validateInput = () => {
    $('#usid').on('input', () => validate('usid', regex.usid, '아이디를 입력해주세요.', '아이디는 4~16자 영문 소문자 및 숫자만 사용할 수 있습니다.'));
    $('#upass, #upass_re').on('input', validateAndCheckPassword);
    $('#unick').on('input', () => validate('unick', regex.unick, '닉네임을 입력해주세요.', '닉네임은 2~10자의 한글, 영문, 숫자만 사용할 수 있습니다.'));
    $('#email').on('input', () => validate('email', regex.email, '이메일을 입력해주세요.', '유효한 이메일 주소를 입력하세요.'));
    $('#uphone').on('input', function () {
        const value = this.value || ''; // this.value가 undefined일 경우 빈 문자열로 대체
        $(this).val(formatPhoneNumber(value));
    }).on('blur', function () {
        const value = this.value || ''; // this.value가 undefined일 경우 빈 문자열로 대체
        $(this).val(formatPhoneNumber(value));
    });
    $('#uname').on('input', () => validate('uname', regex.uname, '이름을 입력해주세요.', '이름은 한글 또는 영문만 입력 가능합니다.'));
    $('#termsOfUseAgree').on('change', () => validateAgreement('#termsOfUseAgree', '#termsOfUseAgree_error', '이용약관에 동의해야 합니다.'));
    $('#privacyAgree').on('change', () => validateAgreement('#privacyAgree', '#privacyAgree_error', '개인정보 수집 및 이용에 동의해야 합니다.'));
    $('#mktAgree').on('change', () => validateAgreement('#mktAgree', '', ''));
}

