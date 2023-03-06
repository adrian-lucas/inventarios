<?php

namespace app\controllers;
use Yii;
use yii\console\Controller;

class EmailController extends \yii\web\Controller
{
   

    public function beforeAction($action)
    {
        Yii::$app->response->format= \yii\web\Response::FORMAT_JSON;
        
        if (Yii::$app->getRequest()->getMethod() === 'OPTIONS') {         	
            Yii::$app->getResponse()->getHeaders()->set('Allow', 'POST GET PUT');
            Yii::$app->end();     	
        }     
        $this->enableCsrfValidation=false;
        return parent::beforeAction($action);
    }

    public function actionSendEmail()
    {
        Yii::$app->mailer->compose()
        ->setFrom('201809383@est.umss.edu')
        ->setTo('donplucas@gmail.com')
        ->setSubject('Prueba')
        ->setTextBody('segundo saludo')
        ->send();
    }


}
