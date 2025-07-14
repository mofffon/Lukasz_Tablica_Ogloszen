const menuClasses = [];

$(document).ready(function () {
    $(".main-menu-btn").each((index, elem) =>
        menuClasses.push(
            "." + $(elem).attr("class").split(" ")[1].replace("-btn", "")
        )
    );

    // Hide most of menu
    $(menuClasses).each((index, className) => {
        if (index > 0) {
            $(className).hide();
        }
    });

    // Hide my-profile edition menu
    $(".my-profile-form").hide();
    $(".my-work-profile-editor").hide();

    // Toggle the profile editor
    $(".my-profile-form-btn").on("click", profileNameChanger);
    $(".my-work-profile-editor-btn").on("click", profileNameChanger);

    function profileNameChanger(event) {
        const target = event.currentTarget;
        const allSigns = {
            profileEditor: {
                close: "Zamknij Edytor Profilu",
                open: "Otwórz Edytor Profilu",
            },
            workProfileEditor: {
                close: "Zamknij Edytor Profilu Szukam Pracy",
                open: "Otwórz Edytor Profilu Szukam Pracy",
            },
        };

        const buttonClass = $(target).attr("class");
        console.log(buttonClass);
        let signs;
        if (buttonClass === "my-profile-form-btn") {
            signs = allSigns.profileEditor;
        } else if (buttonClass === "my-work-profile-editor-btn") {
            signs = allSigns.workProfileEditor;
        }

        const form = $("." + buttonClass.replace("-btn", ""));
        console.log(form);

        if (form.is(":hidden")) {
            $(target).prop("value", signs.close);
            form.show();
        } else {
            $(target).prop("value", signs.open);
            form.hide();
        }
    }

    //Toggle the part of the menu
    $(".main-menu-btn").on("click", (event) => {
        const className = $(event.currentTarget)
            .attr("class")
            .split(" ")[1]
            .replace("-btn", "");
        $("." + className).show();
        menuClasses
            .filter((item) => item != "." + className)
            .forEach((item) => {
                $(item).hide();
            });
    });
});
