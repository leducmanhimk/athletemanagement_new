async function loadHoSoVdv() {
    var url = 'http://localhost:8080/api/athlete/athlete/my-full-infor';
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

    document.getElementById("avataruserhlv").src = result.athlete.coach.avatar
    document.getElementById("hotenuserhlv").innerHTML = "HLV: "+result.athlete.coach.fullName
    document.getElementById("sodienthoaiuserhlv").innerHTML = result.athlete.coach.phone
    document.getElementById("mailuserhlv").innerHTML = result.athlete.coach.email
    document.getElementById("btnsendmail").href = "mailto:"+result.athlete.coach.email


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
        <td>
            <div id="phanhoidiv${list[i].id}">${list[i].feedBack == null?'Chưa có phản hồi':list[i].feedBack}</div>
            <br><br>
            <i onclick="setIdPhanHoi(${list[i].id})" class="fa fa-edit pointer icontable" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
        </td>
        <td>${loadTrangThai(list[i].status)}</td>
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
    var start = document.getElementById("start").value
    var end = document.getElementById("end").value
    if (start == "" || end == "") {
        alert("Hãy chọn ngày");
        return;
    }
    var url = 'http://localhost:8080/api/schedule/athlete/find-by-date?from='+start+'&to='+end;
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
        <td>
            <div id="phanhoidiv${list[i].id}">${list[i].feedBack == null?'Chưa có phản hồi':list[i].feedBack}</div>
            <br><br>
            <i onclick="setIdPhanHoi(${list[i].id})" class="fa fa-edit pointer icontable" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
        </td>
        <td>${loadTrangThai(list[i].status)}</td>
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


function loadTrangThai(trangthai){
    if(trangthai == null){
        return "Chưa tập"
    }
    if(trangthai == "DA_TAP"){
        return "Đã tập"
    }
    if(trangthai == "DI_MUON"){
        return "Đi muộn"
    }
    if(trangthai == "XIN_NGHI"){
        return "Nghỉ"
    }
    return "Chưa tập"
}


function calBmi(cannang, chieucao){
    if(chieucao > 10){
        chieucao = chieucao / 100;
    }
    var bmi = cannang / (chieucao * chieucao)
    bmi = bmi.toFixed(2)
    return bmi
}

async function setIdPhanHoi(id){
    var url = 'http://localhost:8080/api/schedule/all/findById?id='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("lbphanhoi").innerHTML = result.workoutDate
    document.getElementById("idlichtap").value = id
    document.getElementById("phanhoind").value = result.feedBack
}

async function capNhatPhanHoi() {
    var id = document.getElementById("idlichtap").value;
    var noidung = document.getElementById("phanhoind").value;

    var url = 'http://localhost:8080/api/schedule/athlete/update-feedback?id='+id;
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'text/plain'
        }),
        body: noidung
    });
    var result = await res.json();
    if (res.status < 300) {
        toastr.success("Cập nhật thành công");
        document.getElementById("phanhoidiv"+id).innerHTML = result.feedBack
        $("#exampleModal").modal('hide')
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
    }
}