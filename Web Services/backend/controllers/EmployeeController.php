<?php

namespace app\controllers;

use yii\rest\ActiveController;

class EmployeeController extends ActiveController
{
    public $modelClass = 'app\models\Employee';
}