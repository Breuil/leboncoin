<?php

namespace App\Service;

use App\Repository\AdvertRepository;

class AdvertService {

    public function __construct( AdvertRepository $er ) {
        $this->er = $er;
        
    }

    public function getAll() {
        return $this->er->findAll();
    }

    public function getOne($id) {
        return $this->er->find($id);
    }

    public function findByName($name, $sort) {
        return $this->er->findByName($name, $sort);
    }

}