<?php

namespace app\controllers;
use Yii;
use app\models\Usuario;
use yii\db\IntegrityException;
use Exception;
class UserController extends \yii\web\Controller
{
    public function behaviors()
    {
    $behaviors = parent::behaviors();
    $behaviors['verbs'] = [
        'class' => \yii\filters\VerbFilter::class,
        'actions' => ['register'=>['post'],
                      'login'=>['post'], 
                      'create-permission'=>['post'],
                      'create-role'=>['post'],
                      'assing-role'=>['post'],
                    ],
        ];
     
    $behaviors['authenticator'] = [         	
    'class' => \yii\filters\auth\HttpBearerAuth::class,         	
    'except' => ['options','login','create-role','create-permission','assing-role','init']     	
    ]; 
    $behaviors['access'] = [         	
        'class' => \yii\filters\AccessControl::class,
        'only' => ['register'], 
        'except' => [],	
        'rules' => [
            [
            'allow' => true, 
            'actions' => ['register'], 
            'roles' => ['SuperAdmin'] 
            ],
            [
            'allow' => true, 
            'actions' => ['acciones'], 
            'matchCallback' => function ($rule, $action) {     
            return true;
            }
            ],
            [
            'allow' => true, 
            'actions' => ['acciones'], 
            'matchCallback' => function ($rule, $action) {
                return Yii::$app->user->identity ? true : false;
                }
            ],
        ],
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
        $body = Yii::$app->getRequest()->getBodyParams();
        $role = isset($body['role'])?$body['role']:null;
        $resRegisterUser = $this->actionRegisterUser($body);
        if($resRegisterUser['success']){
            $user = $resRegisterUser['data'];
            $resAssingRole = $this->actionAssingRole($user->id,$role);
            if($resAssingRole['success']){
                Yii::$app->getResponse()->setStatusCode(201);
                $res = [
                    'succes'=>true,
                    'message'=>'Usuario registrado con exito',
                    'data'=>[
                        'nombres'=>$user->nombres,
                        'username'=>$user->username,
                        'role'=>$role
                    ]
                ];
            }else{
              $res = $this->actionDelete($user->id);
            }
        }else{
            $res = $resRegisterUser;
        }
        return $res;
    }
    private function actionRegisterUser($body)
    {
        $res = [];
        $password = isset($body['password'])?$body['password']:null;
        $passwordHash = Yii::$app->getSecurity()->generatePasswordHash($password);
        $accessToken = Yii::$app->security->generateRandomString();

        $model = new Usuario();
        $model->load($body,'');
        $model->password_hash = $passwordHash;
        $model->access_token = $accessToken;
        if($model->save()){
           // Yii::$app->getResponse()->setStatusCode(201);
            $res=[
                'success'=>true,
                'message'=>'Nuevo usuario registrado',
                'data'=>$model
            ];
        }else{
            Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
            $res=[
                'success'=>false,
                'message'=>'El usuario no pudo ser registrado',
                'data'=>$model->errors,
            ];
        }

        return $res;
    }
    private function actionAssingRole($userId,$userRole)
    {
        $res = [];
        $auth = Yii::$app->authManager;
        $role = $auth->getRole($userRole);

        if($role != null){
            try{
                $auth->assign($role, $userId);
            }catch(Exception $e){
                $res = [
                    'success'=>false,
                    'message'=>'Usuario y rol se asignaron anteriormente',
                ];
            }
            $res = [
                'success'=>true,
                'message'=>'Usuario y rol se asignaron correctamente',
            ];
        }else{
            $res = [
                'success'=>false,
                'message'=>'Rol inexistente',
            ];
        }
        return $res;
    }

    private function actionDelete($id)
    {   
        $res = [];
        $model = Usuario::findOne($id);
        if($model != null){
            try{
                $model->delete();
                $res = [
                    'success'=>true,
                    'message'=>'Usuario eliminado',
                    'data'=>$model, 
                ];
            }catch(IntegrityException $ie){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'success'=>false,
                    'message'=>'El usuario se encuentra en uso',
                    'error'=>$ie->getMessage(),
                ];
    
            }catch(Exception $e){
                Yii::$app->getResponse()->setStatusCode(500);
                $res = [
                    'success'=>false,
                    'message'=>'Usuario no eliminado',
                    'error'=>$e->getMessage(),
                ];
            }
        }else{
            Yii::$app->getResponse()->setStatusCode(404);
            $res = [
                'success'=>false,
                'message'=>'Usuario no eliminado',
                'error'=>'Usuario con id: '.$id.' inexistente',
            ];
        }

        return $res;       
    }

    public function actionLogin(){
        $res =[];
        $auth = Yii::$app->authManager;
        $body = Yii::$app->getRequest()->getBodyParams();
        $password = isset($body['password'])?$body['password']:null;
        $username = isset($body['username'])?$body['username']:null;
        $model = Usuario::find()->where(['username'=>$username])->one();
       // return $body;
        if($model){
            $correcto = Yii::$app->security->validatePassword($password,$model->password_hash);
            if($correcto){
                $res=[
                    'success'=>true,
                    'message'=>'Verificacion exitosa',
                    'data'=>[
                        'access_token'=>$model->access_token,
                        'userInfo'=>[
                            'nombres'=>$model->nombres,
                            'username'=>$model->username,
                            'role'=> array_keys($auth->getRolesByUser($model->id))[0],
                        ]
                    ]
                ];
                
            }else{
                Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
                $res=[
                    'success'=>false,
                    'message'=>'Datos incorrectos',
                ];
            }
        }else{
            Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
            $res=[
                'success'=>false,
                'message'=>'Datos incorrectos',
            ];
        }
        return $res;
    }
    
    
    public function actionIndex()
    {
        return $this->render('index');
    }

}
