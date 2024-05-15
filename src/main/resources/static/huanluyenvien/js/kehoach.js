var idvdvchon = -1;

async function loadAllKeHoach(idvdv) {
    idvdvchon = idvdv;
    var url = 'http://localhost:8080/api/plan/all/find-by-athlete?id='+idvdvchon;
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
                    <td>${list[i].complete == true?'Đã hoàn thành':'Chưa hoàn thành'}</td>
                    <td>${list[i].athlete.user.fullName}</td>
                    <td>
                    <i onclick="deleteThuChi(${list[i].id})" class="fa fa-trash icontable"></i>
                    <a onclick="loadAKeHoach(${list[i].id})" href="#"><i class="fa fa-edit icontable"></i></a>
                    <a href="lichtapvdv?vdv=${idvdvchon}&kehoach=${list[i].id}">xem lịch tập</a>
                    </td>
                </tr>`
    }
    document.getElementById("listkehoachtl").innerHTML = main
}

async function loadAKeHoach(id) {
    var url = 'http://localhost:8080/api/plan/all/findById?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("idkh").value = result.id
    document.getElementById("tenkhtl").value = result.name
    document.getElementById("trangthaiht").checked = result.complete
}

function lamMoi(){
    document.getElementById("idkh").value = ""
    document.getElementById("tenkhtl").value = ""
    document.getElementById("trangthaiht").checked = false
}



async function themKeHoach() {
    var kehoach = {
        "id": document.getElementById("idkh").value,
        "name": document.getElementById("tenkhtl").value,
        "complete": document.getElementById("trangthaiht").checked,
        "athlete":{
            "id":idvdvchon
        }
    }
    var url = 'http://localhost:8080/api/plan/coach/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(kehoach)
    });
    var result = await res.json();
    if (res.status < 300) {
        toastr.success("Thành công");
        loadAllKeHoach(idvdvchon)
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
}

async function loadAllKeHoachSelect() {
    var uls = new URL(document.URL)
    var vdv = uls.searchParams.get("vdv");
    var url = 'http://localhost:8080/api/plan/all/find-by-athlete?id='+vdv;
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
    document.getElementById("kehoach").innerHTML = main
}


async function loadTtKeHoachLichTap() {
    var uls = new URL(document.URL)
    var vdv = uls.searchParams.get("vdv");
    var kehoach = uls.searchParams.get("kehoach");

    var url = 'http://localhost:8080/api/plan/all/findById?id='+kehoach;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("thongtinlichtap").innerHTML ="VĐV: "+result.athlete.user.fullName+", kế hoạch: "+'<strong>'+result.name+'</strong>'
}

async function loadKeHoachSelect() {
    var uls = new URL(document.URL)
    var vdv = uls.searchParams.get("vdv");
    var kehoach = uls.searchParams.get("kehoach");
    var url = 'http://localhost:8080/api/plan/all/find-by-athlete?id='+vdv;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<option ${list[i].id == kehoach?'selected':''} value="${list[i].id}">${list[i].name}</option>`
    }
    document.getElementById("kehoachselect").innerHTML = main
}
