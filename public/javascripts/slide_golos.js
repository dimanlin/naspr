
$(document).ready(function() {
  $(".golosovat").click(function () {
    var title = $(this).attr("title");

      if ($("div[title=" + title + "]").filter(".givegolos").is(":hidden")) {

        $("div[title=" + title + "]").filter(".givegolos").slideToggle("slow");

      } else {
        $("div[title=" + title + "]").filter(".givegolos").slideToggle("slow");
      }
  });
});

