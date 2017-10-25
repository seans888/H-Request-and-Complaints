<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "check_in".
 *
 * @property integer $id
 * @property string $check_in
 * @property string $check_out
 * @property integer $guest_id
 * @property integer $room_id
 *
 * @property Guest $guest
 * @property Room $room
 * @property Ticket[] $tickets
 */
class CheckIn extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'check_in';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['check_in', 'check_out'], 'safe'],
            [['guest_id', 'room_id'], 'required'],
            [['guest_id', 'room_id'], 'integer'],
            [['guest_id'], 'exist', 'skipOnError' => true, 'targetClass' => Guest::className(), 'targetAttribute' => ['guest_id' => 'id']],
            [['room_id'], 'exist', 'skipOnError' => true, 'targetClass' => Room::className(), 'targetAttribute' => ['room_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'check_in' => 'Check In',
            'check_out' => 'Check Out',
            'guest_id' => 'Guest ID',
            'room_id' => 'Room ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGuest()
    {
        return $this->hasOne(Guest::className(), ['id' => 'guest_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoom()
    {
        return $this->hasOne(Room::className(), ['id' => 'room_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTickets()
    {
        return $this->hasMany(Ticket::className(), ['check_in_id' => 'id']);
    }
}
