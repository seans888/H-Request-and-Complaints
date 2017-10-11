<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\Employee1Search */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Employee1s';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee1-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Employee1', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'department_id',
            'fname',
            'surname',
            'position',
            // 'supervisor',
            // 'sched_start',
            // 'sched_end',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
