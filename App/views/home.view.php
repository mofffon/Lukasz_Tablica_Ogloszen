<!DOCTYPE html>
<html lang="pl">

<?= loadPartial('partials/head', [
    'title' => 'Strona Główna',
    'cssFiles' => ['main', 'index', 'adverts'],
    'includeFontAwesome' => true,
    'includeJQuery' => true
]);
?>

<body>
    <?= loadPartial('partials/navBar') ?>
    <?= loadPartial('partials/searchBar') ?>
    <div class="newest-adverts-heading-background">
        <div class="container">
            <h2 class="h2-heading">Najnowsze Ogłoszenia</h2>
        </div>
    </div>
    <div class="newest-adverts-cards">
        <div class="container">
            <div class="advert-cards">
                <?php foreach ($adverts as $advert): ?>
                    <a href="/adverts/<?php $advert->id ?>">
                        <div class="advert-card">
                            <img
                                src=""
                                alt="Obraz przedmoitu / usługi"
                                class="item-img" />
                            <h3 class="h3-heading"><?= $advert->title ?></h3>
                            <p class="short-description"><?= $advert->short_description ?></p>
                            <p class="category"><?= $advert->category_name ?></p>
                            <p class="status"><?= $advert->status_name ?></p>
                            <p class="price"><?= formatZlotyAmount($advert->price_in_zlotys) ?></p>
                            <p class="location"><?= $advert->city . ", " . $advert->voivodship . ";<nbsp/>" . $advert->created_at ?></p>
                        </div>
                    </a>
                <?php endforeach; ?>

            </div>
        </div>
    </div>
    <?php loadPartial('partials/footer') ?>
    <script src="./javascripts/main.js"></script>
</body>

</html>