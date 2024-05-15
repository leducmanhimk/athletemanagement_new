async function loadAllGiaiDau() {
    $('#example').DataTable().destroy();
    var url = 'http://localhost:8080/api/tournament/all/findAll?oke=2';
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
        main += `<tr>
                    <td>${list[i].id}</td>
                    <td>${list[i].name}</td>
                    <td>${list[i].createdDate}</td>
                    <td>${list[i].competitionDay}</td>
                    <td>${list[i].description}</td>
                    <td>${list[i].specialize.name}</td>
                    <td>
                        <span data-bs-toggle="modal" data-bs-target="#modalnoidung" onclick="loadAGiaiDau(${list[i].id})" class="pointer">Nội dung</span>
                    </td>
                </tr>`
    }
    document.getElementById("listgiaidau").innerHTML = main
    $('#example').DataTable();
}

async function loadAGiaiDau(id) {
    var url = 'http://localhost:8080/api/tournament/all/findById?id=' + id;
    const response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var result = await response.json();
    document.getElementById("noidunggiaidau").innerHTML = result.content
}


