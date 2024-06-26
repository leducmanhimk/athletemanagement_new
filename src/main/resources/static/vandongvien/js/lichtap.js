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

async function loadAllKeHoachSelect() {
    var url = 'http://localhost:8080/api/plan/athlete/my-plan';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '<option value="">Tất cả kế hoạch</option>';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].name}</option>`
    }
    document.getElementById("kehoachselect").innerHTML = main
}

function locBangVdv(){
    var month = document.getElementById("month").value
    var year = document.getElementById("year").value
    loadBangByKeHoach(month,year)
}

async function loadBangByKeHoach(month, year){
    var numday = daysInMonth(month, year);
    var arr = [];
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
    var kehoach = document.getElementById("kehoachselect").value;
    var url = 'http://localhost:8080/api/schedule/athlete/my-schedule?month='+month+'&year='+year;
    if(kehoach != ""){
        url += '&kehoach='+kehoach;
    }
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

async function lichTapTheoNgay(date) {
    dateup = date
    document.getElementById("ngaytappp").innerHTML = "Danh sách vđv có lịch tập ngày: "+date
    var url = 'http://localhost:8080/api/schedule/athlete/find-single-by-date?date='+date;
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
        
            <a onclick="loadNoiDung(${list[i].id},'${list[i].feedBack}',${list[i].mark})" data-bs-toggle="modal" data-bs-target="#exampleModal" href="#"><i class="fa fa-comment icontable"></i>
            </a>
        </td>
        
    </tr>`
    }
    document.getElementById("listvdvlichtap").innerHTML = main
}

function loadNoiDung(idlichtap, noidung, thangdiem){
    document.getElementById("idlictap").value = idlichtap
    document.getElementById("noidungphanhoi").value = noidung
    document.getElementById("thangdiem").value = thangdiem
}

var dateup = '';
async function capNhatFeedBack() {
    try {
        // Get input values
        const id = document.getElementById("idlichtap").value;
        const noidung = document.getElementById("phanhoind").value;
        const thangdiem = document.getElementById("thangdiem").value;

        // Construct the URL
        const url = `http://localhost:8080/api/schedule/athlete/update-feedback?id=${id}`;

        // Fetch data with POST request
        const res = await fetch(url, {
            method: 'POST',
            headers: new Headers({
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'text/plain'
            }),
            body: noidung
        });

        // Check response status
        if (res.ok) {
            const result = await res.json();
            toastr.success("Cập nhật thành công");
            // Update DOM element only if feedback is present in the response
            if (result.feedBack) {
                document.getElementById("phanhoidiv" + id).innerHTML = result.feedBack;
            }
            $("#exampleModal").modal('hide');
        } else {
            // Handle non-2xx status codes
            const errorData = await res.json();
            const errorMessage = errorData.defaultMessage || 'Lỗi cập nhật phản hồi.';
            toastr.error(errorMessage);
        }
    } catch (error) {
        console.error('Error updating feedback:', error);
        toastr.error('Không thể cập nhật phản hồi. vì buổi tập nghỉ hoặc quá hạn');
    }
}


function daysInMonth (month, year) {
    return new Date(year, month, 0).getDate();
}

function getDayOfWeek(date) {
    const dayOfWeek = new Date(date).getDay();    
    return isNaN(dayOfWeek) ? null : 
      [8, 2, 3, 4, 5, 6, 7][dayOfWeek];
}