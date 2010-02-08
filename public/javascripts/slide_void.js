$(document).ready(function() {
  $(".dot_link").click(function () {
      if($(".voited_form").css("display") == "none") {
        $(".voited_form").show("slow");
      }
      else
      {
        $(".voited_form").hide("slow");
      }
  });
});

