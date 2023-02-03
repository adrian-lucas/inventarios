<?php

namespace app\controllers;
use app\models\Seccion;
use Yii;

class SeccionController extends \yii\web\Controller
{
    public function behaviors()
    {
    $behaviors = parent::behaviors();
    $behaviors['verbs'] = [
        'class' => \yii\filters\VerbFilter::class,
        'actions' => ['register'=>['post'],
                      'total-stock-by-brand'=>['get'],                      
                     ]
     ];
     return $behaviors;
    }

    public function beforeAction($action)
    {
        Yii::$app->response->format= \yii\web\Response::FORMAT_JSON;
        $this->enableCsrfValidation=false;
        return parent::beforeAction($action);
    }
    public function actionViewAllSeccions()
    {
        $res = [];
        $res = [
            'succes'=>true,
            'message'=> 'La accion se realizo correctamente',
            'data'=> Seccion::find()->select(['descripcion'])->all(),
        ];
        return $res;
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

}
