<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Guest;
use app\models\Room;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\CheckIn */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="check-in-form">

	<?php $form = ActiveForm::begin(); ?>



	<?= $form->field($model, 'guest_id')->dropDownList(
		ArrayHelper::map(Guest::find()->all(),'id','fullName'),
		['prompt'=>'Select Guest']
		) ?>

	<?= $form->field($model, 'room_id')->dropDownList(
		ArrayHelper::map(Room::find()->all(),'id','roomno'),
		['prompt'=>'Select Room']
		) ?>

	<?php echo $form->field($model, 'status')->dropDownList
	(['Active' => 'Active', 'Inactive' => 'Inactive']); ?>

		<div class="form-group">
			<?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
		</div>

		<?php ActiveForm::end(); ?>

	</div>
