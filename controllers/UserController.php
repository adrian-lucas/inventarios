<?php

namespace app\controllers;
use Yii;
use app\models\Usuario;
use yii\rbac\ManagerInterface;
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
    'except' => ['options','login','create-role','create-permission','assing-role']     	
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
        $password = isset($body['password'])?$body['password']:null;
        $passwordHash = Yii::$app->getSecurity()->generatePasswordHash($password);
        $accessToken = Yii::$app->security->generateRandomString();

        $model = new Usuario();
        $model->load($body,'');
        $model->password_hash = $passwordHash;
        $model->access_token = $accessToken;
        if($model->save()){
            Yii::$app->getResponse()->setStatusCode(201);
            $res=[
                'succes'=>true,
                'message'=>'Nuevo usuario registrado',
                'data'=>[],
            ];
        }else{
            Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
            $res=[
                'succes'=>false,
                'message'=>'El usuario no pudo ser registrado',
                'data'=>$model->errors,
            ];
        }

        return $res;
    }

    public function actionLogin(){
        $res =[];
        $body = Yii::$app->getRequest()->getBodyParams();
        $password = isset($body['password'])?$body['password']:null;
        $username = isset($body['username'])?$body['username']:null;
        $model = Usuario::find()->where(['username'=>$username])->one();
       // return $body;
        if($model){
            $correcto = Yii::$app->security->validatePassword($password,$model->password_hash);
            if($correcto){
                $res=[
                    'succes'=>true,
                    'message'=>'Verificacion exitosa',
                    'acces_token'=>$model->access_token,
                ];
                
            }else{
                Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
                $res=[
                    'succes'=>false,
                    'message'=>'Datos incorrectos',
                ];
            }
        }else{
            Yii::$app->getResponse()->setStatusCode(422,'Data validation failed');
            $res=[
                'succes'=>false,
                'message'=>'Datos incorrectos',
            ];
        }
        return $res;
    }
    public function actionCreateRole()
    {
        $auth = Yii::$app->authManager;
        $role = $auth->createRole(Yii::$app->getRequest()->getBodyParam('role'));
        $auth->add($role);
        return $role;

    }
    public function actionCreatePermission()
    {
        $auth = Yii::$app->authManager;
        $permission = $auth->createPermission(Yii::$app->getRequest()->getBodyParam('permission'));
        $auth->add($permission);
        return $permission;
    }
    public function actionAssingRole()
    {
        $auth = Yii::$app->authManager;
        $role = $auth->getRole('Espectador');
        $auth->assign($role, 11);
        return $role;
    }
    

    public function actionIndex()
    {
        return $this->render('index');
    }

}
