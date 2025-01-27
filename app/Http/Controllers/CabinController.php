<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\CabinCategories;
use Illuminate\Http\Request;
use App\Models\Cabin;

class CabinController extends Controller
{

    /**
     * Формирует страницу с preview кабины
     *
     * @param string $id
     * @return view
     */
    public function preview(string $id)
    {
        $cabin = Cabin::with(['CabinCategories'])->where('id', $id)->get()->toArray()[0];

        $cabin['cabin_categories']['photos'] = json_decode($cabin['cabin_categories']['photos'], true);

        return view('cabinPreview', ['cabin'=>$cabin]);
    }

    /**
     * Изменяет данные кабины
     *
     * @param Request $request
     * @param string $id
     * @return array
     */
    public function edit(Request $request, string $id)
    {
        $request = $request->all(['title', 'description', 'vendor_code', 'type', 'photos']);
        CabinCategories::where('id', $id)->update($request);

        return $request;
    }

    /**
     * Удаление кабины
     *
     * @param string $id
     * @return string
     */
    public function delete(string $id)
    {
        DB::transaction(function() use ($id) {
            $cabin = Cabin::find($id);

            CabinCategories::where('id', $cabin->category_id)->delete();
            $flag = Cabin::where('id', $id)->delete();
        });

        return $id;
    }
}