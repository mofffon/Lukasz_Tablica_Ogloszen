let allImages;
let currentImage;

$(document).ready(async function () {
    await populateImageGallery();
    $(".button-next").on("click", getNextImage);
    $(".button-prev").on("click", getPreviousImage);
});

async function populateImageGallery() {
    const images = await getAdvertImages(JSONName);
    allImages = images.images;

    if (allImages.length === 0) {
        $(".advert-images").hide();
        return;
    }

    currentImage = allImages[0];
    setDefaultImageControls(currentImage, allImages);
}

const setDefaultImageControls = (currentImage, allImages) => {
    $(".main-advert-image").attr(
        "src",
        currentImage.imagePath + currentImage.imageName
    );

    $(".button-prev").attr("disabled", true);

    if (allImages.length === 1) {
        $(".button-next").attr("disabled", true);
    }
};

function getNextImage() {
    let index = allImages.findIndex(
        (elem) =>
            elem.imageId === currentImage.imageId &&
            elem.imageName === currentImage.imageName &&
            elem.imagePath === currentImage.imagePath
    );

    index += 1;

    currentImage = allImages[index];
    if (index === allImages.length - 1) {
        $(".button-next").attr("disabled", true);
    }

    if (index >= 1) {
        $(".button-prev").attr("disabled", false);
    }

    $(".main-advert-image").attr(
        "src",
        currentImage.imagePath + currentImage.imageName
    );
}

function getPreviousImage() {
    let index = allImages.findIndex(
        (elem) =>
            elem.imageId === currentImage.imageId &&
            elem.imageName === currentImage.imageName &&
            elem.imagePath === currentImage.imagePath
    );

    index -= 1;

    currentImage = allImages[index];
    if (index === 0) {
        $(".button-prev").attr("disabled", true);
        if (allImages.length !== 1) {
            $(".button-next").attr("disabled", false);
        }
    }

    $(".main-advert-image").attr(
        "src",
        currentImage.imagePath + currentImage.imageName
    );
}

function getAdvertImages(advertJSONName) {
    return new Promise((resolve, reject) => {
        $.getJSON("./javascripts/" + advertJSONName)
            .done(function (data) {
                console.log("data", data);
                resolve(data);
            })
            .fail((jqXHR, textStatus, errorThrown) => reject(errorThrown));
    });
}
