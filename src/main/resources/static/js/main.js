var exceptionCode = 417;
$( document ).ready(function() {
    // var taikhoan = localStorage.getItem("taikhoan");
    // if(taikhoan == null){
    //     window.location.replace("login")
    //     return;
    // }
    var tendangnhap = JSON.parse(taikhoan).hoTen
    var main =
    `<div class="divroot">
        <h3>ROOT</h3>
    </div>
    <div class="listmenutop">
        <div class="pendingsw">
            <h3>MENU</h3>
        </div>
    </div>
    <div class="listmenumain">
        <a href="index">Hôm nay ăn gì</a>
        <a href="lichsuanuong">Lịch sử ăn uống</a>
        <a href="thongtincanhan">Thông tin cá nhân</a>
        <a href="mailto:hieutran02102804@gmail.com">Góp ý cho chúng tôi</a>
        <a href="#" class="dropdown-toggle" id="navbardm" role="button" data-bs-toggle="dropdown" aria-expanded="false">Quản lý danh mục</a>
        <ul class="dropdown-menu dopmenu" aria-labelledby="navbardm">
            <li><a class="dropdown-item" href="loaimonan">Nhóm dưỡng chất</a></li>
            <li><a class="dropdown-item" href="monan">Món ăn</a></li>
        </ul>
        <a href="">Hôm nay ăn hàng</a>
        <a href="#" onclick="dangXuat()">Đăng xuất</a>
    </div>`
    document.getElementById("navleft").innerHTML = main

    var header = 
    `<div class="lichheader">
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
            <span class="tendangnhap">${tendangnhap}</span>
            <img src="image/user.svg" class="userlogo">
        </a>
        <ul class="dropdown-menu listitemtk" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="thongtincanhan"><i class="fa fa-user"></i> Thay đổi thông tin cá nhân</a></li>
            <div class="dropdown-divider"></div>
            <li><a class="dropdown-item" onclick="dangXuat()" href="#"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
        </ul>
    </div>`
    document.getElementById("headerweb").innerHTML =  header
});

function dangXuat(){
    window.localStorage.removeItem('taikhoan')
    window.location.replace('login');
}