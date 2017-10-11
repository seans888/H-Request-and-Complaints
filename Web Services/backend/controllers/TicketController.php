<?php

namespace app\controllers;

use yii\rest\ActiveController;

class TicketController extends ActiveController
{
    public $modelClass = 'app\models\Ticket';
}