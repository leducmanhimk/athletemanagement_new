async function loadAllBaiTap() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/exercise/all/find-by-coach';
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
                    <td>${list[i].name}</td>
                    <td>${list[i].unitMeasure}</td>
                    <td>${list[i].description}</td>
                    <td>
                        <i onclick="deleteBaiTap(${list[i].id})" class="fa fa-trash icontable"></i>
                        <a href="addbaitap?id=${list[i].id}"><i class="fa fa-edit icontable"></i></a>
                    </td>
                </tr>`
    }
    document.getElementById("listbaitap").innerHTML = main
    $('#example').DataTable();
}



async function themBaiTap() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    var baitap = {
        "id": id,
        "name": document.getElementById("tenbt").value,
        "unitMeasure": document.getElementById("donvido").value,
        "description": tinyMCE.get('editor').getContent(),
    }
    var url = 'http://localhost:8080/api/exercise/coach/create-update';
    const res = await fetch(url, {
        method: 'POST',
        headers: new Headers({
            'Authorization': 'Bearer ' + token,
            'Content-Type': 'application/json'
        }),
        body: JSON.stringify(baitap)
    });
    var result = await res.json();
    if (res.status < 300) {
        swal({
                title: "Thông báo",
                text: "Thành công!",
                type: "success"
            },
            function() {
                window.location.href = 'baitap'
            });
    }
    else{
        if (res.status == exceptionCode) {
            var result = await res.json()
            toastr.warning(result.defaultMessage);
        }
        else{
            toastr.success("Xóa thất bại");
        }
    }
}

async function loadABaiTap() {
    var uls = new URL(document.URL)
    var id = uls.searchParams.get("id");
    if (id != null) {
        var url = 'http://localhost:8080/api/exercise/all/findById?id=' + id;
        const response = await fetch(url, {
            method: 'GET',
            headers: new Headers({
                'Authorization': 'Bearer ' + token
            })
        });
        var result = await response.json();
        document.getElementById("tenbt").value = result.name
        document.getElementById("donvido").value = result.unitMeasure
        tinyMCE.get('editor').setContent(result.description)
    }
}

async function deleteBaiTap(id) {
    var con = confirm("Bạn chắc chắn muốn xóa bài tập này?");
    if (con == false) {
        return;
    }
    var url = 'http://localhost:8080/api/exercise/coach/delete?id=' + id;
    const response = await fetch(url, {
        method: 'DELETE',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    if (response.status < 300) {
        toastr.success("xóa thành công!");
        loadAllBaiTap();
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



async function loadAllBaiTapSelect() {
    var url = 'http://localhost:8080/api/exercise/all/find-by-coach';
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();
    listbaitap = list;
    var main = '';
    for (i = 0; i < list.length; i++) {
        main += `<option value="${list[i].id}">${list[i].name}</option>`
    }
    document.getElementById("baitap").innerHTML = main
    const ser = $("#baitap");
    ser.select2({
        placeholder: "Chọn các bài tập",
    });
}

