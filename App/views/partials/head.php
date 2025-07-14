<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="Author" content="Łukasz Jaśkiewicz" />

    <?php foreach ($cssFiles as $css) : ?>
        <link rel="stylesheet" href="./css/<?= $css ?>.css" />
    <?php endforeach; ?>
    <link rel="stylesheet" href="./css/main.css" />
    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" href="./css/adverts.css" />
    <?php if ($includeFontAwesome): ?>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
            integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer" />
    <?php endif; ?>
    <title><?= $title; ?> </title>
    <?php if ($includeJQuery): ?>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <?php endif; ?>
</head>