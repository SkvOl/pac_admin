<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;
use App\Models\CabinCategories;
use Illuminate\Http\Request;
use App\Models\ShipsGallery;
use App\Models\Cabin;
use App\Models\Ship;

class ShipController extends Controller
{
    /**
     * Получение списка кораблей
     *
     * @param Request $request
     * @return view
     */
    public function list(Request $request)
    {
        if ($request->ajax()) {
            if(isset($request->order)){
                session(['name'=>$request->order[0]['name']]);
                session(['dir'=>$request->order[0]['dir']]);
            }
            else{
                session(['dir'=>'asc']);
            }
            session(['count'=>Ship::count()]); 
            
            $data = Ship::whereRaw('CONCAT(id, COALESCE(title, ""), COALESCE(description, "")) LIKE "%'.$request->search['value'].'%"')->
            orderBy(session('name'), session('dir'))->
            skip($request->start)->take($request->length)->get();
    
            foreach($data as &$item){
                $id = $item['id'];

                $item['title'] = '<a class="link-in-table" href="/shipPreview/'.$id.'">'.$item['title'].'</a>';
                $item['description'] = '<a class="link-in-table" href="/shipPreview/'.$id.'"><div class="mass-text-in-table">'.strip_tags($item['description']). '</div></a>';
            }
    
            return Datatables::of($data)->
            rawColumns(['id', 'title', 'description'])->
            setFilteredRecords(session('count'))->
            setTotalRecords(session('count'))->
            skipPaging()->make(true);
        }
        
        return view('ships');
    }

    /**
     * Получение страницы preview для корабля
     *
     * @param string $id
     * @return view
     */
    public function preview(string $id)
    {
        $ship = Ship::with(['ShipsGallery', 'CabinCategories.Cabin'])->where('id', $id)->get()[0];

        $ship->spec = json_decode($ship->spec, true);
        
        foreach($ship->CabinCategories as $key=>&$item){
            $item->photos = json_decode($item->photos, true);
        }

        return view('shipPreview', ['ship'=>$ship]);
    }

    /**
     * Изменение данных корабля
     *
     * @param Request $request
     * @param string $id
     * @return array
     */
    public function edit(Request $request, string $id)
    {
        $request = $request->all(['title', 'description', 'spec']);
        Ship::where('id', $id)->update($request);

        $request['spec'] = json_decode($request['spec'], true);
        return $request;
    }

    /**
     * Удаление данных
     *
     * @param string $id
     * @return string
     */
    public function delete(string $id)
    {
        DB::transaction(function() use ($id) {
            $ship = Ship::find($id);

            CabinCategories::where('ship_id', $ship->id)->delete();
            ShipsGallery::where('ship_id', $ship->id)->delete();
            Cabin::where('ship_id', $ship->id)->delete();

            $flag = $ship->delete();
        });

        return $id;
    }
}
