async function loadAllUser() {
    $('#example').DataTable().destroy();
    var role = document.getElementById("role").value
    var url = 'http://localhost:8080/api/user/admin/get-user-by-role';
    if(role != ""){
        url += '?role='+role;
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
                    <td><img src="${list[i].avatar}" class="imgtable"></td>
                    <td>${list[i].email}</td>
                    <td>${list[i].fullName}</td>
                    <td>${list[i].phone}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].role}</td>
                    <td>
                        <i onclick="deleteTaiKhoan(${list[i].id})" class="fa fa-trash icontable"></i>
                        <i style="color:${list[i].actived == true?'green':'red'}" onclick="lockOrUnlock(${list[i].id})" class="fa fa-${list[i].actived == true?'unlock':'lock'} icontable"></i>
                        ${list[i].role == 'ROLE_ATHLETE'?'':`<a href="addtaikhoan?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>`}
                    </td>
                </tr>`
    }
    document.getElementById("listuser").innerHTML = main
    $('#example').DataTable();
}


var linkavatar = '';
var linkhopdong = '';

async function themTaiKhoan() {
    document.getElementById("loading").style.display = 'block'
    var avt = await uploadFile(document.getElementById("avatar"));
    var hd = await uploadFile(document.getElementById("hopdong"));
    if(avt != null){linkavatar = avt}
    if(hd != null){linkhopdong = avt}
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var user = {
        "id": id,
        "email": document.getElementById("email").value,
        "fullName": document.getElementById("fullName").value,
        "phone": document.getElementById("phone").value,
        "address": document.getElementById("diachi").value,
        "linkContract": linkhopdong,
        "avatar": linkavatar,
        "gender": document.getElementById("gioitinh").value,
        "role": document.getElementById("quyen").value,
    }
    var url = 'http://localhost:8080/api/user/admin/create';
    if(id != null){
        url = 'http://localhost:8080/api/user/admin/update';
    }
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(user)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Tạo tài khoản thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'taikhoan'
            });
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
    document.getElementById("loading").style.display = 'none'
}

async function loadATaiKhoan() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/user/admin/find-by-id?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("fullName").value = result.fullName
        document.getElementById("phone").value = result.phone
        document.getElementById("email").value = result.email
        document.getElementById("diachi").value = result.address
        document.getElementById("gioitinh").value = result.gender
        document.getElementById("quyen").value = result.role
        document.getElementById("imgpreview").src = result.avatar
        linkavatar = result.avatar
        linkhopdong = result.linkContract
    }
}


async function loadAllUserByRole(role) {
    var url = 'http://localhost:8080/api/user/admin/get-user-by-role?role='+role;
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
        main += `<option value="${list[i].id}">${list[i].fullName} - ${list[i].email}</option>`
    }
    document.getElementById("userselect").innerHTML = main
}


async function deleteTaiKhoan(id) {
    var con = confirm("Bạn chắc chắn muốn xóa tài khoản này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/user/admin/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllUser();
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


async function lockOrUnlock(id) {
    var con = confirm("Xác nhận hành động?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/user/admin/lockOrUnlockUser?id=' + id;
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("Thành công!");
        loadAllUser();
    } else {
        toastr.error("Thất bại");
    }
}