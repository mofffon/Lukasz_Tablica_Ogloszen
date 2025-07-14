let uploadImages = [];

$(document).ready(function () {
    $(".add-advert-form-input-image-upload-btn").on("change", function () {
        const file = this.files[0];
        const fileName = file.name;

        if (isImageAlreadyInUploadImages(fileName) === true) {
            alert(
                "Obraz o nazwie '" +
                    fileName +
                    "' juz jest w kolekcji i nie zostanie dodany."
            );
            $(this).val("");
            return;
        }

        const pictureName = $("<h3>", {
            class: "add-advert-form-image-name",
            html: uploadImages.length + 1 + ": " + fileName,
        });

        let reader = new FileReader();
        reader.onload = function (event) {
            const base64String = event.target.result;

            const imgBtnContainer = $("<div>", {
                class: "add-advert-form-input-uploaded-image",
            });

            const image = $("<img>", {
                src: base64String,
                class: "add-advert-form-image " + fileName,
            });

            const removeImgBtn = $("<input>", {
                type: "button",
                class: "remove-image-btn " + fileName,
                value: "Usuń",
            });
            removeImgBtn.on("click", (event) => {
                const imgName = $(event.currentTarget)
                    .prop("class")
                    .split(" ")[1];

                const element = $(".add-advert-form-image").filter(
                    (index, elem) =>
                        $(elem).prop("class").split(" ")[1] === imgName
                )[0];

                $(element).parent().remove();
                uploadImages = uploadImages.filter(
                    (elem) => elem.name !== imgName
                );
            });
            uploadImages.push({
                name: fileName,
                base64String,
                order: uploadImages.length,
            });

            imgBtnContainer.append(pictureName);
            imgBtnContainer.append(image);
            imgBtnContainer.append(removeImgBtn);
            $(".form-loaded-images").append(imgBtnContainer);
        };
        reader.readAsDataURL(file);
        $(this).val("");
    });

    $(".add-advert-form-input-submit-btn").on("click", () => {
        const jsonData = {};

        for (let elem of document.querySelector(".add-advert-form").elements) {
            elem = $(elem);
            const elemClass = elem.prop("class").split(" ")[1];
            jsonData[elemClass] = elem.val();
        }

        jsonData.pictures = uploadImages;
        console.log(jsonData);
    });

    const isImageAlreadyInUploadImages = (searchedImgName) => {
        const result = $(".add-advert-form-image").filter(
            (index, elem) =>
                $(elem).prop("class").split(" ")[1] === searchedImgName
        );

        return result.length > 0;
    };
});
