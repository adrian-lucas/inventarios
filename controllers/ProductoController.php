<?php

namespace app\controllers;
use Yii;
use app\models\Producto;
use app\models\ProductoCategoria;
use app\models\Seccion;
use app\models\Marca;

use yii\data\ActiveDataProvider;
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
                      'total-stock-by-brand'=>['get'],
                      'maximum-stock'=>['get'],
                      'is-more-than-zeso'=>['get'],
                      'un-linked'=>['delete'],
                      'linked'=>['post'],
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
        
        if (Yii::$app->getRequest()->getMethod() === 'OPTIONS') {         	
            Yii::$app->getResponse()->getHeaders()->set('Allow', 'POST GET PUT');
            Yii::$app->end();     	
        }     
        $this->enableCsrfValidation=false;
        return parent::beforeAction($action);
    }

    public function actionRegister()
    {
        $res = [];
        $body  = Yii::$app->getRequest()->getBodyParams();
        $model = new  Producto();
        $model->load($body,'');
        $model->fecha_creacion= date('Y-m-d');
       
        if(!$model->save()){
            Yii::$app->getResponse()->setStatusCode(422);
            $res = [ 
                'succes'=>false,
                'message'=>'Producto no registrado',
                'error'=>$model->errors,
            ];
        }else{
            Yii::$app->getResponse()->setStatusCode(201);
            $res = [
                'succes'=>true,
                'message'=>'Producto registrado con éxito',
                'data'=>$model
            ];
        }

        return $res;
    }

    public function actionRemove($id)
    {   
        $res = [];
        $model = Producto::findOne($id);

        if($model != null){
            try{
                $model->delete();
                $res = [
                    'succes'=>true,
                    'message'=>'Producto eliminado',
                    'data'=>$model, 
                ];
            }catch(IntegrityException $ie){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'succes'=>false,
                    'message'=>'El producto se encuentra en uso',
                    'error'=>$ie->getMessage(),
                ];
    
            }catch(Exception $e){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'succes'=>false,
                    'message'=>'Producto no eliminado',
                    'error'=>$e->getMessage(),
                ];
            }
        }else{
            Yii::$app->getResponse()->setStatusCode(404);
            $res = [
                'succes'=>false,
                'message'=>'Producto no eliminado',
                'error'=>'Producto con id: '.$id.' no existe',
            ];
        }

        return $res;       
    }

    public function actionViewOne($id)
    {
        $res = [];
        $model = Producto::findOne($id);

        if($model != null){
            $res = [
                'succes'=>true,
                'message'=>'Producto encontrado',
                'data'=>$model, 
            ];
            
        }else{
            Yii::$app->getResponse()->setStatusCode(404, 'Producto no encontrado.');
            $res = [
                'succes'=>false,
                'message'=>'Producto no encontrado',
                'error'=> 'Producto con id: '.$id.' no existe',
            ];
        }
           
        return $res;
    }

    public function actionViewPagination($pageSize = 10) //Aún sigue con problemas
    {
        $res = [];
        $query = Producto::find()
            ->select(['producto.*','marca.nombre as marca','seccion.descripcion as seccion'])
            ->leftJoin('seccion','seccion.id = producto.seccion_id')
            ->leftJoin('marca','marca.id = producto.marca_id')
            ->orderBy('producto.id')
            ->asArray();
            //->all();

        $provider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                //'page'=>$page,
                'pageSize' => $pageSize,
            ],
            'sort'=>[],
        ]);
        $products = $provider->getModels();
        $pagination = $provider->pagination;
      //  return $provider->pagination;
        $currentPage = $pagination->page+1;
        
        $totalPages = $pagination->pageCount;
        $totalCount = $pagination->totalCount;

        $res =[
            'succes'=>true,
            'data'=>$products,
            'pagination'=>[
                'previousPage' => $currentPage > 1 ? $currentPage-1 : null,
                'currentPage' => $currentPage,
                'nextPage' => $currentPage < $totalPages ? $currentPage+1 : null,
                'totalPages' => $totalPages,
                'pageSize' => $pageSize,
                'totalCount' => $totalCount

            ],
        ];
        
        
        return $res;
    }
    
    public function actionChangeData($id)
    {
        $res = [];
        $body = Yii::$app->getRequest()->getBodyParams();
        $model = Producto::findOne($id);
        $model->load($body,'');
        $model->fecha_actualizacion = date('Y-m-d');
        
        if(!$model->save()){
            Yii::$app->getResponse()->getStatusCode(420);
            $res = [
                'succes'=> false,
                'message'=>'No se realizaron los cambios',
                'error'=>$model->errors
            ];
        }
        else
        {
            Yii::$app->getResponse()->setStatusCode(201);
            $res = [
                'succes'=> true,
                'message'=>'Se realizaron los cambios',
                'data'=>$model
            ];
        }
        return $res;
    }

    public function actionViewProductsBySection($idSeccion)
    {
        $res = [];
        $model = Seccion::find()
                         ->select(['seccion.id','seccion.codigo as seccion','seccion.descripcion','almacen.codigo as almacen'])
                         ->leftJoin('almacen','almacen_id=almacen.id') 
                         ->where(['seccion.id'=>$idSeccion])
                         ->joinWith('productos')
                         ->asArray()
                         ->one();
        if($model != null){
            $res = [
                'succes'=> true,
                'message'=>'Seccion encontrada',
                'data'=>$model
            ];
        }else{
            Yii::$app->getResponse()->setStatusCode(404,'Seccion no encontrada');
            $res = [
                'succes'=> false,
                'message'=>'Seccion no encontrada',
                'error'=>'Producto con id: '.$idSeccion.' no existe'
            ];    
        }
        return $res;

    }

    public function actionTotalStockByBrand($idMarca)
    {
        $res = [];
        $totalStock = Producto::find()
            ->select(['SUM(producto.stock) as stockTotal'])
            ->leftJoin('marca','producto.marca_id=marca.id')
            ->where(['producto.marca_id'=>$idMarca,])
            ->groupBy('producto.marca_id')
            ->asArray()
            ->one();

        if($totalStock != null){
            $model = Marca::find()
            ->select([
                'marca.id',
                'marca.nombre as marca',
                'marca.descripcion',
                "({$totalStock['stockTotal']}) as stockTotalDeProductos"
            ])
            ->where(['marca.id'=>$idMarca])
            ->joinWith([
               'productos' => function (\yii\db\ActiveQuery $query) {
                    $query->select(['marca_id','nombre','stock']);
                }
            ])
            ->asArray()
            ->one();
        
            $res = [
                'succes'=> true,
                'message'=>'Marca encontrada',
                'data'=>$model
            ];            

        }else{
            Yii::$app->getResponse()->setStatusCode(404,'Marca no encontrada');
            $res = [
                'succes'=> true,
                'message'=>'Marca no encontrada',
                'error'=>"Marca con {$idMarca} no existe",
            ]; 
        }
       
        return $res;
    }

    public function actionMaximumStock()
    {
        $stockMaximo = Producto::find()
            ->select(['MAX(stock) as maximo'])
            ->asArray()
            ->one()['maximo'];

        $model = Producto::find()
            ->where(['stock'=>$stockMaximo])
            ->one(); 

        return[
            'succes'=> true,
            'message'=>'La accion se realizo exitosamente',
            'Producto'=> $model
        ];
    }
    public function actionIsMoreThanZero($idProducto)
    {
        $res = [];
        $model = Producto::findOne($idProducto);

        if($model != null){
            
            $res = [
                'succes' => true,
                'message' => 'Producto entontrado',
                'data'=>[
                    'producto'=>$model->nombre,
                    'stock'=>$model->stock,
                    'esCero'=>$model->stock<1,
                ],
            ];    
        }else{
            Yii::$app->getResponse()->setStatusCode(404);
            $res = [
                'succes'=> false,
                'message'=>'Producto no encontrado',
                'error'=> "Producto con {$idProducto} no encontrado"
            ];
        }

        return $res;                                                                         
    }
    
    public function actionUnLinked($idCategoria,$idProducto)
    {
        $res = [];
        $model = ProductoCategoria::find()
            ->where(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto])
            ->one();

        if($model != null){
            try {
                $model->delete(); 
            }catch(IntegrityException $ie){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'succes'=>false,
                    'message'=>'ProductoCategoria se encuentra en uso',
                    'error'=>$ie->getMessage(),
                ];
    
            }catch(Exception $e){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'succes'=>false,
                    'message'=>'ProductoCategoria no desenlazado',
                    'error'=>$e->getMessage(),
                ];
            }
            $res = [
                'succes'=> true,
                'message'=>'ProductoCategoria enlazado',
                'data'=> $model,
            ];   

        }else{
            Yii::$app->getResponse()->setStatusCode(404);
            $res = [
                'succes'=> false,
                'message'=>'ProductoCategoria no desenlazado',
                'error'=> 'idProducto o idCategoria no estan enlazados',
            ];
        }
        
        return $res;
    }
 

    public function actionLinked($idCategoria,$idProducto)
    {
        $res = [];
        $model = ProductoCategoria::find()
            ->where(['categoria_id'=>$idCategoria,'producto_id'=>$idProducto])
            ->one();
        if($model != null){
            $res = [
                'succes'=> false,
                'message'=>'Error al enlazar producto/categoria',
                'error'=> 'Producto y Categoria ya estan enlazados',
            ];
        }else {
            $model = new ProductoCategoria();
            $model->producto_id = $idProducto;
            $model->categoria_id = $idCategoria;
            
            if(!$model->save())
            {
                Yii::$app->getResponse()->setStatusCode(422,'Validacion de datos fallida');
                $res = [
                    'succes'=> false,
                    'message'=>'Error al enlazar Producto/Categoria',
                    'error'=>$model->errors
                
                ];
            }
            else{
                $res = [
                    'succes'=> true,
                    'message'=>'Producto/Categoria enlazados exitosamente',
                    'data'=>$model
                ];
            } 
            
        }
        return $res;
    }
     
}
