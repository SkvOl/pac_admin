<div class="modal fade" id="imageLoadModal" tabindex="-1" aria-labelledby="imageLoadModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-c-card-modal">
            <div class="modal-header">
                <h5 class="modal-title" id="imageLoadModalLabel">Загрузка изображения</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="get" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="formFile" class="form-label ">Изображение</label>
                        <input class="form-control addFile" type="file" id="formFile">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Описание</label>
                        <textarea name="description" class="form-control image_upload_description" id="image_upload_description" rows="5"></textarea>
                    </div>

                    <a type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Закрыть</a>
                    <a type="button" class="btn btn-primary save_image_upload" data-bs-dismiss="modal">Сохранить</a>
                </form>
            </div> 
        </div>
    </div>
</div>