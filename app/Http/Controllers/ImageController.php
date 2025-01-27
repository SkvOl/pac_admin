<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\ShipsGallery;
use Illuminate\Http\Request;

class ImageController extends Controller
{

    /**
     * Полчение страныцы с изменениями изображений
     *
     * @param string $id
     * @return view
     */
    public function preview(string $id)
    {
        $images = ShipsGallery::with('Ship')->where('ship_id', $id)->orderBy('ordering')->get();

        return view('editImage', ['images'=>$images]);
    }

    /**
     * Изменение данных изображений
     *
     * @param Request $request
     * @param string $id
     * @return bool
     */
    public function edit(Request $request, string $id)
    {
    
        DB::transaction(function() use ($id, $request) {
            $ids = ShipsGallery::select('id')->where('ship_id', $id)->get()->toArray();
            $idsNormal = array_column($ids, 'id');

            $request = $request->all('data', 'ids');
        
            foreach($idsNormal as $key=>$item){
                if(in_array($item, $request['ids']))
                {
                    $realKey = self::find($request['data'], $item);
                    ShipsGallery::where('id', $item)->
                    update(['ordering'=>($request['data'][$realKey]['real_id'] + 1)]);
                }
                else{
                    ShipsGallery::where('id', $item)->delete();
                }
            }         
        });
        
        return true;
    }

    /**
     * Находит верхний ключ по значению и ключу элемента
     *
     * @param array $array
     * @param any $value
     * @param string $key_init
     * @return integer|boolean
     */
    private static function find(array $array, $value, string $key_init = 'id'): int|bool 
    {
        foreach($array as $key=>$item){
            if($item[$key_init] == $value){
                return $key;
            }
        }

        return false;
    }
}