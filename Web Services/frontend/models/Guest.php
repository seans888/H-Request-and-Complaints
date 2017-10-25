<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "guest".
 *
 * @property integer $id
 * @property string $firstName
 * @property string $lastName
 *
 * @property CheckIn[] $checkIns
 */
class Guest extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'guest';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
        [['firstName', 'lastName'], 'required'],
        [['firstName', 'lastName'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
        'id' => 'ID',
        'firstName' => 'First Name',
        'lastName' => 'Last Name',
        'fullName' => Yii::t('app', 'Full Name')
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCheckIns()
    {
        return $this->hasMany(CheckIn::className(), ['guest_id' => 'id']);
    }

    public function getFullName() {
        return $this->firstName . ' ' . $this->lastName;
 }
 
}
