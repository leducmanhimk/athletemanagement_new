var exceptionCode = 417;
async function dangNhap() {
    var user = {
        "email": document.getElementById("email").value,
        "password": document.getElementById("password").value,
    }
    const response = await fetch('http://localhost:8080/api/user/public/login', {
        method: 'POST',
        headers: new Headers({
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(user)
    });
    var result = await response.json();
    if (response.status < 300) {
        localStorage.setItem("user", JSON.stringify(result.user));
        localStorage.setItem("token", result.token);
        localStorage.setItem("user", JSON.stringify(result.user));
        localStorage.setItem("token", result.token);
        if (result.user.role === "ROLE_ADMIN") {
            window.location.href = 'admin/index';
        }
        else if (result.user.role === "ROLE_ATHLETE") {
            window.location.href = 'vandongvien/hoso';
        }
        else if (result.user.role === "ROLE_COACH") {
            window.location.href = 'huanluyenvien/vandongvien';
        }
        else if (result.user.role === "ROLE_EXPERT") {
            window.location.href = 'chuyengia/lichkham';
        }
    }
    else{
        if (response.status == exceptionCode) {
            toastr.error(result.defaultMessage);
        }
        else{
            toastr.error("Tài khoản hoặc mật khẩu không chính xác");
        }
    }
}

async function forgorPassword() {
    var email = document.getElementById("email").value
    var url = 'http://localhost:8080/api/user/public/forgot-password?email=' + email
    const res = await fetch(url, {
        method: 'POST'
    });
    if (res.status < 300) {
        swal({
                title: "",
                text: "Mật khẩu đã được gửi về email của bạn",
                type: "success"
            },
            function() {
                window.location.replace("login")
            });
    }
    if (res.status == exceptionCode) {
        var result = await res.json()
        toastr.warning(result.defaultMessage);
    }
}