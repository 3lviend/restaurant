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
          $("#loader-container").hide();

          $(_btn).bootstrapToggle('off');
          $(_btn).bootstrapToggle('disable');

          $(".modal-order").click();
          $(".modal-content").html("<div class='text-center'>"+
                                    "<strong>Failed ! , changed to Paid this order.<strong><br><p>Server Not Response</p></div>")     

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
  if ($(".selected_item tr").hasClass("append") == true) {
    $(".add-item").prop("disabled", false)
  }else{
    $(".add-item").prop("disabled", true)
  };

  $("#from").datepicker({
    dateFormat: 'yy-mm-dd'
  });
  $("#to").datepicker({
    dateFormat: 'yy-mm-dd'
  });

statusItem();
statusOrder();
    // autoCompleteItem();
});