<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Employee1Search */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee1-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'department_id') ?>

    <?= $form->field($model, 'fname') ?>

    <?= $form->field($model, 'surname') ?>

    <?= $form->field($model, 'position') ?>

    <?php // echo $form->field($model, 'supervisor') ?>

    <?php // echo $form->field($model, 'sched_start') ?>

    <?php // echo $form->field($model, 'sched_end') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
