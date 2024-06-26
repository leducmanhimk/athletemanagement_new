async function loadAllVdv() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/athlete/coach/get-by-coach';
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
                    <td>${list[i].dob}</td>
                    <td>${list[i].specialize.name}</td>
                    <td>
                         <span class="pointer" data-bs-toggle="modal" data-bs-target="#modalkehoachhl" onclick="loadAllKeHoach(${list[i].id})">Xem</span><br>
                    </td>
                    <td>
                        <a target="_blank" href="hoso?id=${list[i].id}">Xem</a>
                    </td>
                </tr>`
    }
    document.getElementById("listvdv").innerHTML = main
    $('#example').DataTable();
}


async function loadAVanDongVien(id) {
    var url = 'http://localhost:8080/api/athlete/all/find-by-id?id=' + id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("avataracc").src = result.user.avatar
    document.getElementById("hoten").innerHTML = result.user.fullName
    document.getElementById("phone").innerHTML = result.user.phone
    document.getElementById("email").innerHTML = result.user.email
    document.getElementById("diachi").innerHTML = result.user.address
    document.getElementById("gioitinh").innerHTML = result.user.gender
    document.getElementById("ngaysinh").innerHTML = result.dob
    document.getElementById("cannang").innerHTML = result.weight + " kg"
    document.getElementById("chieucao").innerHTML = result.height +' cm'
    document.getElementById("chuyenmon").innerHTML = result.specialize.name
    document.getElementById("motavdv").innerHTML = result.description
}


async function loadVdvSelect() {
    var url = 'http://localhost:8080/api/athlete/coach/get-by-coach';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].user.fullName} - ${list[i].user.email}</option>`
    }
    document.getElementById("vandongvien").innerHTML = main
}


async function loadHoSoVdv() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var url = 'http://localhost:8080/api/athlete/coach/full-infor?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    console.log(result);
    document.getElementById("avataruser").src = result.athlete.user.avatar
    document.getElementById("hotenuser").innerHTML = result.athlete.user.fullName
    document.getElementById("sodienthoaiuser").innerHTML = result.athlete.user.phone
    document.getElementById("mailuser").innerHTML = result.athlete.user.email
    document.getElementById("btnsendmail").href = 'mailto:'+ result.athlete.user.email
    var list = result.athleteHistories;
    var main = '';
    for(i=0; i<list.length; i++){
        main += `<tr>
        <td>${list[i].createdDate}</td>
        <td>${list[i].height} cm<br>${list[i].weight} kg<br>BMI:${calBmi(list[i].weight, list[i].height)}</td>
        <td>${list[i].bloodPressure}</td>
        <td>${list[i].heartbeat}</td>
        <td>${list[i].stress}</td>
        <td>${list[i].glycemicIndex}</td>
        <td>${list[i].physical}<br>${list[i].physicalClassification}</td>
    </tr>`
    }
    document.getElementById("listhosoupdate").innerHTML = main

    var list = result.injuries;
    var main = '';
    for(i=0; i<list.length; i++){
        main += `<tr>
        <td>${list[i].injuriesDate}</td>
        <td>${list[i].location}</td>
        <td>${list[i].severity}</td>
        <td>${list[i].status}</td>
    </tr>`
    }
    document.getElementById("listTranthuong").innerHTML = main

    var list = result.tournamentAthletes;
    var main = '';
    for(i=0; i<list.length; i++){
        main += `<tr>
        <td>${list[i].tournament.name}</td>
        <td>${list[i].createdDate}</td>
        <td>${list[i].tournament.competitionDay}</td>
        <td>${list[i].tournament.description}</td>
        <td>${list[i].tournament.specialize.name}</td>
        <td>${list[i].result}</td>
    </tr>`
    }
    document.getElementById("listgiaidau").innerHTML = main

    var list = result.schedules;
    var main = '';
    var datap = 0;
    var dimuon = 0;
    var nghi = 0;
    for(i=0; i<list.length; i++){
        var kh = '';
        for(j=0; j< list[i].exerciseSchedules.length; j++){
            kh += list[i].exerciseSchedules[j].exercise.name+": "+list[i].exerciseSchedules[j].quantity+" lần<br>"
        }
        main += `<tr class="trlichtap">
        <td class="tdtrang">
            ${list[i].workoutDate}<br>
        </td>
        <td class="tdsecond">
            ${list[i].startTime} - ${list[i].endTime}<br>
            ${list[i].address == null?'':list[i].address}<br>
            ${kh}
        </td>
        <td>${list[i].feedBack == null?'Chưa có phản hồi':list[i].feedBack}</td>
        <td>
            <select class="form-control selecttrangthai" onchange="updateTrangThai(${list[i].id}, this)">
                <option value="" selected>Chưa tập</option>
                <option ${list[i].status == 'DA_TAP'?'selected':''} value="DA_TAP">Đã tập</option>
                <option ${list[i].status == 'DI_MUON'?'selected':''} value="DI_MUON">Đi muộn</option>
                <option ${list[i].status == 'XIN_NGHI'?'selected':''} value="XIN_NGHI">Nghỉ tập</option>
            </select>
        </td>
    </tr>`
        if(list[i].status == "DI_MUON"){
            dimuon += Number(1);
        }
        if(list[i].status == "XIN_NGHI"){
            nghi += Number(1);
        }
        if(list[i].status == "DA_TAP"){
            datap += Number(1);
        }
    }

    document.getElementById("listlichtap").innerHTML = main
    document.getElementById("tongbuoitap").innerHTML = " "+list.length
    document.getElementById("datap").innerHTML = " "+datap
    document.getElementById("dimuon").innerHTML = " "+dimuon
    document.getElementById("nghi").innerHTML = " "+nghi
}



async function updateTrangThai(id, e) {
    var trangthai = e.value
    var url = 'http://localhost:8080/api/schedule/coach/update-status?id='+id+'&status='+trangthai;
    if(trangthai == ""){
        url = 'http://localhost:8080/api/schedule/coach/update-status?id='+id;
    }
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
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


async function loadLichByNgay() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var start = document.getElementById("start").value
    var end = document.getElementById("end").value
    if (start == "" || end == "") {
        alert("Hãy chọn ngày");
        return;
    }
    var url = 'http://localhost:8080/api/schedule/coach/find-by-ath-and-date?athId='+id+'&from='+start+'&to='+end;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    var datap = 0;
    var dimuon = 0;
    var nghi = 0;
    for(i=0; i<list.length; i++){
        var kh = '';
        for(j=0; j< list[i].exerciseSchedules.length; j++){
            kh += list[i].exerciseSchedules[j].exercise.name+": "+list[i].exerciseSchedules[j].quantity+" lần<br>"
        }
        main += `<tr class="trlichtap">
        <td class="tdtrang">
            ${list[i].workoutDate}<br>
        </td>
        <td class="tdsecond">
            ${list[i].startTime} - ${list[i].endTime}<br>
            ${list[i].address == null?'':list[i].address}<br>
            ${kh}
        </td>
        <td>${list[i].feedBack == null?'Chưa có phản hồi':list[i].feedBack}</td>
        <td>
            <select class="form-control selecttrangthai" onchange="updateTrangThai(${list[i].id}, this)">
                <option value="" selected>Chưa tập</option>
                <option ${list[i].status == 'DA_TAP'?'selected':''} value="DA_TAP">Đã tập</option>
                <option ${list[i].status == 'DI_MUON'?'selected':''} value="DI_MUON">Đi muộn</option>
                <option ${list[i].status == 'XIN_NGHI'?'selected':''} value="XIN_NGHI">Nghỉ tập</option>
            </select>
        </td>
    </tr>`
        if(list[i].status == "DI_MUON"){
            dimuon += Number(1);
        }
        if(list[i].status == "XIN_NGHI"){
            nghi += Number(1);
        }
        if(list[i].status == "DA_TAP"){
            datap += Number(1);
        }
    }
    document.getElementById("listlichtap").innerHTML = main
    document.getElementById("tongbuoitap").innerHTML = " "+list.length
    document.getElementById("datap").innerHTML = " "+datap
    document.getElementById("dimuon").innerHTML = " "+dimuon
    document.getElementById("nghi").innerHTML = " "+nghi
}




function calBmi(cannang, chieucao){
    if(chieucao > 10){
        chieucao = chieucao / 100;
    }
    var bmi = cannang / (chieucao * chieucao)
    bmi = bmi.toFixed(2)
    return bmi
}

