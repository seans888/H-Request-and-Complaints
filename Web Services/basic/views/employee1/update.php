<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Employee1 */

$this->title = 'Update Employee1: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Employee1s', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="employee1-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
