<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Cabin preview') }}
        </h2>
    </x-slot>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:pb-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="pb-6 text-gray-900">
                    <div id="carouselExampleControls" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            @foreach ($cabin['cabin_categories']['photos'] as $key=>$item)
                                <div id="image-cabin-preview-{{ $key }}" class="carousel-item @if($key == 0) active @endif">
                                    <img src="{{$item}}" class="d-block w-100" alt="{{$item}}">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h1 class="title-cabin-r">{{  '№ '.$cabin['number']. '. ' .$cabin['cabin_categories']['title'] }}</h1>
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
                            <h1 class="title-cabin-r" style="font-weight: bolder;">{{  '№ '.$cabin['number']. '. ' .$cabin['cabin_categories']['title'] }}</h1>
                        </div>
                        <div class="mb-3 description-cabin-r">
                            {!! $cabin['cabin_categories']['description'] !!}
                        </div>
                        <div class="mt-1 mb-3">
                            <h3 style="font-weight: bolder;">Комфортабельность:</h3>
                            <div class="mb-3 vendor_code-cabin-r">
                                {!! $cabin['cabin_categories']['vendor_code'] !!}
                            </div>
                            <h3 style="font-weight: bolder;">Тип:</h3>
                            <div class="mb-3 type-cabin-r">
                                {!! $cabin['cabin_categories']['type'] !!}
                            </div>
                        </div>

                        <div class="d-flex flex-row-reverse bd-highlight me-2 mt-2 mb-2 p-1">
                            <button id="2" type="button" class="btn btn-outline-primary me-1" data-bs-toggle="modal" data-bs-target="#cabinEditModal">Изменить</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('cabinEditModal')
</x-app-layout>