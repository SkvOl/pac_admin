<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Ship preview') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:pb-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="pb-6 text-gray-900">
                    <div id="carouselExampleControls" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            @foreach ($ship->ShipsGallery as $key=>$item)
                                <div class="carousel-item @if($key == 0) active @endif">
                                    <img src="{{$item->url}}" class="d-block w-100" alt="{{$item->url}}">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h1 class="title-ship-r">{{ $ship->title }}</h1>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Предыдущий</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Следующий</span>
                        </button>
                    </div>
                    <div class="mt-5 px-6">
                        <div class="mb-3">
                            <h1 class="title-ship-r" style="font-weight: bolder;">{{ $ship->title }}</h1>
                        </div>
                        <div class="mb-3 description-ship-r">
                            {!! $ship->description !!}
                        </div> 
                            
                        <div class="mt-1 mb-3">
                            <h3 style="font-weight: bolder;">Каюты:</h3>
                            <div class="mt-1">
                                @foreach ($ship->CabinCategories as $key=>$item)
                                    <p class="mb-2">
                                        <button class="btn bg-gray-100 btn-light" type="button" data-bs-toggle="collapse" data-bs-target="#shipCabinCategories_{{$key}}" aria-expanded="false" aria-controls="shipCabinCategories_{{$key}}" style="width: 500px">
                                            {{ $item['title'] }} ({{$item['vendor_code']}}) 
                                        </button>
                                    </p>
                                    <div class="collapse mb-2" id="shipCabinCategories_{{$key}}">
                                        <div class="card card-body">
                                            <h5 style="font-weight: bolder;">Номера:</h5>
                                            @foreach ($item['Cabin'] as $key1=>$item1)
                                                <a class="mt-1 btn btn-primary" href="{{route('cabinPreview', ['id'=>$item1->id])}}" style="width: 50px">{{ $item1->number }}</a>
                                            
                                                @if ($key1 === 19) <br> @endif
                                            @endforeach
                                            <h5 class="mt-5" style="font-weight: bolder;">Тип:</h5>
                                            <span>
                                                {{ $item['type'] }}
                                            </span>
                                            <h5 class="mt-3" style="font-weight: bolder;">Описание:</h5>
                                            <div class="mt-1 px-6">
                                                {!! $item['description'] !!}
                                            </div>
                                            <div class="mt-3 px-6 d-flex justify-content-center container">
                                                @if(count($item['photos']) < 3) <div class="row row-cols-{{count($item['photos'])}}"> 
                                                @else <div class="row row-cols-3"> @endif
                                                    @foreach ($item['photos'] as $key1=>$item1)
                                                        <div class="col mt-2">
                                                            <a href="{{$item1}}" data-lightbox="image-{{$key1}}" data-title="{{ $item['title'] }}">
                                                                <img id="{{$key1}}" src="{{$item1}}" width="400" height="267" hspace="10" align="left" alt="" style="margin-right: 15px;" title="{{ $item['title'] }}">    
                                                            </a>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>        
                        </div>

                        <div class="mt-5 mb-3">
                            <table class="table table-responsive caption-top">
                                <caption><h3 style="font-weight: bolder;">Техническая информация:</h3></caption>
                                <thead>
                                    <tr>
                                        @foreach ($ship->spec as $key=>$item)
                                            <th class="td-spec" scope="col"><small class="spec-name-ship-r-{{$key}}">{{ $item['name'] }}</small></th>
                                        @endforeach
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        @foreach ($ship->spec as $key=>$item)
                                            <th class="td-spec" scope="col"><small class="spec-value-ship-r-{{$key}}">{{ $item['value'] }}</small></th>
                                        @endforeach
                                    </tr>
                                </tbody>
                            </table>   
                        </div>

                        <div class="d-flex flex-row-reverse bd-highlight me-2 mt-2 mb-2 p-1">
                            <a href="{{route('editImage', ['id'=>$ship->id])}}" class="btn btn-outline-primary me-1">Изменить изображения</a>    
                            <button id="2" type="button" class="btn btn-outline-primary me-1" data-bs-toggle="modal" data-bs-target="#shipEditModal">Изменить</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('shipEditModal')
</x-app-layout>
