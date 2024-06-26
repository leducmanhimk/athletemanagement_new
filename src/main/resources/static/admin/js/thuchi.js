async function loadAllThuChi() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/revenue-expenditure/admin/findAll?oke=e';
    var start = document.getElementById("start").value
    var end = document.getElementById("end").value
    if (start != "" && end != "") {
        url += '&from=' + start + '&to=' + end;
    }
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    console.log(list)
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<tr>
                    <td>${list[i].id}</td>
                    <td>${list[i].title}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].payDate}</td>
                    <td>${formatmoney(list[i].amount)}</td>
                    <td>${list[i].revenueType}</td>
                    <td>
                        <i onclick="deleteThuChi(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addthuchi?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                        ${list[i].bill == null || list[i].bill == "" ?'':`<a target="_blank" href="${list[i].bill}"><i class="fa fa-eye icontable"></i></a>`}
                    </td>
                </tr>`
    }
    document.getElementById("listthuchi").innerHTML = main
    $('#example').DataTable({
        layout: {
            topStart: {
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
            }
        }
    });
}



var linkbill = ''
async function themThuChi() {
    document.getElementById("loading").style.display = 'block'
    var avt = await uploadFile(document.getElementById("hoadon"));
    if(avt != null){linkbill = avt}
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var thuchi = {
        "id": id,
        "payDate": document.getElementById("ngaytt").value,
        "amount": document.getElementById("tongtien").value,
        "title": document.getElementById("title").value,
        "content": tinyMCE.get('editor').getContent(),
        "bill": linkbill,
        "revenueType": document.getElementById("loai").value,
    }
    var url = 'http://localhost:8080/api/revenue-expenditure/admin/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(thuchi)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'thuchi'
            });
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
    document.getElementById("loading").style.display = 'none'
}

async function loadAThuChi(id) {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/revenue-expenditure/admin/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("title").value = result.title
        document.getElementById("ngaytt").value = result.payDate
        document.getElementById("tongtien").value = result.amount
        document.getElementById("loai").value = result.revenueType
        linkbill = result.bill
        tinyMCE.get('editor').setContent(result.content)
    }
}

async function deleteThuChi(id) {
    var con = confirm("Bạn chắc chắn muốn xóa khoản thu-chi này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/revenue-expenditure/admin/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllThuChi();
    }
    else{
        if (response.status == exceptionCode) {
            var result = await response.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.error("Xóa thất bại");
        }
    }
}
