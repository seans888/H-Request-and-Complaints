<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "transcript".
 *
 * @property integer $id
 * @property string $description
 * @property string $time
 * @property integer $ticket_id
 *
 * @property Ticket $ticket
 */
class Transcript extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transcript';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description', 'ticket_id'], 'required'],
            [['description'], 'string'],
            [['time'], 'safe'],
            [['ticket_id'], 'integer'],
            [['ticket_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ticket::className(), 'targetAttribute' => ['ticket_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'description' => 'Description',
            'time' => 'Time',
            'ticket_id' => 'Ticket ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTicket()
    {
        return $this->hasOne(Ticket::className(), ['id' => 'ticket_id']);
    }
}
