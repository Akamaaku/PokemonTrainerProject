// Quick script for menu selection on navbar

$(document).ready(() => {
  $(".menu").on("click", ".item", item => {
    if (!item.hasClass("active")) {
      item
        .addClass("active")
        .siblings(".item")
        .removeClass("active");
    }
  });
});
