<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit image') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:pb-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="pb-6 text-gray-900">
                    <div class="mt-5">
                        <ul id="sortable" class="sortable" ship-id="{{$images[0]->ship_id}}">
                            @foreach($images as $key=>$image)
                                <li id="li-delete-image{{$key}}" class="ui-state-default">
                                    <div class="w-100 m-2" stile="height:111px;">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col h-100 p-0 my-img-wrap" style="width:30%;">
                                                    <button id="{{$image->id}}" ordering="{{$image->ordering}}" key_id="{{$key}}" type="button" class="btn btn-danger btn-sm my-delete-icon my_delete_icon_ship">&#215;</button>    
                                                    <img src="{{$image->url}}" class="d-block gal" alt="{{$image->url}}">
                                                </div>
                                                <div class="col align-top m-2" style="width:65%;">
                                                    <h3 class="" style="font-weight: bolder;">Описание:</h3><br>
                                                    <label class="mass-text-in-table-10">{!! $image->ship->description !!}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>

                    <div class="position-relative m-5">
                        <div class="m-3 position-absolute bottom-0 end-0">
                            <button type="button" class="btn btn-primary button-upload-image" data-bs-toggle="modal" data-bs-target="#imageLoadModal">Загрузка изображения</button>  
                            <button type="button" class="btn btn-primary button-save-image">Сохранить</button>  
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('imageLoadModal')
</x-app-layout>
