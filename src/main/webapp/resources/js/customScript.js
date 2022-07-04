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
		        tag = "<td class='sun'></td>"
		    } else if(w == 6) {
		        tag = "<td class='sat'></td>"
		    } else {
		        tag = "<td></td>"
		    }
		    
		    $(this).append(tag);
		    
		    console.log("1")
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
		`<form action="plan" method="post" id="orderInputForm">
					<div class="panel panel-default" id="inputForm">
						<div class="panel-heading">
							<span class="setPanelHeader">
								<b>` + contractNum + "번 계약" + `</b>
							</span>
							<div class="pull-right">
								<div class="btn-group in-panel-heading">
									<button type="button" class="btn btn-outline btn-primary" id="showInputForm">입력</button>
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
				
	var companyName = "<td>" + data.companyName + "</td>";
	var dateInput = "<td><input type='date' name='orderDate' class='form-control'></td>";
	var unitPrice = "<td>" + data.unitPrice + "</td>";
	var quantityInput = "<td><input type='number' name='orderQuantity' class='form-control'></td>";
	
	var middle = companyName + "\n" + dateInput + "\n" + unitPrice + "\n" + quantityInput + "\n";
	
	return upper + middle + lower;
}