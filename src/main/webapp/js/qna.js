document.addEventListener('DOMContentLoaded', () => {
    const tableBody = document.getElementById('qnaTableBody');
    const pagination = document.getElementById('pagination');
    let currentPage = 1;
    const rowsPerPage = 10;

    const displayTable = () => {
        const qnaBoardList = window.qnaBoardList;
        tableBody.innerHTML = '';
        const start = (currentPage - 1) * rowsPerPage;
        const end = Math.min(start + rowsPerPage, qnaBoardList.length);

        for (let i = start; i < end; i++) {
            const qna = qnaBoardList[i];
            const row = document.createElement('tr');
            row.style.cursor = 'pointer';
            row.onclick = () => {
                window.location.href = `qnaboarddetail.jsp?qnano=${qna.qnano}`;
            };

            const categoryCell = document.createElement('td');
            switch (qna.qnacatno) {
                case 1:
                    categoryCell.textContent = '상품문의';
                    break;
                case 2:
                    categoryCell.textContent = '배송문의';
                    break;
                case 3:
                    categoryCell.textContent = '기타문의';
                    break;
                default:
                    categoryCell.textContent = '알 수 없음';
            }
            row.appendChild(categoryCell);

            const titleCell = document.createElement('td');
            titleCell.textContent = qna.qnatitle;
            row.appendChild(titleCell);

            const authorCell = document.createElement('td');
            authorCell.textContent = qna.uname;
            row.appendChild(authorCell);

            const dateCell = document.createElement('td');
            dateCell.textContent = qna.qnaregdate;
            row.appendChild(dateCell);

            tableBody.appendChild(row);
        }

        updatePaginationControls();
    };

    const updatePaginationControls = () => {
        const qnaBoardList = window.qnaBoardList;
        pagination.innerHTML = '';
        const totalPages = Math.ceil(qnaBoardList.length / rowsPerPage);

        if (currentPage > 1) {
            const prevButton = document.createElement('button');
            prevButton.textContent = '이전';
            prevButton.onclick = () => {
                currentPage--;
                displayTable();
            };
            pagination.appendChild(prevButton);
        }

        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            pageButton.disabled = (i === currentPage);
            pageButton.onclick = (() => {
                return () => {
                    currentPage = i;
                    displayTable();
                };
            })();
            pagination.appendChild(pageButton);
        }

        if (currentPage < totalPages) {
            const nextButton = document.createElement('button');
            nextButton.textContent = '다음';
            nextButton.onclick = () => {
                currentPage++;
                displayTable();
            };
            pagination.appendChild(nextButton);
        }
    };

    displayTable();
});
