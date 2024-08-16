window.onload = function () {

    // 안내 팝업창
    $(".btn").click(function () {
        $("#event").show();
    })
    $("#event span").click(function () {
        $("#event").hide();
    })

    // 타이틀 클릭시 위로 올라가게하기
    const title = document.querySelectorAll('.title');
    const content = document.querySelectorAll('.content');

    title.forEach(content => {
        content.addEventListener('click', function () {
            const targetId = this.getAttribute('data-target');
            const targetDiv = document.getElementById(targetId);
            targetDiv.classList.toggle('hidden')
        });
    })

    // 체크 박스 클릭시 모두 클릭하기
    const allcheckbox = document.getElementById('allcheckbox');
    const checkbox = [
        document.getElementById('main5check1'),
        document.getElementById('main5check2'),
        document.getElementById('main5check3')
    ];


    allcheckbox.addEventListener('change', function () {
        if (this.checked) {
            checkbox.forEach(cb => cb.checked = true);
        } else {
            checkbox.forEach(cb => cb.checked = false);
        }

    });

}