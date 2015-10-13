  // function reload_admin(){
  //   window.location = "http://localhost:3000/admin/quicklink"
  // }
  // function reload_orders(){
  //   window.location = "http://localhost:3000/chefs"
  // }
  // function reload_orders_warning(){
  //   window.location = "http://localhost:3000/orders/warning"
  // }

  // setTimeout(function(){
  //   if(window.location.pathname == "/admin/quicklink"){
  //       // reload_admin();
  //       window.location.reload();
  //     }
  // // },300000);
  // },3000);

  // setTimeout(function(){
  //   if (window.location.pathname == "/chefs") {
  //     reload_orders();
  //   };
  //   if (window.location.pathname == "/orders/warning") {
  //     reload_orders_warning();
  //   };
  // }, 3000);

  // var chef = window.location.pathname == "/chefs"
  // var warning = window.location.pathname == "/orders/warning"
  // var admin = window.location.pathname == "/admin/quicklink"
  
  // if (window.location.pathname == "/admin/quicklink") {
  //    setTimeout(function(){
  //     window.location.reload();
  //   }, 4000)
  // }else if(window.location.pathname == "/chefs"){
  //   setTimeout(function(){
  //     // alert("order")
  //     window.location.reload();
  //   }, 4000)
  // }else if( window.location.pathname == "/orders/warning"){
  //   setTimeout(function(){
  //     // alert("warning")
  //     window.location.reload();
  //   }, 3000)
  // };
function statusItem(){
  $("input[type='checkbox'].item").click(function(){
    // console.log($(this).attr("data-id"));
    var _id = ($(this).attr("data-id"));
    if ($(this).is(":checked") == true) {
      // alert("checked")
      var request = $.ajax({
            type: "POST",
            url: "http://localhost:3000/update_status_item.json",
            data: {id:_id, status_item: true},
            dataType: "json"
      });
      request.done(function(){
        // alert("This Item Completed")

      });
      request.fail(function(textStatus){
        alert("Request failed: " + textStatus)
      });

    }else{
        // alert("unchecked")
      var request = $.ajax({
            type: "POST",
            url: "http://localhost:3000/update_status_item.json",
            data: {id:_id, status_item: false},
            dataType: "json"
      });
      request.done(function(){
        alert("This Item Uncompleted")
      });
      request.fail(function(textStatus){
        alert("Request failed: " +textStatus)
      });
    }
  });
}

function statusOrder(){
   $("input[type='checkbox'].status-order").change(function(){
    var _id = $(this).attr("data-id");
    var _btn = $(this);
    if ($(this).is(":checked") == true) {
        $("#loader-container").show();
      var request = $.ajax({
            type: "POST",
            url: "http://localhost:3000/update_status_order.json",
            data: {id:_id, status_order: "paid"},
            dataType: "json",
            // tryCount: 0,
            // retryLimit: 3
      });
      request.done(function(xhr ){
        // console.log(textStatus)
        // console.log(xhr)
        setTimeout(function(){
          $("#loader-container").hide();
          $(".modal-order").click();
          $(".modal-content").html("<div class='text-center'>"+
                                  "<strong>Success ! , changed to Paid this order<strong></div>")        
        },400);
      });
      request.fail(function(){
        // console.log($.ajax(this));
        // console.log(textStatus);
        // console.log("textStatus error");
        // if (textStatus == 'error') {
        //     this.tryCount++;
        //     if (this.tryCount <= this.retryLimit) {
        //         //try again
        //         $.ajax(this);
        //         return;
        //     }            
        //     return;
        // }
        // if (xhr.status == 500) {
        //     //handle error
        // } else {
        //     //handle error
        // }
        // console.log(xhr)
        // console.log(textStatus)
        // console.log(errorThrown)
        // console.log(responseJson)
        // request.reload();
        // setTimeout(function(){
          $("#loader-container").hide();
        // });
        // setTimeout(function(){
          $(_btn).bootstrapToggle('off');
          $(_btn).bootstrapToggle('disable');
        // });
        // setTimeout(function(){
          $(".modal-order").click();
          $(".modal-content").html("<div class='text-center'>"+
                                    "<strong>Failed ! , changed to Paid this order.<strong><br><p>Server Not Response</p></div>")     
        // },3000)
        // console.log(_id);
      });
    }else{
      $("#loader-container").show();
      var request = $.ajax({
            type: "POST",
            url: "http://localhost:3000/update_status_order.json",
            data: {id:_id, status_order: "unpaid"},
            dataType: "json"
      });
      request.done(function(){
        setTimeout(function(){
          $("#loader-container").hide();
          $(".modal-order").click();
          $(".modal-content").html("<div class='text-center'>"+
                                    "<strong>Success ! , changed to Unpaid this order<strong></div>")
        },400)
      });
      request.fail(function(){
        setTimeout(function(){
          $("#loader-container").hide();
          $(".modal-order").click();
          $(".modal-content").html("<div class='text-center'>"+
                                    "<strong>Failed ! , changed to Unpaid this order, please try again<strong></div>");
        }, 1000);
        setTimeout(function(){
          $(_btn).bootstrapToggle('on');
          $(_btn).bootstrapToggle('disable');
        }, 2000)
      });
    }
  });
}


$(document).ready(function(){
    statusItem();
    statusOrder();
    // autoCompleteItem();
});