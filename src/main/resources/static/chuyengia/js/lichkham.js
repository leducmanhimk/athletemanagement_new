
async function loadAllLichKham() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/physical-exam/expert/findAll?oke=2';
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
                    <td>${list[i].name}</td>
                    <td>${list[i].examDay}</td>
                    <td>${list[i].examPlace}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].result}</td>
                    <td><a href="${list[i].linkResult}">Xem</a></td>
                    <td>${list[i].athlete.user.fullName}<br>Chuyên môn:${list[i].athlete.specialize.name}</td>
                    <td>
                        <i onclick="deleteLichKham(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addlichkham?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listlichkham").innerHTML = main
    $('#example').DataTable();
}

async function loadAllVdvSelect() {
    var url = 'http://localhost:8080/api/athlete/expert/get-all';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].user.fullName}</option>`
    }
    document.getElementById("vandongvien").innerHTML = main
}


var linkFile = '';
async function themLichKham() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var linktam = await uploadFile(document.getElementById("filekq"));
    if(linktam != null){linkFile = linktam}
    var lichkham = {
        "id": id,
        "name": document.getElementById("ten").value,
        "examDay": document.getElementById("ngaykham").value,
        "examPlace": document.getElementById("noikham").value,
        "result": tinyMCE.get('editor').getContent(),
        "linkResult": linkFile,
        "athlete": {
            "id":document.getElementById("vandongvien").value
        },
    }
    var url = 'http://localhost:8080/api/physical-exam/expert/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(lichkham)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'lichkham'
            });
    }
    else{
        if (res.status == exceptionCode) {
            var result = await res.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.success("Thất bại");
        }
    }
}

async function loadALichKham(id) {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/physical-exam/expert/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("ten").value = result.name
        document.getElementById("ngaykham").value = result.examDay
        document.getElementById("noikham").value = result.examPlace
        linkFile = result.linkResult
        tinyMCE.get('editor').setContent(result.result)
        await loadAllVdvSelect();
        document.getElementById("vandongvien").value = result.athlete.id
    }
}

async function deleteLichKham(id) {
    var con = confirm("Bạn chắc chắn muốn xóa lịch khám này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/physical-exam/expert/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllLichKham();
    }
    else{
        if (response.status == exceptionCode) {
            var result = await response.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.success("Xóa thất bại");
        }
    }
}

