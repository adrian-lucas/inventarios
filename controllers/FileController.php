<?php

namespace app\controllers;
use Yii;
use app\models\Imagen;
use app\models\UploadForm;
use yii\web\UploadedFile;

class FileController extends \yii\web\Controller
{
    public function behaviors()
    {
    $behaviors = parent::behaviors();
    $behaviors['verbs'] = [
        'class' => \yii\filters\VerbFilter::class,
        'actions' => ['save-file'=>['post'],                    
                     ]
     ];
    $behaviors['authenticator'] = [         	
    'class' => \yii\filters\auth\HttpBearerAuth::class,         	
    'except' => ['options','save-file'],     	
    ];
    $behaviors['access'] = [         	
        'class' => \yii\filters\AccessControl::class,
        'only' => ['register','remove','view-pagination','change-data'], 
        'except' => [],	
        'rules' => [
            [
            'allow' => true, 
            'actions' => ['register','change-data','remove'], 
            'roles' => ['Admin'] 
            ],
            [
                'allow' => true, 
                'actions' => ['view-pagination'], 
                'roles' => ['Espectador'] 
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

    public function actionSaveFile()
    {
        //$model = new Imagen();
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            $model->imageFile = UploadedFile::getInstanceByName('imageFile');
            //return $model->imageFile;
            if ($model->upload()) {   
                Yii::$app->getResponse()->setStatusCode(201);           
                return ['success'=>true,
                        'link'=> 'uploads/' . $model->imageFile->baseName . '.' . $model->imageFile->extension
                ];
            }
        }
        Yii::$app->getResponse()->setStatusCode(422);   
        return ['success'=>false];
    }
    public function actionIndex()
    {
        return $this->render('index');
    }

}
