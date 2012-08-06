$(function() {
  $("#products th a, #products .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#products_search input").keyup(function() {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
    return false;
  });
});

$(function() {
  $("#users th a, #users .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
});

$(function() {
  $("#div_update th a, #div_update .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#div_update_search input").keyup(function() {
    $.get($("#div_update_search").attr("action"), $("#div_update_search").serialize(), null, "script");
    return false;
  });
});
