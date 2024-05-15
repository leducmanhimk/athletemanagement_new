async function loadAllGiaiDau() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/tournament/athlete/findAll?oke=2';
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
        var btndki = '';
        if(list[i].daDangKy != true && list[i].lockRegis != true){
            btndki = `<br><br><span onclick="sendRequest(${list[i].id})" class="btn btn-primary pointer"><i class="fa fa-edit"></i> Đăng ký</span>`;
        }
        if(list[i].daDangKy == true){
            btndki = `<br><br><span onclick="huyDangKy(${list[i].id})" class="btn btn-danger pointer"><i class="fa fa-remove"></i> Hủy đăng ký</span>`
        }
        main += `<tr>
                    <td>${list[i].name}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].competitionDay}</td>
                    <td>${list[i].description}</td>
                    <td>${list[i].specialize.name}</td>
                    <td>
                        <span data-bs-toggle="modal" data-bs-target="#modalnoidung" onclick="loadAGiaiDau(${list[i].id})" class="pointer">Nội dung</span>
                        ${btndki}
                    </td>
                </tr>`
    }
    document.getElementById("listgiaidau").innerHTML = main
    $('#example').DataTable();
}

async function sendRequest(id) {
    var con = confirm("Xác nhận đăng ký");
    if(con == false){
        return;
    }
    var url = 'http://localhost:8080/api/tournament-athlete/athlete/send-request?id=' + id;
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (res.status < 300) {
        toastr.success("Đã đăng ký thành công");
        loadAllGiaiDau();
        loadGiaiDauDaDangKy();
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

async function huyDangKy(id) {
    var con = confirm("Xác nhận hủy đăng ký");
    if(con == false){
        return;
    }
    var url = 'http://localhost:8080/api/tournament-athlete/athlete/delete?id=' + id;
    const res = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (res.status < 300) {
        toastr.success("Đã đăng hủy ký thành công");
        loadAllGiaiDau();
        loadGiaiDauDaDangKy();
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

async function loadGiaiDauDaDangKy() {
    $('#exampledki').DataTable().destroy();
    var url = 'http://localhost:8080/api/tournament-athlete/athlete/my-tournament-athlete';
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
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].accepted == true?'<span class="green">Đã xác nhận</span>':'<span class="red">Chưa xác nhận</span>'}</td>
                    <td>${list[i].result == null?'Chưa có kết quả':list[i].result}</td>
                    <td>
                    <span onclick="huyDangKy(${list[i].tournament.id})" class="btn btn-danger pointer"><i class="fa fa-remove"></i> Hủy đăng ký</span>
                    </td>
                </tr>`
    }
    document.getElementById("listgiaidauđaki").innerHTML = main
    $('#exampledki').DataTable();
}
