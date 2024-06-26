var token = localStorage.getItem("token");
var user = localStorage.getItem("user");
var exceptionCode = 417
var avat = '../image/user.svg'
if(user != null){
    user = JSON.parse(user)
    avat = user.avatar
}
$( document ).ready(function() {
    checkroleCoach();
    var main =
    `<div class="divroot">
        <h3>Xin chào</h3>
    </div>
    <div class="listmenumain">
        <a href="vandongvien"><i class="fa fa-user"></i> Vận động viên</a>
        <a href="feedback"><i class="fa fa-comment"></i> Phản hồi</a>
        <a href="giaidau"><i class="fa fa-clock"></i> Giải đấu</a>
        <a href="baitap"><i class="fa fa-book"></i> Bài tập</a>
        <a href="lichtap"><i class="fa fa-calendar"></i> Lịch của tôi</a>
        <a data-bs-toggle="modal" data-bs-target="#modalmatkhau" href="#"><i class="fa fa-key"></i> Đổi mật khẩu</a>
        <a href="#" onclick="dangXuat()"><i class="fa fa-sign-out"></i> Đăng xuất</a>
    </div>
    `
    document.getElementById("navleft").innerHTML = main

    var header = 
    `<div class="ctnheader"><div class="lichheader">
        <img class="iconlich" src="../image/lich.png">
        <p class="text-uppercase fw-weight-bold mb-0 ngayhomnay">
            <script language="javascript">
                document.write(day_name);
            </script>
        </p>
        <p class="text-gray fst-italic mb-0">
            <p id="digital-clock"></p>
        </p>
    </div>
    <div class="userheader">
        <a class="nav-link dropdown-toggle menucha" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="tendangnhap">${user.fullName}</span>
            <img src="${avat}" class="userlogo">
        </a>
        <ul class="dropdown-menu listitemtk" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="thongtincanhan"><i class="fa fa-user"></i> Thay đổi thông tin cá nhân</a></li>
            <div class="dropdown-divider"></div>
            <li><a class="dropdown-item" onclick="dangXuat()" href="#"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
        </ul>
    </div></div> `
    document.getElementById("headerweb").innerHTML =  header

    document.getElementById('divdoimk').innerHTML += 
    ` <div class="modal fade" id="modalmatkhau" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cập nhật mật khẩu</h5> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body row">
                <form action="javascript:changePassword()" class="col-sm-6" style="margin: auto;">
                    <label class="lb-form">Mật khẩu hiện tại *</label>
                    <input id="oldpass" type="password" class="form-control">
                    <label class="lb-form">Mật khẩu mới *</label>
                    <input id="newpass" type="password" class="form-control">
                    <label class="lb-form">Xác nhận mật khẩu mới *</label>
                    <input id="renewpass" type="password" class="form-control"><br>
                    <button type="submit" class="btn btn-primary">CẬP NHẬT</button>
                </form>
            </div>
        </div>
    </div>
</div>`
});

function dangXuat(){
    window.localStorage.removeItem('user')
    window.localStorage.removeItem('token')
    window.location.replace('../login');
}


async function changePassword() {
    var oldpass = document.getElementById("oldpass").value
    var newpass = document.getElementById("newpass").value
    var renewpass = document.getElementById("renewpass").value
    var url = 'http://localhost:8080/api/user/all/change-password';
    if (newpass != renewpass) {
        alert("mật khẩu mới không trùng khớp");
        return;
    }
    var passw = {
        "oldPass": oldpass,
        "newPass": newpass
    }
    const response = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(passw)
    });
    if (response.status < 300) {
        swal({
                title: "Thông báo",
                text: "cập nhật mật khẩu thành công, hãy đăng nhập lại",
                type: "success"
            },
            function() {
                window.location.reload();
            });
    }
    if (response.status == exceptionCode) {
        var result = await response.json()
        toastr.warning(result.defaultMessage);
    }
}
localStorage.test = true
async function checkroleCoach() {
    if(token == null){
        window.location.href = '/login'
        return;
    }
    var url = 'http://localhost:8080/api/user/coach/check-role-coach';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status > 300) {
        window.location.href = '/login'
    }
}


function formatmoney(money) {
    const VND = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    });
    return VND.format(money);
}


async function uploadFile(filePath) {
    const formData = new FormData()
    formData.append("file", filePath.files[0])
    var urlUpload = 'http://localhost:8080/api/public/upload-file';
    const res = await fetch(urlUpload, {
        method: 'POST',
        body: formData
    });
    if (res.status < 300) {
        var linkbanner = await res.text();
        return linkbanner;
    }
    return null;
}




function getDateTime() {
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();//
    var a = 0;
    //
    if (month.toString().length == 1) {
        month = '0' + month;
    }
    if (day.toString().length == 1) {
        day = '0' + day;
    }
    if (hour.toString().length == 1) {
        hour = '0' + hour;
    }
    if (minute.toString().length == 1) {
        minute = '0' + minute;
    }
    if (second.toString().length == 1) {
        second = '0' + second;
    }
    var dateTime = year + '/' + month + '/' + day + ' ' + hour + ':'
        + minute + ':' + second;
    return dateTime;
}
setInterval(function () {
    currentTime = getDateTime();
    document.getElementById("digital-clock").innerHTML = currentTime;
}, 1000);

var date = new Date();

var current_day = date.getDay();

var day_name = '';

switch (current_day) {
    case 0:
        day_name = "Chủ nhật";
        break;
    case 1:
        day_name = "Thứ hai";
        break;
    case 2:
        day_name = "Thứ ba";
        break;
    case 3:
        day_name = "Thứ tư";
        break;
    case 4:
        day_name = "Thứ năm";
        break;
    case 5:
        day_name = "Thứ sáu";
        break;
    case 6:
        day_name = "Thứ bảy";
}
