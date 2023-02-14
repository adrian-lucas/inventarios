<?php
namespace app\commands;

use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;
        //Asigna al rol Espectador el permiso visualizarDatos
        $espectadorRole = $auth->getRole('Espectador');
        $permission = $auth->getPermission('visualizarDatos');
        $auth->addChild($espectadorRole,$permission);
        //Asigna al rol Admin los permisos de crear,eliminar y actualizarProductos
        $adminRole = $auth->getRole('Admin');
        $permission = $auth->getPermissions(['crearProducto,eliminarProducto,actualizarProducto']);
        $auth->addChild($adminRole,$permission);
        //Asigna al rol SuperAdmin el permiso de crearUsuario y los roles de los demas usuarios
        $superAdminRole = $auth->getRole('SuperAdmin');
        $permission = $auth->getPermission('crearUsuario');
        $auth->addChild($superAdminRole,$permission);
        $auth->addChild($superAdminRole,$espectadorRole);
        $auth->addChild($superAdminRole,$adminRole);
    }
}