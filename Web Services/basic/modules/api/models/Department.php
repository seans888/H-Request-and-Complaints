<?php

namespace app\modules\api\models;

use Yii;

/**
 * This is the model class for table "department".
 *
 * @property integer $id
 * @property string $dept_name
 * @property string $dept_description
 *
 * @property Category[] $categories
 * @property Employee1[] $employee1s
 */
class Department extends \yii\db\ActiveRecord
{

    const SCENARIO_CREATE = 'create';
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'department';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dept_name', 'dept_description'], 'required'],
            [['dept_description'], 'string'],
            [['dept_name'], 'string', 'max' => 45],
        ];
    }

    public function scenarios() {
        $scenarios = parent::scenarios();
        $scenarios['create'] = ['dept_name', 'dept_description'];
        return $scenarios;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'dept_name' => 'Dept Name',
            'dept_description' => 'Dept Description',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(Category::className(), ['department_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployee1s()
    {
        return $this->hasMany(Employee1::className(), ['department_id' => 'id']);
    }
}
