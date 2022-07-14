const currency = {
    "KRW" : '\u20A9', 
    "USD" : '\u0024', 
    "EUR" : '\u20AC', 
    "JPN" : '\u00A5', 
    "CNY" : '\u00A5', 
    "other" : '\u00A4'
};


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

function makeCompanyCard(data) {

	let currencyCode;

	if(currency.hasOwnProperty(data.contractCurrency.toUpperCase())) {
		currencyCode = currency[data.contractCurrency.toUpperCase()];
	} else {
		currencyCode = currency["other"];
	}

	var frontUpper = 
		`<div class="col-md-6 col-lg-4 col-company-card" id="` + data.companyName + `">
							<div class="container-turn-over container-plan p-rel">
								<div class="card card-plan">
									<div class="front">
										<div class="card-header">
											<h3 class="card-title">` + data.companyName + `</h3>
											<div class="ms-auto d-print-none">
												<button type="button" class="btn btn-primary ms-auto"
													id="inputOrder">선택</button>
											</div>
											<input type='hidden' name='code'
												value="` + data.companyCode + `">
												<input type="hidden" name="contractNum" value="` + data.contractNum + `"> 
										 </div>
										<div class="card-body">
		`;
	
	var frontLower = 
				`</div>
				</div>
			</div>
		</div>
		`;
		
		
	var frontContent = [];
	
	// 단가
	frontContent[0] = 
		`<div class="mb-3">
			<div class="form-label">단가</div>
			<div id="priceContainer" class="ht-inp">
				<span id="currency">` + currencyCode + `</span>
				<span id="unitPrice">` + data.unitPrice + `</span>
			</div>
		</div>
		`;
		
	// 담당자 이름
	frontContent[1] = 
		`<div class="mb-3">
			<div class="form-label">헙력회사 담당자</div>
			<div id="priceContainer" class="ht-inp">
				<input type="text" value="` + data.comEmployee + `" class="form-control" readonly>
			</div>
		</div>
		`;
		
	// 담당자 이메일
	frontContent[2] = 
		`<div class="mb-3">
			<div class="form-label">이메일</div>
			<div id="priceContainer" class="ht-inp">
				<input type="text" value="` + data.comEmail + `" class="form-control" readonly>
			</div>
		</div>
		`;
	// 양도 양수 조건
	frontContent[3] = 
		`<div class="mb-3">
			<div class="form-label">양도 양수 조건</div>
			<div id="priceContainer" class="ht-inp">
				<input type="text" value="` + data.transferCondition + `" class="form-control" readonly>
			</div>
		</div>
		`;
	// Lead Time
	frontContent[4] = 
		`<div class="mb-3">
			<div class="form-label">L/T</div>
			<div id="priceContainer" class="ht-inp">
				<input type="text" value="` + data.leadTime + `" class="form-control" readonly>
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
			$.each(data, function(idx) {
				for (var i = 0; i < currency.length; i++) {
					if ($("span.currency-code").text() == data.contractCurrency) {
						
						var curPrice = $("span.currency-code").closest("div").find("span.price").text();
						
						$("span.currency-code").closest("div").find("span.price").text(parseInt(curPrice) + parseInt(data.totalPrice))
					}
				}
			});
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

function getComplexPrice(currencyList, priceList) {
	var result = "";
	
	
	const cLength = currencyList.length;
	const pLength = priceList.length;
	
	if(cLength != pLength) {
		return "";
	}
	
	var keys = Object.keys(currency);
	
	var sums = [];
	
	for(var i = 0; i < keys - 1; i++) {
		result += "<div id='" + keys[i] + "'>" + currency[keys[i]] + "</div>";
		result += "<span id='" + keys[i] + "SubCurrency" + "'>" + currency[keys[i]] + "</span>";
		
		sums[i] = 0;
		
		var equalPosition = -1;
		for(var j = 0; j < cLength; j++) {
			if (keys[i] == currencyList[j].toUpperCase()) {
				sums[i] += parseInt(priceList[j]);
				equalPosition = j;
			} else if (!currency.includes(currencyList[j].toUpperCase())) {
				sums[sums.length - 1] += parseInt(priceList[j]);
				equalPosition = j;
			}
		}
		
		if (equalPosition != -1) {
			result += "<span id='" + keys[i] + "SubPrice'" + ">" + sums[equalPosition] + "</span>";
		}
	}
	
	return result;
}
