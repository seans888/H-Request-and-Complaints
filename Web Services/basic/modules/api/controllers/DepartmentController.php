<?php

namespace app\modules\api\controllers;
use app\modules\api\models\Department;

class DepartmentController extends \yii\web\Controller
{
	public $enableCsrfValidation=false;
	public function actionIndex()
	{
		\Yii::$app->response->format = \Yii\web\Response::FORMAT_JSON;

		$department = Department::find()->all();

		if(count($department)>0){
			return array('status'=>true,'data'=>$department);
		} else {
			return array('status'=>false, 'data'=>'No departments found.');
		}
	}

	public function actionCreate(){
		\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
		$department = new Department();
		$department->scenario = Department::SCENARIO_CREATE;
		$department->attributes = \Yii::$app->request->post();

		if($department->validate()){
			$department->save();
			return array('status'=>true, 'data'=>'Department added successfully');
		} else {
			return array('status'=>false, 'data'=>$department->getErrors());
		}

	}
}
