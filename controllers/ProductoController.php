<?php

namespace app\controllers;
use Yii;
use app\models\Producto;
use app\models\ProductoCategoria;
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
                      'view-one'=>['get'],
                      'view-pagination' =>['get'],
                      'remove'=>['delete','get'],
                      'change-data'=>['put'],
                      'view-products-by-section'=>['get'],
                      'total-stock-by-mark'=>['get'],
                      'maximum-stock'=>['get'],
                      'is-more-than-zeso'=>['get'],
                      'un-linked'=>['delete'],
                      'linked'=>['post'],
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
        $producto = Producto::findOne($body);
        
        
        try{
            $producto->delete();
        }catch(Exception $e){
            return ['succes'=> false,'message'=>'Error en el registro','Error'=>$producto->errors];
        }       
    }
    public function actionViewOne()
    {
        return Producto::findOne(Yii::$app->getRequest()->getBodyParam('id'));
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
    public function actionViewProductsBySection()
    {
        $idSection = Yii::$app->getRequest()->getBodyParam('idSection');
        
        return Producto::find()
                        ->where(['seccion_id'=>$idSection])                   
                        ->all();

    }
    public function actionTotalStockByMark()

    {
        $idMark = Yii::$app->getRequest()->getBodyParam('id');
        $totalStock = Producto::find()
                            ->select(['SUM(producto.stock) as stockToral'])
                            ->leftJoin('marca','producto.marca_id=marca.id')
                            ->where(['producto.marca_id'=>$idMark])
                            ->groupBy('producto.marca_id')
                            ->asArray()
                            ->all();
        return $totalStock;
    }

    public function actionMaximumStock()
    {
        return Producto::find()
                            ->select(['MAX(stock)'])
                            ->asArray()
                            ->all();                 
    }
    public function actionIsMoreThanZero()
    {
        $res = false;
        $idProducto = Yii::$app->getRequest()->getBodyParam('id');
        $query = Producto::find()
                            ->select(['stock'])
                            ->where(['id'=>$idProducto])
                            ->one();
        $stock = $query->stock;
        if($stock>0)
        {
            $res = true;
        }
        return ['Stock is more than zero'=>$res];                                                                                         
    }
    public function actionUnLinked()
    {
        $idCategoria = Yii::$app->getRequest()->getBodyParam('idCategoria');
        $idProducto = Yii::$app->getRequest()->getBodyParam('idProducto');
        return ProductoCategoria::deleteAll(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto]);
                                /*
                                ->where(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto])
                                ->asArray()
                                ->all();
                                */
    }
    public function actionUnLinkedByBatch()
    {
        $idCategoria = Yii::$app->getRequest()->getBodyParam('idCategoria');
        
        return ProductoCategoria::find()
                                ->where(['categoria_id'=>$idCategoria])
                                ->asArray()
                                ->all();

    }
    public function actionLinked()
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $productoCategoria = new ProductoCategoria();
        $productoCategoria->load($body,'');
        $productoCategoria->save();
        return $productoCategoria;  

    }
     
}
