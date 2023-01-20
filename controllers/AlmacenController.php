<?php

namespace app\controllers;
use Yii;
use app\models\Almacen;

class AlmacenController extends \yii\web\Controller
{
    public function behaviors()
    {
    $behaviors = parent::behaviors();
    $behaviors['verbs'] = [
        'class' => \yii\filters\VerbFilter::class,
        'actions' => ['register'=>['post'],
                      
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

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionRegister()
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $model = new Almacen();
        $model->load($body,'');
        if(!$model->save())
        {
            return ['succes'=> false,'message'=>'Error en el registro','Error'=>$model->errors];
        }
        else
        {
            return ['succes'=> true,'message'=>'La accion se realizo exitosamente','registrado'=>$model];
        }
        
    }
    

}
