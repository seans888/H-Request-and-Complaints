<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Transcript */

$this->title = 'Create Transcript';
$this->params['breadcrumbs'][] = ['label' => 'Transcripts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transcript-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
