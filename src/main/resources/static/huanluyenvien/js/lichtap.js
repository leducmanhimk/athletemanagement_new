$(document).ready(function() {
    var main = '';
    for(i=1; i<=12; i++){
        main += `<option value="${i}">Tháng ${i}</option>`
    }
    document.getElementById("month").innerHTML = main;

    var mainyear = '';
    for(i=2023; i<=2030; i++){
        mainyear += `<option value="${i}">năm ${i}</option>`
    }
    document.getElementById("year").innerHTML = mainyear;

    var TodayDate = new Date();
    var m = TodayDate.getMonth() + 1;
    if(TodayDate.getMonth() == 12){
        m = 1;
    }
    var y = TodayDate.getFullYear();
    document.getElementById("month").value = m;
    document.getElementById("year").value = y;

    // loadBang(m,y);
});


function daysInMonth (month, year) {
    return new Date(year, month, 0).getDate();
}

function getDayOfWeek(date) {
    const dayOfWeek = new Date(date).getDay();    
    return isNaN(dayOfWeek) ? null : 
      [8, 2, 3, 4, 5, 6, 7][dayOfWeek];
}


function locBang(){
    var month = document.getElementById("month").value
    var year = document.getElementById("year").value
    loadBang(month,year)
}

function locBangVdv(){
    var month = document.getElementById("month").value
    var year = document.getElementById("year").value
    loadBangByKeHoach(month,year)
}


const statusColors = {
    "pending": "orange",
    "completed": "green",
    "cancelled": "red",
    // ... Thêm ánh xạ trạng thái-màu sắc
};
async function loadBang(month, year){
    const numday = daysInMonth(month, year);
    const arr = [];
    if(month < 10){
        month = '0'+month;
    }

    for(i=1; i<= numday ; i++){
        const thu = getDayOfWeek(year + "-" + month + "-" + i);
        let x = i;
        if(i<10){
            x = '0'+i;
        }
        const obj = {
            "thu": thu,
            "ngay": year + "-" + month + "-" + x,
            "ngaytuan": i,
            "colich": false
        };
        arr.push(obj)
    }

    var url = 'http://localhost:8080/api/schedule/coach/find-by-coach?month='+month+'&year='+year;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    console.log(list);

    for(i=0; i< arr.length; i++){
        for(j=0; j<list.length; j++){
            if(arr[i].ngay == list[j].workoutDate){
                arr[i].colich = true;
            }
        }
    }

    var main = '';
    for(i=0; i< arr.length ; i++){
        if(i==0 || arr[i].thu == 2){
            main += `<tr>`
        }
        if(i==0){
            var tdthem = '';
            for(k=0; k<(arr[i].thu-2); k++){
                tdthem += `<td></td>`;
            }
            main += `${tdthem}<td onclick="lichTapTheoNgay('${arr[i].ngay}')"><span class="lichsp ${arr[i].colich == true?'lichactive':''}">${arr[i].ngaytuan}</span></td>`
        }
        else{
            main += `<td onclick="lichTapTheoNgay('${arr[i].ngay}')"><span class="lichsp ${arr[i].colich == true?'lichactive':''}">${arr[i].ngaytuan}</span></td>`
        }
        if(arr[i].thu == 8){
            main += `</tr>`
        }
    }
    document.getElementById('listlichtap').innerHTML = main;
}


async function loadBangByKeHoach(month, year){
    const numday = daysInMonth(month, year);
    const arr = [];
    if(month < 10){
        month = '0'+month;
    }

    for(i=1; i<= numday ; i++){
        var thu = getDayOfWeek(year+"-"+month+"-"+i);
        var x = i;
        if(i<10){
            x = '0'+i;
        }
        var obj = {
            "thu":thu,
            "ngay":year+"-"+month+"-"+x,
            "ngaytuan":i,
            "colich":false
        }
        arr.push(obj)
    }
    var uls = new URL(document.URL)
    var kehoach = uls.searchParams.get("kehoach");
    var vdv = uls.searchParams.get("vdv");
    var url = 'http://localhost:8080/api/schedule/coach/find-by-vdv?month='+month+'&year='+year+'&id='+kehoach;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    console.log(list);

    for(i=0; i< arr.length; i++){
        for(j=0; j<list.length; j++){
            if(arr[i].ngay === list[j].workoutDate){
                arr[i].colich = true;
            }
        }
    }

    var main = '';
    for(i=0; i< arr.length ; i++){
        if(i==0 || arr[i].thu == 2){
            main += `<tr>`
        }
        if(i==0){
            var tdthem = '';
            for(k=0; k<(arr[i].thu-2); k++){
                tdthem += `<td></td>`;
            }
            main += `${tdthem}<td onclick="lichTapTheoNgay('${arr[i].ngay}')"><span class="lichsp ${arr[i].colich == true?'lichactive':''}">${arr[i].ngaytuan}</span></td>`
        }
        else{
            main += `<td onclick="lichTapTheoNgay('${arr[i].ngay}')"><span class="lichsp ${arr[i].colich == true?'lichactive':''}">${arr[i].ngaytuan}</span></td>`
        }
        if(arr[i].thu == 8){
            main += `</tr>`
        }
    }
    document.getElementById('listlichtap').innerHTML = main;
}

async function lichTapTheoNgay(date) {
    document.getElementById("ngaytappp").innerHTML = "Danh sách vđv có lịch tập ngày: "+date
    var url = 'http://localhost:8080/api/schedule/coach/find-by-date?date='+date;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        var noidung = '';
        for(j=0; j<list[i].exerciseSchedules.length; j++){
            noidung += list[i].exerciseSchedules[j].exercise.name+": "+list[i].exerciseSchedules[j].quantity + '<br>'
        }
        main += `<tr>
        <td>${list[i].plan.athlete.user.fullName}<br>${list[i].plan.athlete.user.phone}</td>
        <td>${list[i].startTime} - ${list[i].endTime}</td>
        <td>${noidung}</td>
        <td>
            <i onclick="deletelichtap(${list[i].id})" class="fa fa-trash icontable"></i>
            <a href="addlichtap?id=${list[i].id}&vdv=${list[i].plan.athlete.id}&kehoach=${list[i].plan.id}"><i class="fa fa-edit icontable"></i></a>
            <a onclick="loadNoiDung(${list[i].id},'${list[i].feedBack}',${list[i].mark})" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i class="fa fa-comment icontable"></i></a>
        </td>
    </tr>`
    }
    document.getElementById("listvdvlichtap").innerHTML = main
}


function loadNoiDung(idlichtap, noidung, thangdiem){
    document.getElementById("noidungphanhoi").innerHTML = noidung
    document.getElementById("thangdiem").innerHTML = thangdiem
}


async function themLichTap() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var kehoach = uls.searchParams.get("kehoach");
    var vdv = uls.searchParams.get("vdv");
    var listchon = $("#baitap").val();
    var exerciseSchedules = [];

    for(i=0; i< listchon.length; i++){
        var soluong = document.getElementById("soluongbt"+listchon[i]).value
        var ex = {
            "quantity":soluong,
            "exercise":{
                "id":listchon[i]
            },
        }
        exerciseSchedules.push(ex)
    }
    var lichtap = {
        "id": id,
        "workoutDate": document.getElementById("ngaytap").value,
        "startTime": document.getElementById("giobd").value,
        "endTime": document.getElementById("giokt").value,
        "address": document.getElementById("diadiem").value,
        "level": document.getElementById("mucdo").value,
        "mass": document.getElementById("khoiluongtap").value,
        "result": tinyMCE.get('editorkq').getContent(),
        "plan": {
            "id":kehoach
        },
        "exerciseSchedules":exerciseSchedules
    }
    console.log(lichtap);
    // return;
    var url = 'http://localhost:8080/api/schedule/coach/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(lichtap)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = `lichtapvdv?vdv=${vdv}&kehoach=${kehoach}`;
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

var listbaitap = [];
function changeGiaTri(){
    var listchon = $("#baitap").val();
    var main = '';
    var listobj = [];
    for(i=0; i<listchon.length; i++){
        let element = document.getElementById("trtable"+listchon[i]);
        if(element){
            var obj = {
                "idex":listchon[i],
                "quantity": document.getElementById("soluongbt"+listchon[i]).value
            }
            listobj.push(obj)
            main += element.outerHTML;
        }
        else{
            main += `<tr id="trtable${listchon[i]}">
            <td><label class="lb-form">${checkName(listchon[i])}</label></td>
            <td><input id="soluongbt${listchon[i]}" type="number" class="form-control" placeholder="số lượng lặp lại" value="1" min="1"></td>
            <td><i onclick="huyGiaTri(${i})" class="fa fa-remove pointer"></i></td>
        </tr>`
        }
    }
    document.getElementById("tablebaitap").innerHTML = main;
    for(i=0; i< listobj.length; i++){
        document.getElementById("soluongbt"+listobj[i].idex).value = listobj[i].quantity
    }
}

function checkName(id){
    for(j=0; j< listbaitap.length; j++){
        if(listbaitap[j].id == id){
            return listbaitap[j].name
        }
    }
    return "";
}

function huyGiaTri(index, listchon){
    var listchon = $("#baitap").val();
    listchon.splice(index, 1);
    $("#baitap").val(listchon).change();
}



async function loadALichTap() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/schedule/all/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("ngaytap").value = result.workoutDate
        document.getElementById("giobd").value = result.startTime
        document.getElementById("giokt").value = result.endTime
        document.getElementById("diadiem").value = result.address
        document.getElementById("khoiluongtap").value = result.mass
        document.getElementById("mucdo").value = result.level
        tinyMCE.get('editorkq').setContent(result.result)
        await loadAllBaiTapSelect();
        var listid = [];
        for(i=0; i< result.exerciseSchedules.length; i++){
            listid.push(result.exerciseSchedules[i].exercise.id);
        }
        $("#baitap").val(listid).change();

        for(i=0; i< result.exerciseSchedules.length; i++){
            document.getElementById("soluongbt"+result.exerciseSchedules[i].exercise.id).value = result.exerciseSchedules[i].quantity
        }
    }
}


async function loadPhanHoi() {
    $('#example').DataTable().destroy();
    let url = 'http://localhost:8080/api/schedule/coach/fin-feedback-by-date';
    const start = document.getElementById("start").value;
    const end = document.getElementById("end").value;
    if (start !== "" && end !== "") {
        url += '?from=' + start + '&to=' + end;
    }
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    const list = await response.json();
    console.log(list);
    let main = '';
    for (i = 0; i < list.length; i++) {
        let nd = '';
        for(j=0; j<list[i].exerciseSchedules.length; j++){
            nd += list[i].exerciseSchedules[j].exercise.name+`: `+ list[i].exerciseSchedules[j].quantity+"<br>"
        }
        main += `<tr>
                    
                    <td>${list[i].feedBackDate}</td>
                    <td>${list[i].workoutDate}</td>
                    <td>${nd}</td>
                    <td>${list[i].feedBack}</td>
                    <td>${list[i].mark}</td>
                    <td>${list[i].plan.athlete.user.fullName}<br>${list[i].plan.athlete.user.email}</td>
                </tr>`
    }
    document.getElementById("listphanhoi").innerHTML = main
    $('#example').DataTable();
}
