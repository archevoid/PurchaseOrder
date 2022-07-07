function changeActionAndSubmit(formElem, strUrl) {
	formElem.action = strUrl;
	
	formElem.submit();
}

$(function() {
    $("div.panel").draggable();
});

function drawCalendarSpace() {
    for(var n = 0; n < 6; n++) {
        $("#calendar").append("<tr class='date'></tr>");
    }
    
    $("#calendar tbody tr").each(function() {
    	for(var w = 0; w < 7; w++) {
    	
    		var tag;
    		
		    if(w == 0) {
		        tag = "<td class='clickable sun'></td>"
		    } else if(w == 6) {
		        tag = "<td class='clickable sat'></td>"
		    } else {
		        tag = "<td class='clickable'></td>"
		    }
		    
		    $(this).append(tag);
		}
    });
	
}

function drawCalendar(year, month) {
    var theDay = new Date(year, month - 1);

    var firstDay = new Date(theDay.getFullYear(), theDay.getMonth(), 1);
    var lastDay = new Date(theDay.getFullYear(), theDay.getMonth() + 1, 0);

    var day = 1;

    $("tr.date").each(function(idx) {
        var w = 0;

        if(idx == 0) {
            w = firstDay.getDay();
        }

        for(; w < 7; w++) {
            if(day > lastDay.getDate())  {
                break;
            } else {
                $(this).find("td:eq(" + w + ")").html("<div class='date'>" + day + "</div>");

                day++;
            }
        }
    });
}

function clearCalendar() {
    $("div.date").text("");
}

function inputDay(fullDay) {
    $("input[name=orderDate]").val(fullDay);
}

function makeCompanyPanel(contractNum, data) {

	var upper =
		`<form action="inputOrder" method="post" id="orderInputForm">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="setPanelHeader">
						<b><span id='contractNum'>` + contractNum + `</span>번 계약</b>` + 
					`</span>
					<div class="pull-right">
						<div class="btn-group in-panel-heading">
							<button type="button" class="btn btn-outline btn-primary" id="inputOrder">입력</button>
							<button type="reset" class="btn btn-outline btn-danger">초기화</button>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<table class="table table-hover centerAll" id="companyInfo">
						<thead>
							<tr>
								<th>협력회사</th>
								<th>발주일자</th>
								<th>담당자 이름</th>
								<th>이메일</th>
								<th>공급가격</th>
								<th>수량</th>
								<th>소계</th>
							</tr>
						</thead>
						<tbody>`;
										
	var lower = 
`						</tbody>
					</table>
				</div>
			</div>
		</form>`;
				
	var companyName = "<td id='companyName'>" + data.companyName + "</td><input type='hidden' name='companyCode' value='" + data.companyCode + "'>";
	var dateInput = "<td><input type='date' name='orderDate' class='form-control'></td>";
	var unitPrice = "<td id='unitPrice'>" + data.unitPrice + "</td>";
	var emplNum = "<td><select name='emplNum' class='form-control'><option value='0'>담당자 선택</option></select></td>";
	var email = "<td id='email'></td>";
	var quantityInput = "<td><input type='number' name='orderQuantity' class='form-control'></td>";
	var sum = "<td id='sum'></td>";
	
	var middle = companyName + "\n"
				 + dateInput + "\n" 
				 + emplNum + "\n"
				 + email + "\n" 
				 + unitPrice + "\n"
				 + quantityInput + "\n"
				 + sum + "\n";
	
	return upper + middle + lower;
}


function refreshTotalPrice() {
	$.ajax({
		url: "/api/totalPrice",
		type: "POST",
		data: { "planNum" : $("select[name=planNum]").val() },
		success: function(data) {
			$("td#total_price").text(data);
		}
	});
}

function remainQuantity() {
	$.ajax({
		url: "/api/remainQuantity",
		type: "POST",
		data: { "planNum" : $("select[name=planNum]").val() },
		success: function(data) {
			$("td#remainQuantity").text(data);
		}
	});
}

function orderList() {
	$.ajax({
		url: "/api/orderList",
		type: "POST",
		data: { "date" : $("span#year").text() + "-" + $("span#month").text() + "-01" },
		success: function(data) {
			var elem = $("td div.date");
			
			var colors = ["blueviolet", "cadetblue", "coral", "cornflowerblue", "darkcyan", "darkseagreen", "lightblue", "yellowgreen", "thistle", "orchid"];
			for(var i = 0; i < Object.keys(data).length; i++) {
				$("td div.date").each(function(index, value) {
					if(parseInt(data[i].orderDate.split('-')[2]) == $(value).text()) {
					
						var $parent = $(value).closest('td');
						
						var backColor = colors[i % colors.length];
						
						var tag = "<div id='orderInfo' style='background-color: " + backColor + ";'>";
						tag += "<span id='companyName'>" + data[i].companyName + "</span>";
						tag += " (";
						tag += "<span id='companyCode'>" + data[i].companyCode + "</span>";
						tag += "): ";
						tag += "<span id='partName'>" + data[i].partName + "</span>";
						tag += "</div>";
						
						$parent.append(tag);
						
						$parent.removeClass("clickable");
					}
				});
			}
			
			$("div#orderInfo").on("click", function() {
				$("select[name=companyCode]").val($(this).children("span#companyCode").text());
				
				inputDay(curYear + "-" + curMonth.toString().padStart(2, "0") + "-" + $(this).closest("td").children("div.date").text().padStart(2, "0"));
			});
		}
	})
}
