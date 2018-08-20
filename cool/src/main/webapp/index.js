var ishow = false;
$(".emoji").click(function() {
	$(".myEmoji").show();
	ishow = true;
});

$(".btn-success").click(function() {
    
		var data = $("#content")[0].innerHTML;
		data=data.replace(/\t/g,"");
		data=data.replace(/\r/g,"");
		data=data.replace(/\n/g,"");
		//var picurl="";
		//alert(picurl);
		$.ajax({
			url : "/cool/publish.do",
			type : "POST",
			data : {
				"data" : data,
				"picurl":picurl
			},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
	
			success : function(data, state) {
				alert(data.data);
				if(data.data.indexOf("成功")!=-1){window.location.reload();}
			}
		})
	

});
$(document).click(
		function(e) {
			var s = e.target
			if (s != ("[object HTMLImageElement]") && ishow == true
					&& s != "[object HTMLElement]" && "" != s) {
				$(".myEmoji").hide();
				// alert(s);
			}
		});

$(".myEmoji img").each(function() {
	$(this).click(function() {
		var url = getname($(this)[0].src);
		$('#content').append(url);
	})
})

function getname(d) {
	// alert(d);
	var index = d.lastIndexOf("\/");
	var end = d.lastIndexOf(".");
	temp = d.substring(index + 1, end);

	return "[" + decodeURI(temp) + "]";
}

$(function() {
	var $inp = $('#content');
	$inp.bind('keydown', function(e) {
		var key = e.which;
		// $('#sendbut').html("11");
		var len = 140 - $inp[0].innerHTML.length;

		document.getElementById("sendbut").innerHTML = " 还可以输入 " + len;

		if (key == 13) {
		}

	});
});



