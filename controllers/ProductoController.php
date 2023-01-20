<?php

namespace app\controllers;
use Yii;
use app\models\Producto;
use yii\data\ActiveDataProvider;
use yii\base\ErrorException;
use yii\db\IntegrityException;
use Exception;

class ProductoController extends \yii\web\Controller
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

    public function actionRegister()
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $model = new  Producto();
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
    public function actionRemove()
    {   
        $body = Yii::$app->getRequest()->getBodyParam('id');
        $producto = Producto::findOne($body)->delete();
       
        return $producto;
    }

    public function actionViewAll()
    {
        return Producto::find()->all();
    }

    public function actionViewPagination()
    {
        $params = Yii::$app->request->getQueryParams();
        
        $pageSize = $params['pageSize'];
        $page = $params['page'];
       
        $query = Producto::find()->orderBy('producto.id');
        $provider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'page'=>$page,
                'pageSize' => $pageSize,
                
            ],
            'sort' =>[],
        ]);
        return $provider->getModels();
    }
    
    public function actionChangeData()
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $producto = Producto::findOne($body['id']);
        $producto->load($body,'');
        $producto->save();
        return $producto;
    }
    public function actionIndex()
    {
        return $this->render('index');
    }

}
