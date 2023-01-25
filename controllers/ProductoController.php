<?php

namespace app\controllers;
use Yii;
use app\models\Producto;
use app\models\ProductoCategoria;
use app\models\Seccion;
use app\models\Marca;

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
        $model->fecha_creacion= date('Y-m-d');
       
        if(!$model->save())
        {
            return ['succes'=> false,'message'=>'Error en el registro','Error'=>$model->errors];
        }
        else
        {
            return ['succes'=> true,'message'=>'La accion se realizo exitosamente','registrado'=>$model];
        }
    }
    public function actionRemove($id)//mensaje de eliminado
    {   
        $producto = Producto::findOne($id);
        if($producto == null)
        {
            return ['succes'=> false,'message'=>'Error al eliminar producto','Error'=>'producto con id: '.$id.' inexistente'];
        }
        try{
            $producto->delete();
        }catch(Exception $e){
            return['succes'=> false,'message'=>'Error al eliminar producto','Error'=>$e->getMessange()];
        }
        
        return $producto;       
    }

    public function actionViewOne()
    {
        return Producto::findOne(Yii::$app->getRequest()->getBodyParam('id'));
    }

    public function actionViewAll()
    {
        return Producto::find()->all();
    }

    public function actionViewPagination() //Informacion de la paginacion
    {
        $params = Yii::$app->request->getQueryParams();
        
        $pageSize = isset($params['pageSize'])?$params['pageSize']:10;
        //$page = isset($params['page'])?$params['page']:0;
       
        $query = Producto::find()->orderBy('producto.id');
        $provider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                //'page'=>$page,
                'pageSize' => $pageSize,
                
            ],
            'sort' =>[],
        ]);
        return $provider->getModels();
    }
    
    public function actionChangeData($id)
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $producto = Producto::findOne($id);
        $producto->load($body,'');
        $producto->fecha_actualizacion = date('Y-m-d');
        
        if(!$producto->save())
        {
            return ['succes'=> false,'message'=>'Error en la actualizacion de datos','Error'=>$producto->errors];
        }
        else
        {
            return ['succes'=> true,'message'=>'La accion se realizo exitosamente','Actualizado'=>$producto];
        }
    }
    public function actionViewProductsBySection($idSeccion)//controlar si existe la seccion cambiar al formato indicado
    {
        
        $seccion = Seccion::find()
                         ->select(['seccion.id','seccion.codigo as seccion','seccion.descripcion','almacen.codigo as almacen'])
                         ->leftJoin('almacen','almacen_id=almacen.id') 
                         ->where(['seccion.id'=>$idSeccion])
                         ->joinWith('productos')
                         ->asArray()
                         ->one();
        return $seccion;

    }
    public function actionTotalStockByMark($idMarca)//controlar si existe la seccion cambiar al formato indicado

    {
        //$idMark = Yii::$app->getRequest()->getBodyParam('id');
        $totalStock = Producto::find()
        ->select(['SUM(producto.stock) as stockTotal'])
        ->leftJoin('marca','producto.marca_id=marca.id')
        ->where(['producto.marca_id'=>$idMarca,])
        ->groupBy('producto.marca_id')
        ->asArray()
        ->one();
        if($totalStock == null)
         {
            return ['succes'=> false,'message'=>'Error al obtener total stock de la marca','Error'=> 'idMarca inexistente'];
         }
        $marca = Marca::find()
                            ->select(['marca.id',
                                      'marca.nombre as marca',
                                      'marca.descripcion',
                                      "({$totalStock['stockTotal']}) as stockTotalDeProductos"])
                            ->where(['marca.id'=>$idMarca])
                            ->joinWith([
                                'productos' => function (\yii\db\ActiveQuery $query) {
                                    $query->select(['marca_id','nombre','stock']);
                                }
                            ])
                            ->asArray()
                            ->one();
       
        return $marca;
    }

    public function actionMaximumStock()
    {
        $stockMaximo = Producto::find()
                                ->select(['MAX(stock) as maximo'])
                                ->asArray()
                                ->one()['maximo'];
        $productoConMayorStock = Producto::find()
                                        ->where(['stock'=>$stockMaximo])
                                        ->one(); 

        return   ['succes'=> true,'message'=>'La accion se realizo exitosamente','Producto'=> $productoConMayorStock];
    }
    public function actionIsMoreThanZero($idProducto)
    {
        $res = false;
        $message ='';
        $query = Producto::find()
                            ->where(['id'=>$idProducto])
                            ->one();

         if($query == null)
         {
            return ['succes'=> false,'message'=>'Error al verififcar stock','error'=> 'Registro no encontrado'];
         }

        $res = ($query->stock)<1;
        return ['producto'=>$query->nombre,'stock'=>$query->stock,'esCero'=>$res];                                                                                         
    }
    
    public function actionUnLinked($idCategoria,$idProducto)
    {
        $productoCategoria = ProductoCategoria::find()
                                      ->where(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto])
                                      ->one();

        if($productoCategoria == null)
        {
            return ['succes'=> false,'message'=>'Error al desenlazar producto/categoria','Error'=> 'idProducto o idCategoria inexistente'];
        }

        try {
            $productoCategoria->delete(); 
        } catch (Exception $e) {
            return ['succes'=> false,'message'=>'Error al desenlazar producto/categoria','Error'=> $e->getMessage()];
        }                    
          
        return ['succes'=> true,'message'=>'La accion se realizo exitosamente','Desenlazado'=>$productoCategoria];
    }
    public function actionUnLinkedByBatch()
    {
        $idCategoria = Yii::$app->getRequest()->getBodyParam('idCategoria');
        
        return ProductoCategoria::find()
            ->where(['categoria_id'=>$idCategoria])
            ->asArray()
            ->all();

    }

    public function actionLinked()//mantener consistencia al enviar parametros con unlinked,formato de respuestas,
                                 // verificar si existe antes de utilizar sus metodos, enviar solo un return por funcion
                                //estructurar y organizar bien el código
                                //devolver codigo de estado segun las respuestas
                                //estructurar todas las respuestas
                                //devolver informacion de paginacion, numero de pagina, total de registros,total de paginas,
    {
        $body = Yii::$app->getRequest()->getBodyParams();
        $idCategoria = Yii::$app->getRequest()->getBodyParam('categoria_id');
        $idProducto =  Yii::$app->getRequest()->getBodyParam('producto_id');
        $productoCategoria = ProductoCategoria::find()
                                            ->where(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto])
                                            ->one();
        if($productoCategoria != null)
        {
            return ['succes'=> false,'message'=>'Error al enlazar producto/categoria','Error'=> 'idProducto y idCategoria ya estan enlazados'];
        }else {

            $productoCategoria = new ProductoCategoria();
            $productoCategoria->load($body,'');
            if(!$productoCategoria->save())
            {
                return ['succes'=> false,'message'=>'Error al enlazar producto/categoria','Error'=>$productoCategoria->errors];
            }
            else{
                return ['succes'=> true,'message'=>'La accion se realizo exitosamente','Enlazado'=>$productoCategoria];
            } 
            
        }
    }
     
}
