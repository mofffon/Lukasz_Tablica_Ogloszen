$(document).ready(function () {
    $(".advert-category").on("click", (event) => {
        const target = event.currentTarget;

        if ($(target).attr("class").includes("selected-advert-category")) {
            $(target).removeClass("selected-advert-category");
            $(".info-about-category").text("Wybrano kategorię: Wszystko");
            return;
        }

        $(".selected-advert-category").removeClass("selected-advert-category");

        $(target).addClass("selected-advert-category");
        $(".info-about-category").text(
            "Wybrano kategorię: " + $(target).children("p").text().trim()
        );
    });
});
