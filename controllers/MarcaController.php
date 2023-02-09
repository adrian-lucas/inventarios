<?php

namespace app\controllers;
use Yii;
use app\models\Marca;

class MarcaController extends \yii\web\Controller
{
    public function behaviors()
    {
    $behaviors = parent::behaviors();
    $behaviors['verbs'] = [
        'class' => \yii\filters\VerbFilter::class,
        'actions' => ['register'=>['post'],
                      'total-stock-by-brand'=>['get'],
                      'view-all-brands'=>['get'],                      
                     ]
     ];
    $behaviors['authenticator'] = [         	
    'class' => \yii\filters\auth\HttpBearerAuth::class,         	
    'except' => ['options']     	
    ];
        
     return $behaviors;
    }

    public function beforeAction($action)
    {
        Yii::$app->response->format= \yii\web\Response::FORMAT_JSON;
        $this->enableCsrfValidation=false;
        return parent::beforeAction($action);
    }

    public function actionTotalStockByBrand($id)
    {
        $totalStock = Marca::find()
                            ->select(['marca.*','producto.stock','producto.nombre as nombreproducto'])
                            ->leftJoin('producto','marca.id = producto.marca_id')
                            ->where(['marca.id'=>$id])
                            ->asArray()
                            ->all();
        return $totalStock;
    }
    public function actionViewAllBrands()
    {
        $res = [
            'succes'=>true,
            'message'=> 'La accion se realizo correctamente',
            'data'=> Marca::find()->select(['marca.*'])->all(),
        ];
        return $res;
    }



    public function actionIndex()
    {
        return $this->render('index');
    }

}
