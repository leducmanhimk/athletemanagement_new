
async function loadAllTranThuong() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/injuries/expert/findAll';
    var vandongvien = document.getElementById("vandongvien").value
    if (vandongvien != -1) {
        url += '?idvdv=' + vandongvien
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
                    <td>${list[i].athlete.user.fullName}, ${list[i].athlete.specialize.name}</td>
                    <td>${list[i].injuriesDate}</td>
                    <td>${list[i].location}</td>
                    <td>${list[i].severity}</td>
                    <td>${list[i].status}</td>
                    <td>
                        <i onclick="deleteTranThuong(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addtranthuong?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listTranthuong").innerHTML = main
    $('#example').DataTable();
}

async function loadVdvSelect() {
    var url = 'http://localhost:8080/api/athlete/expert/get-all';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '<option value="-1">tất cả vận động viên</option>';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].user.fullName} - ${list[i].specialize.name} - ${list[i].user.email}</option>`
    }
    document.getElementById("vandongvien").innerHTML = main
    const ser = $("#vandongvien");
    ser.select2({
        placeholder: "Chọn vận động viên",
    });
}


async function themTranThuong() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var tranthuong = {
        "id": id,
        "injuriesDate": document.getElementById("ngaytt").value,
        "location": document.getElementById("vitri").value,
        "severity": document.getElementById("mudonghiemtrong").value,
        "status": tinyMCE.get('editor').getContent(),
        "athlete": {
            "id":document.getElementById("vandongvien").value
        },
    }
    var url = 'http://localhost:8080/api/injuries/expert/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(tranthuong)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'tranthuong'
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

async function loadATranThuong() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/injuries/expert/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("ngaytt").value = result.injuriesDate
        document.getElementById("vitri").value = result.location
        document.getElementById("mudonghiemtrong").value = result.severity
        tinyMCE.get('editor').setContent(result.status)
        await loadVdvSelectThem();
        document.getElementById("vandongvien").value = result.athlete.id
    }
}

async function deleteTranThuong(id) {
    var con = confirm("Bạn chắc chắn muốn xóa trấn thương này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/injuries/expert/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllTranThuong();
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

async function loadVdvSelectThem() {
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
        main += `<option value="${list[i].id}">${list[i].user.fullName} - ${list[i].specialize.name} - ${list[i].user.email}</option>`
    }
    document.getElementById("vandongvien").innerHTML = main
    const ser = $("#vandongvien");
    ser.select2({
        placeholder: "Chọn vận động viên",
    });
}
