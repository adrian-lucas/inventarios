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
                      'view-all'=>['get'],
                      'viewPagination' =>['get'],
                      'remove'=>['delete','get'],
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

    public function actionTotalStockByMark()

    {
        $idMark = Yii::$app->getRequest()->getBodyParam('id');
        $totalStock = Marca::find()
                            ->select(['marca.*','producto.stock','producto.nombre as nombreproducto'])
                            ->leftJoin('producto','marca.id = producto.marca_id')
                            ->where(['marca.id'=>$idMark])
                            ->asArray()
                            ->all();
        return $totalStock;
    }



    public function actionIndex()
    {
        return $this->render('index');
    }

}
