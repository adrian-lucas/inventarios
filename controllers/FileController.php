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
        
     return $behaviors;
    }

    public function beforeAction($action)
    {
        Yii::$app->response->format= \yii\web\Response::FORMAT_JSON;   


        $this->enableCsrfValidation=false;
        return parent::beforeAction($action);
    }

    public function actionSaveFile()
    {
        //$model = new Imagen();
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            
            $model->imageFile = UploadedFile::getInstanceByName('imageFile');
            
            if ($model->upload()) {
                return ['success'=>true,
                        'link'=> 'uploads/' . $model->imageFile->baseName . '.' . $model->imageFile->extension];
            }
        }
        return ['success'=>false];
    }
    public function actionIndex()
    {
        return $this->render('index');
    }

}
