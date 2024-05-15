var token = localStorage.getItem("token");
async function revenueYear(nam) {
    if (nam < 2000) {
        nam = new Date().getFullYear()
    }
    var url = 'http://localhost:8080/api/statistic/admin/revenue-year?year=' + nam+'&revenueType=THU';
    var response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var list = await response.json();

    var url = 'http://localhost:8080/api/statistic/admin/revenue-year?year=' + nam+'&revenueType=CHI';
    var res = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var listchi = await res.json();

    for (i = 0; i < list.length; i++) {
        if (list[i] == null) {
            list[i] = 0
        }
    }
    var lb = 'Khoản thu năm ' + nam;
    var lbchi = 'Khoản chi năm ' + nam;
    const ctx = document.getElementById("chart").getContext('2d');

    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["tháng 1", "tháng 2", "tháng 3", "tháng 4",
                "tháng 5", "tháng 6", "tháng 7", "tháng 8", "tháng 9", "tháng 10", "tháng 11", "tháng 12"
            ],
            datasets: [
                {
                    label: lb,
                    backgroundColor: 'rgba(161, 198, 247, 1)',
                    borderColor: 'rgb(47, 128, 237)',
                    data: list,
                },
                {
                    label: lbchi,
                    backgroundColor: 'rgba(209, 87, 56)',
                    borderColor: 'rgb(209, 87, 56)',
                    data: listchi,
                },
            ]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        callback: function(value) {
                            return formatmoney(value);
                        }
                    }
                }]
            }
        },
    });
}

function loadByNam() {
    var nam = document.getElementById("nams").value;
    revenueYear(nam);
}

const VND = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
});

function formatmoney(money) {
    return VND.format(money);
}


async function tongTk() {
    var url = 'http://localhost:8080/api/statistic/admin/tongTk';
    var response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var tongTk = await response.text();
    document.getElementById("tongtk").innerHTML = tongTk;

    var url = 'http://localhost:8080/api/statistic/admin/tongTk?role=ROLE_ATHLETE';
    var response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var tongTk = await response.text();
    document.getElementById("tongvdv").innerHTML = tongTk;

    var url = 'http://localhost:8080/api/statistic/admin/tongTk?role=ROLE_COACH';
    var response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var tongTk = await response.text();
    document.getElementById("tonghlv").innerHTML = tongTk;

    var url = 'http://localhost:8080/api/statistic/admin/tongTk?role=ROLE_EXPERT';
    var response = await fetch(url, {
        method: 'GET',
        headers: new Headers({
            'Authorization': 'Bearer ' + token
        })
    });
    var tongTk = await response.text();
    document.getElementById("tongcg").innerHTML = tongTk;

    setMau();
}