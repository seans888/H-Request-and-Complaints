<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Employee1 */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee1-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'department_id')->textInput() ?>

    <?= $form->field($model, 'fname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'surname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'position')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'supervisor')->textInput() ?>

    <?= $form->field($model, 'sched_start')->textInput() ?>

    <?= $form->field($model, 'sched_end')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
