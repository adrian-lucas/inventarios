<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuario".
 *
 * @property int $id
 * @property string $nombres
 * @property string $username
 * @property string|null $password
 * @property string $password_hash
 * @property string $access_token
 * @property string|null $auth_key
 */
class Usuario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombres', 'username', 'password_hash', 'access_token'], 'required'],
            [['nombres', 'username', 'password', 'password_hash', 'access_token', 'auth_key'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombres' => 'Nombres',
            'username' => 'Username',
            'password' => 'Password',
            'pasword_hash' => 'Pasword Hash',
            'access_token' => 'Access Token',
            'auth_key' => 'Auth Key',
        ];
    }
}
