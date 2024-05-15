async function loadAllVdv() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/athlete/admin/get-all';
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
                    <td><img src="${list[i].user.avatar}" class="imgtable"></td>
                    <td>${list[i].user.email}</td>
                    <td>${list[i].user.fullName}</td>
                    <td>${list[i].user.phone}</td>
                    <td>${list[i].user.createdDate}</td>
                    <td>${list[i].coach.fullName}</td>
                    <td>${list[i].specialize.name}</td>
                    <td>
                        <i onclick="deleteVdv(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addvandongvien?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listvdv").innerHTML = main
    $('#example').DataTable();
}


async function loadAVanDongVien() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/athlete/all/find-by-id?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("fullName").value = result.user.fullName
        document.getElementById("phone").value = result.user.phone
        document.getElementById("email").value = result.user.email
        document.getElementById("diachi").value = result.user.address
        document.getElementById("gioitinh").value = result.user.gender
        document.getElementById("imgpreview").src = result.user.avatar
        linkavatar = result.user.avatar
        linkhopdong = result.user.linkContract
        document.getElementById("ngaysinh").value = result.dob
        document.getElementById("iduser").value = result.user.id
        document.getElementById("cannang").value = result.weight
        document.getElementById("chieucao").value = result.height
        tinyMCE.get('editor').setContent(result.description)
        await loadAllChuyenMonSelect();
        document.getElementById("chuyenmon").value = result.specialize.id
        await loadAllUserByRole('ROLE_COACH');
        document.getElementById("userselect").value = result.coach.id
    }
}


var linkavatar = '';
var linkhopdong = '';

async function themVanDongVien() {
    document.getElementById("loading").style.display = 'block'
    var avt = await uploadFile(document.getElementById("avatar"));
    var hd = await uploadFile(document.getElementById("hopdong"));
    if(avt != null){linkavatar = avt}
    if(hd != null){linkhopdong = avt}
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var user = {
        "id": document.getElementById("iduser").value,
        "email": document.getElementById("email").value,
        "fullName": document.getElementById("fullName").value,
        "phone": document.getElementById("phone").value,
        "address": document.getElementById("diachi").value,
        "linkContract": linkhopdong,
        "avatar": linkavatar,
        "gender": document.getElementById("gioitinh").value,
        "role": "ROLE_ATHLETE",
    }
    var vdv = {
        "id":id,
        "dob":document.getElementById("ngaysinh").value,
        "height":document.getElementById("chieucao").value,
        "weight":document.getElementById("cannang").value,
        "description":tinyMCE.get('editor').getContent(),
        "user":user,
        "specialize":{
            "id":document.getElementById("chuyenmon").value
        },
        "coach":{
            "id":document.getElementById("userselect").value
        },
    }
    console.log(vdv);
    var url = 'http://localhost:8080/api/athlete/admin/create';
    if(id != null){
        url = 'http://localhost:8080/api/athlete/admin/update';
    }
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(vdv)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'vandongvien'
            });
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
    document.getElementById("loading").style.display = 'none'
}



async function deleteVdv(id) {
    var con = confirm("Bạn chắc chắn muốn xóa vận động viên này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/athlete/admin/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllVdv();
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
