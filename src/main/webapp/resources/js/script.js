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

function inputDay(fullDay, cssSelector) {
    $(cssSelector).val(fullDay);
}

function makePanelHeading() {
	
}

function makeCompanyCard(data) {

	var frontUpper = 
		`<div class="col-md-6 col-lg-4 col-company-card" id="` + data.companyName + `">
							<div class="container-turn-over container-plan p-rel">
								<div class="card card-plan">
									<div class="front">
										<div class="card-header">
											<h3 class="card-title">` + data.companyName + `</h3>
											<input type='hidden' name='code'
												value='" + data.companyCode + "'>
												<input type="hidden" name="contractNum" value="` + data.contractNum + `"> 
										 </div>
										<div class="card-body">
		`;
	
	var frontLower = 
		`</div>
			<!-- Card footer -->
			<div class="card-footer">
				<div class="d-flex">
					<button type="button" class="btn btn-link">초기화</button>
					<button type="button" class="btn btn-primary ms-auto"
						id="inputOrder">입력</button>
				</div>
			</div>
		</div>
		`;
		
		
	var frontContent = [];
	
	// 단가
	frontContent[0] = 
		`<div class="mb-3">
			<div class="form-label">단가</div>
			<div class='ht-inp'>` + data.unitPrice + `</div>
		</div>
		`;
		
	// 발주일자
	frontContent[1] = 
		`<div class="row">
			<div class="col-lg-6">
				<div class="mb-3">
					<div class="form-label">발주 일자</div>
					<input type='date' name='orderDate' class='form-control'>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="mb-3">
					<div class="form-label">납기 일자</div>
					<input type='date' name='dueDate' class='form-control'>
				</div>
			</div>
		</div>
		`;
		
	// 담당자
	frontContent[2] = 
		`<div class="row">
			<div class="col-lg-4">
				<div class="mb-3">
					<label class="form-label">담당자</label> 
					<select name='emplNum' class='form-select'>
						<option value='0'>선택</option>
					</select>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="ht-lab"></div>
				<div id="email" class='ht-inp'></div>
			</div>
		</div>
		`;
		
	// 발주수량
	frontContent[3] = 
		`<div class="row">
			<div class="col-lg-4">
				<div class="mb-3">
					<label class="form-label">발주 수량</label> <input
						type='number' name='orderQuantity' class='form-control'>
				</div>
			</div>
			<div class="col-lg-8">
				<label class="form-label">총 가격</label>
				<div id="sum" class='ht-inp'></div>
			</div>
		</div>
		`;

	
	var frontMiddle = "";
	
	for(var i = 0; i < frontContent.length; i++) {
		frontMiddle += frontContent[i];
	}
	
	
	var backUpper = `
		
		`;
	var backLower = 
		`
		
		`;
	
	var backContent = [];
	
		
	var backMiddle = "";
	
	for(var i = 0; i < backContent.length; i++) {
		backMiddle += backContent[i];
	}
	
	
	return frontUpper + frontMiddle + frontLower + backUpper + backMiddle + backLower;
}


function refreshTotalPrice() {
	$.ajax({
		url: "/api/totalPrice",
		type: "POST",
		data: { "planNum" : $("select[name=planNum]").val() },
		success: function(data) {
			$("td#inputPrice").text(data);
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
