<?php

namespace app\controllers;

use yii\rest\ActiveController;

class GuestController extends ActiveController
{
    public $modelClass = 'app\models\Guest';
}