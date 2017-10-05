<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\GuestSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Guests';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="guest-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Guest', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'guest_id',
            'guest_name',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
