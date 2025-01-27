
<div class="modal fade" id="shipEditModal" tabindex="-1" aria-labelledby="shipEditModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-c-card-modal">
            <div class="modal-header">
                <h5 class="modal-title" id="shipEditModalLabel">Изменение данных карабля</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="get" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="name" class="form-label">Заголовок</label>
                        <input type="text" name="name" class="form-control ship_title" id="change_ship_title_{{$ship->id}}" value="{{$ship->title}}">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Описание</label>
                        <textarea name="description" class="form-control ship_description" id="change_ship_description_{{$ship->id}}" rows="5">{{$ship->description}}</textarea>
                    </div>
                    @foreach ($ship->spec as $key=>$item)
                        <div class="mb-3">
                            <label for="spec{{$key}}" class="form-label ship_spec_name_{{$key}}">{{ $item['name'] }}</label>
                            <input type="text" name="spec{{$key}}" class="form-control ship_spec_value_{{$key}}" id="change_ship_spec_{{$ship->id}}_{{$key}}" value="{{ $item['value'] }}">
                        </div>
                    @endforeach

                    <a type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Закрыть</a>
                    <a id="ship-delete" ship-id="{{$ship->id}}" class="btn btn-outline-primary delete-ship">Удалить корабль</a>
                    <a type="button" id="{{$ship->id}}" class="btn btn-primary save-change-ship" data-bs-dismiss="modal">Сохранить</a>
                </form>
            </div> 
        </div>
    </div>
</div>