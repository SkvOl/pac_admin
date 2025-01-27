
<div class="modal fade" id="cabinEditModal" tabindex="-1" aria-labelledby="cabinEditModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-c-card-modal">
            <div class="modal-header">
                <h5 class="modal-title" id="cabinEditModalLabel">Изменение категории кабины</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="get" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="name" class="form-label">Заголовок</label>
                        <input type="text" name="name" class="form-control cabin_title" id="change_cabin_title_{{$cabin['cabin_categories']['id']}}" value="{{$cabin['cabin_categories']['title']}}">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Описание</label>
                        <textarea name="description" class="form-control cabin_description" id="change_cabin_description_{{$cabin['cabin_categories']['id']}}" rows="5">{{$cabin['cabin_categories']['description']}}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Комфортабельность</label>
                        <input type="text" name="name" class="form-control cabin_vendor_code" id="change_cabin_vendor_code_{{$cabin['cabin_categories']['id']}}" value="{{$cabin['cabin_categories']['vendor_code']}}">
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Тип</label>
                        <input type="text" name="name" class="form-control cabin_type" id="change_cabin_type_{{$cabin['cabin_categories']['id']}}" value="{{$cabin['cabin_categories']['type']}}">
                    </div>
                    <div class="mb-3">
                        @foreach ($cabin['cabin_categories']['photos'] as $key=>$item)
                            <div id="image-cabin-{{ $key }}" class="my-img-wrap mb-2" style="height:30; width:30;">
                                <button id="my-delete-icon-cabin" key_id="{{ $key }}" type="button" class="btn btn-danger btn-sm my-delete-icon">&#215;</button>
                                <img src="{{$item}}" class="d-block w-100 image-cabin" alt="{{$item}}">
                            </div>
                        @endforeach
                    </div>

                    <a type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Закрыть</a>
                    <a id="cabin-delete" cabin-id="{{$cabin['id']}}" ship-id="{{$cabin['ship_id']}}" class="btn btn-outline-primary delete-cabin">Удалить комнату</a>
                    <a type="button" id="{{$cabin['cabin_categories']['id']}}" class="btn btn-primary save-change-cabin" data-bs-dismiss="modal">Сохранить</a>
                </form>
            </div> 
        </div>
    </div>
</div>