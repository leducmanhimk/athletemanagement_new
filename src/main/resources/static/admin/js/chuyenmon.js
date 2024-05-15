async function loadAllChuyenMon() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/specialize/all/findAll';
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
                    <td>${list[i].name}</td>
                    <td>
                        <i onclick="deleteChuyenMon(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a onclick="loadAChuyenMon(${list[i].id})" data-bs-toggle="modal" data-bs-target="#addtk" href="#"><i class="fa fa-edit icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listchuyenmon").innerHTML = main
    $('#example').DataTable();
}


function clearData(){
    document.getElementById("idcm").value = ""
    document.getElementById("tencm").value = ""
}


async function themChuyenMon() {
    var chuyenmon = {
        "id": document.getElementById("idcm").value,
        "name": document.getElementById("tencm").value,
    }
    var url = 'http://localhost:8080/api/specialize/admin/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(chuyenmon)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.reload();
            });
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
}

async function loadAChuyenMon(id) {
    var url = 'http://localhost:8080/api/specialize/all/findById?id=' + id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("idcm").value = result.id
    document.getElementById("tencm").value = result.name
}

async function deleteChuyenMon(id) {
    var con = confirm("Bạn chắc chắn muốn xóa chuyên môn này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/specialize/admin/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllChuyenMon();
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


async function loadAllChuyenMonSelect() {
    var url = 'http://localhost:8080/api/specialize/all/findAll';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].name}</option>`
    }
    document.getElementById("chuyenmon").innerHTML = main
}