function changeActionAndSubmit(formElem, strUrl) {
	formElem.action = strUrl;
	
	formElem.submit();
}


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