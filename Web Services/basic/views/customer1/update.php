<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Customer1 */

$this->title = 'Update Customer1: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Customer1s', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="customer1-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
