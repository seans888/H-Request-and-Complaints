<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ticket".
 *
 * @property integer $id
 * @property integer $check_in_id
 * @property integer $category_id
 * @property integer $employee_responsible_id
 * @property integer $employee_create_id
 * @property integer $level
 * @property string $description
 * @property string $time_open
 * @property string $time_close
 *
 * @property Category $category
 * @property CheckIn $checkIn
 * @property Employee $employeeCreate
 * @property Employee $employeeResponsible
 * @property Transcript[] $transcripts
 */
class Ticket extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ticket';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['check_in_id', 'category_id', 'employee_responsible_id', 'employee_create_id', 'level', 'description'], 'required'],
            [['check_in_id', 'category_id', 'employee_responsible_id', 'employee_create_id', 'level'], 'integer'],
            [['description'], 'string'],
            [['time_open', 'time_close'], 'safe'],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'id']],
            [['check_in_id'], 'exist', 'skipOnError' => true, 'targetClass' => CheckIn::className(), 'targetAttribute' => ['check_in_id' => 'id']],
            [['employee_create_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['employee_create_id' => 'id']],
            [['employee_responsible_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['employee_responsible_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'check_in_id' => 'Check In ID',
            'category_id' => 'Category ID',
            'employee_responsible_id' => 'Employee Responsible ID',
            'employee_create_id' => 'Employee Create ID',
            'level' => 'Level',
            'description' => 'Description',
            'time_open' => 'Time Open',
            'time_close' => 'Time Close',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCheckIn()
    {
        return $this->hasOne(CheckIn::className(), ['id' => 'check_in_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeCreate()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_create_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployeeResponsible()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_responsible_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTranscripts()
    {
        return $this->hasMany(Transcript::className(), ['ticket_id' => 'id']);
    }
}
