<?php

namespace App\Controllers;

use Services\Database;

class HomeController
{
    protected Database $db;

    public function __construct(Database $db)
    {
        $this->db = $db;
    }

    /**
     * Show the latest adverts
     * 
     * @return void
     */
    public function index()
    {
        $adverts = $this->db->query("SELECT adverts.id, title, content, short_description, categories.name as category_name, status.name as status_name, price_in_zlotys, city, voivodship, created_at, edited_at FROM adverts INNER JOIN categories ON category_id inner join status WHERE adverts.category_id = categories.id AND adverts.status_id = status.id ORDER BY created_at DESC LIMIT 10")->fetchAll();

        loadView('home', ['adverts' => $adverts]);
    }
}
