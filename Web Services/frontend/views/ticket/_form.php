<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

use app\models\CheckIn;
use app\models\Category;
use app\models\Employee;
/* @var $this yii\web\View */
/* @var $model app\models\Ticket */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ticket-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'check_in_id')->dropDownList(
        ArrayHelper::map(CheckIn::find()
            ->where(['status' => 'Active'])
            ->all(),
            'id','room.roomno'),
        ['prompt'=>'Select Room']
        ) ?>

    <?= $form->field($model, 'category_id')->dropDownList(
        ArrayHelper::map(Category::find()->all(),
            'id','name'),
        ['prompt'=>'Select Category']
        ) ?>

        <?= $form->field($model, 'employee_responsible_id')->dropDownList(
        ArrayHelper::map(Employee::find()
            ->where(['level' => '1'])
            ->all(),
            'id','fullName'),
        ['prompt'=>'Select Employee Responsible for Ticket']
        ) ?>

        <?= $form->field($model, 'employee_create_id')->dropDownList(
        ArrayHelper::map(Employee::find()
            ->where(['department_id' => '5'])
            ->all(),
            'id','fullName'),
        ['prompt'=>'Select Employee who created Ticket']
        ) ?>

        <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
