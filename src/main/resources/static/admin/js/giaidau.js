async function loadAllGiaiDau() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/tournament/all/findAll?oke=2';
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
                    <td>${list[i].name}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].competitionDay}</td>
                    <td>${list[i].description}</td>
                    <td>${list[i].specialize.name}</td>
                    <td>
                        <label class="checkbox-custom">
                            <input onchange="lockUnlock(${list[i].id}, this)" id="primaryBlog" type="checkbox" ${list[i].lockRegis == true?'checked':''}>
                            <span class="checkmark-checkbox"></span>
                        </label>
                    </td>
                    <td>
                        <i onclick="deleteGiaiDau(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addgiaidau?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                        <i onclick="loadAllGiaiDauUser(${list[i].id})" data-bs-toggle="modal" data-bs-target="#modalvdvdangky" class="fa fa-eye icontable"></i>
                    </td>
                </tr>`
    }
    document.getElementById("listgiaidau").innerHTML = main
    $('#example').DataTable();
}

async function loadAllGiaiDauUser(id) {
    var url = 'http://localhost:8080/api/tournament-athlete/admin/find-by-tournament?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<tr>
                    <td>${list[i].athlete.user.fullName}<br>${list[i].athlete.user.email}</td>
                    <td>${list[i].createdDate}</td>
                    <td>
                        <textarea id="ketqua${list[i].id}" class="form-control">${list[i].result}</textarea>
                        <a onclick="capNhatKetQua(${list[i].id})" href="#"><i class="fa fa-check icontable"></i></a>
                    </td>
                    <td>
                        <label class="checkbox-custom">
                            <input onchange="acceptDki(${list[i].id}, this)" id="primaryBlog" type="checkbox" ${list[i].accepted == true?'checked':''}>
                            <span class="checkmark-checkbox"></span>
                        </label>
                    </td>
                </tr>`
    }
    document.getElementById("listdki").innerHTML = main
}

async function lockUnlock(id, e) {
    var url = 'http://localhost:8080/api/tournament/admin/lock-unlock-regis?id='+id;
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await res.json();
    if (res.status < 300) {
        toastr.success("Đã cập nhật trạng thái");
        // loadAllGiaiDau();
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

async function acceptDki(id) {
    var url = 'http://localhost:8080/api/tournament-athlete/admin/accept?id='+id;
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await res.json();
    if (res.status < 300) {
        toastr.success("Đã cập nhật thành công");
        // loadAllGiaiDau();
    }
    else{
        if (res.status == exceptionCode) {
            var result = await res.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.error("Thất bại");
        }
    }
}

async function capNhatKetQua(id) {
    var ketqua = document.getElementById("ketqua"+id).value;
    var url = 'http://localhost:8080/api/tournament-athlete/admin/cap-nhat-noi-dung?id='+id;
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'text/plain'
        }),
        body: ketqua
    });
    var result = await res.json();
    if (res.status < 300) {
        toastr.success("Đã cập nhật kết quả thành công");
    }
    else{
        if (res.status == exceptionCode) {
            var result = await res.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.error("Cập nhật kết quả thất bại");
        }
    }
}

async function themGiaiDau() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var giaidau = {
        "id": id,
        "name": document.getElementById("tengd").value,
        "description": document.getElementById("mota").value,
        "competitionDay": document.getElementById("ngaytd").value,
        "content": tinyMCE.get('editor').getContent(),
        "specialize": {
            "id":document.getElementById("chuyenmon").value
        },
    }
    var url = 'http://localhost:8080/api/tournament/admin/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(giaidau)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'giaidau'
            });
    }
    else{
        if (res.status == exceptionCode) {
            var result = await res.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.error("Xóa thất bại");
        }
    }
}

async function loadAGiaiDau(id) {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/tournament/all/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("tengd").value = result.name
        document.getElementById("ngaytd").value = result.competitionDay
        document.getElementById("mota").value = result.description
        tinyMCE.get('editor').setContent(result.content)
        await loadAllChuyenMonSelect();
        document.getElementById("chuyenmon").value = result.specialize.id
    }
}

async function deleteGiaiDau(id) {
    var con = confirm("Bạn chắc chắn muốn xóa giải đấu này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/tournament/admin/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllGiaiDau();
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

