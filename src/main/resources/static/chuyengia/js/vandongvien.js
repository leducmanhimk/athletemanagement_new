async function loadAllVdv() {
    $('#TableAtheles').DataTable().destroy();
    var url = 'http://localhost:8080/api/athlete/expert/get-all';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<tr>
                    <td><img src="${list[i].user.avatar}" class="imgtable"></td>
                    <td>${list[i].user.fullName}<br>${list[i].user.email}<br>${list[i].user.phone}</td>
                    <td>${list[i].height} cm<br>${list[i].weight} kg<br>BMI:${calBmi(list[i].weight, list[i].height)}</td>
                    <td>${list[i].bloodPressure}</td>
                    <td>${list[i].heartbeat}</td>
                    <td>${list[i].stress}</td>
                    <td>${list[i].glycemicIndex}</td>
                    <td>${list[i].physical}<br>${list[i].physicalClassification}</td>
                    <td>${list[i].pathological}</td>
                    <td>
                        <a href="updatevdv?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                        <a onclick="loadHoSoUpdate(${list[i].id})" data-bs-toggle="modal" data-bs-target="#addtk" href="#"><i class="fa fa-eye icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listvdv").innerHTML = main
    $('#TableAtheles').DataTable({
        layout: {
            topStart: {
                buttons: ['copy', 'csv', 'excel', 'pdf', 'print']

            }
        },
        language: {
            // Customize language strings (optional)
            searchPlaceholder: "Tìm kiếm...", // Example: Change search placeholder text
            paginate: {
                previous: "Trước",
                next: "Sau"
            }
        }

    });
}

async function loadHoSoUpdate(id) {
    var url = 'http://localhost:8080/api/athlete-history/expert/get-by-athlete?idvdv='+id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    console.log(list);
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<tr>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].height} cm<br>${list[i].weight} kg<br>BMI:${calBmi(list[i].weight, list[i].height)}</td>
                    <td>${list[i].bloodPressure}</td>
                    <td>${list[i].heartbeat}</td>
                    <td>${list[i].stress}</td>
                    <td>${list[i].glycemicIndex}</td>
                    <td>${list[i].physical}<br>${list[i].physicalClassification}</td>
                    <td>${list[i].pathological}</td>
                </tr>`
    }
    document.getElementById("listhosoupdate").innerHTML = main
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
        document.getElementById("cannang").value = result.weight
        document.getElementById("chieucao").value = result.height
        document.getElementById("huyetap").value = result.bloodPressure
        document.getElementById("nhiptim").value = result.heartbeat
        document.getElementById("stress").value = result.stress
        document.getElementById("nhommau").value = result.bloodGroup
        document.getElementById("duonghuyet").value = result.glycemicIndex
        document.getElementById("theluc").value = result.physical
        document.getElementById("phanloaitheluc").value = result.physicalClassification
        tinyMCE.get('editor').setContent(result.pathological)
    }
}


var linkavatar = '';
var linkhopdong = '';

async function capNhatVanDongVien() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var vdv = {
        "id":id,
        "height":document.getElementById("chieucao").value,
        "weight":document.getElementById("cannang").value,
        "bmi":calBmi(document.getElementById("cannang").value, document.getElementById("chieucao").value),
        "bloodPressure":document.getElementById("huyetap").value,
        "heartbeat":document.getElementById("nhiptim").value,
        "stress":document.getElementById("stress").value,
        "bloodGroup":document.getElementById("nhommau").value,
        "glycemicIndex":document.getElementById("duonghuyet").value,
        "physicalClassification":document.getElementById("phanloaitheluc").value,
        "physical":document.getElementById("theluc").value,
        "pathological":tinyMCE.get('editor').getContent(),
    }
    console.log(vdv);
    var url = 'http://localhost:8080/api/athlete/expert/update-infor';
    var res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(vdv)
    });
    var result = await res.json();
    if (res.status < 300) {
        vdv.id = null;
        var response = await fetch('http://localhost:8080/api/athlete-history/expert/create?idvdv='+id, {
            method: 'POST',
            headers: new Headers({
                'Authorization': 'Bearer ' + token,
                'Content-Type': 'application/json'
            }),
            body: JSON.stringify(vdv)
        });
        if(response.status < 300){
            swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'vandongvien'
            });
        }
    }
    if (res.status == exceptionCode) {
        toastr.error(result.defaultMessage);
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

