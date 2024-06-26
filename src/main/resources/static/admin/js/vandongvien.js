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
                        <a target="_blank" href="hoso?id=${list[i].id}">Xem</a>
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
function calBmi(cannang, chieucao){
    if(chieucao > 10){
        chieucao = chieucao / 100;
    }
    var bmi = cannang / (chieucao * chieucao)
    bmi = bmi.toFixed(2)
    return bmi
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

