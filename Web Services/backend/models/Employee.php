<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property integer $id
 * @property integer $department_id
 * @property string $fname
 * @property string $surname
 * @property integer $level
 *
 * @property Department $department
 * @property Ticket[] $tickets
 * @property Ticket[] $tickets0
 * @property Transcript[] $transcripts
 * @property Transcript[] $transcripts0
 */
class Employee extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['department_id', 'fname', 'surname', 'level'], 'required'],
            [['department_id', 'level'], 'integer'],
            [['fname', 'surname'], 'string', 'max' => 45],
            [['department_id'], 'exist', 'skipOnError' => true, 'targetClass' => Department::className(), 'targetAttribute' => ['department_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'department_id' => 'Department ID',
            'fname' => 'Fname',
            'surname' => 'Surname',
            'level' => 'Level',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepartment()
    {
        return $this->hasOne(Department::className(), ['id' => 'department_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTickets()
    {
        return $this->hasMany(Ticket::className(), ['emp_repond_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTickets0()
    {
        return $this->hasMany(Ticket::className(), ['emp_create_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTranscripts()
    {
        return $this->hasMany(Transcript::className(), ['by_employee' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTranscripts0()
    {
        return $this->hasMany(Transcript::className(), ['current_emp_resp' => 'id']);
    }
}
