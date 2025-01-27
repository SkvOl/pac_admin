
window.onload = function() {
    $("#get_to_work").hover(function(){
        if($(this).hasClass("zoomed")) $(this).removeClass("zoomed");
        else $(this).addClass("zoomed");
    });

    lightbox.option({
        'resizeDuration': 200,
        'wrapAround': false,
        'showImageNumberLabel': false,
    });

    let tables_lang = {
        "decimal": ",",
        "thousands": " ",
        "lengthMenu": "Показывать _MENU_ записей",
        "zeroRecords": "Значение не найдено",
        "info": "Страница _PAGE_ из _PAGES_",
        "infoFiltered": "(найдено из _MAX_ записей)",
        "emptyTable": "Нет записей",
        "info": "Загружено _START_ - _END_ из _TOTAL_ записей",
        "infoEmpty": "Показано 0 из 0 записей",
        "infoPostFix": "",
        "loadingRecords": "Загрузка...",
        "processing": "Обработка...",
        "search": "Поиск:",
        "paginate": {
            "first": "Первая",
            "last": "Последняя",
            "next": "Следующая",
            "previous": "Предыдущая"
        },
        "aria": {
            "sortAscending": ": сортировать по возрастанию",
            "sortDescending": ": сортировать по убыванию"
        }
    };
    
    let table = $('.table-ships').DataTable({
        serverSide: true,
        processing: true,
        type: 'POST',
        ajax: "/ships",

        columns: [
            { data: 'id', name : 'id', width : '5%'},
            { data: 'title', name : 'title', width : '15%'},
            { data: 'description', name : 'description', width : '80%'},
        ],
        order: [[0, 'asc']],
        language: tables_lang,
        fixedHeader: true,
        initComplete: function(){
            console.log('c');
        }            
    });  



    $("#cabin-delete").on('click', function(){
        let cabin_id = $(this).attr('cabin-id'), ship_id = $(this).attr('ship-id');

        let data = {
            '_token': $("meta[name='csrf-token']").attr("content"),
        };

        $.ajax({
            url: '/cabinDelete/'+ cabin_id,
            method: 'delete',
            dataType: 'json',
            data: data,
            success: function(response){
                console.log('cabin delete');
                window.location = 'http://127.0.0.1/shipPreview/' + ship_id;
            }
        });
    });

    $("#ship-delete").on('click', function(){
        let ship_id = $(this).attr('ship-id');

        let data = {
            '_token': $("meta[name='csrf-token']").attr("content"),
        };

        $.ajax({
            url: '/shipDelete/' + ship_id,
            method: 'delete',
            dataType: 'json',
            data: data,
            success: function(response){
                console.log('ship delete');
                window.location = 'http://127.0.0.1/ships';
            }
        });
    });


    $(".save-change-ship").on('click', function(){
        let id = $(this).attr('id');

        let spec = [];
        for (let i = 0; i < 11; i++) {
            spec.push({
                'name': $('.ship_spec_name_' + i).text(),
                'value': $('.ship_spec_value_' + i).val()
            });
        }
        
        let data = {
            '_token': $("meta[name='csrf-token']").attr("content"),
            'title': $('.ship_title').val(),
            'description': $('.ship_description').val(),
            'spec':  JSON.stringify(spec)
        };

        $.ajax({
            url: '/editShip/'+id,
            method: 'patch',
            dataType: 'json',
            data: data,
            success: function(response){
                $(".title-ship-r").text(response['title']);
                $(".description-ship-r").html(response['description']);
                
                response['spec'].forEach(function(item, i) {
                    $(".spec-name-ship-r-" + i).text(item['name']);
                    $(".spec-value-ship-r-" + i).text(item['value']);
                });
            }
        });
    });

    $("#my-delete-icon-cabin").on('click', function(){
        let id = $(this).attr('key_id');
        
        $("#image-cabin-" + id).html('');
        $("#image-cabin-preview-" + id).remove()

        $(".carousel-item").each(function(key, item) {
            $(this).addClass('active');
        });
    })

    $(".my_delete_icon_ship").on('click', function(){
        let id = $(this).attr('key_id');

        $("#li-delete-image" + id).html('');
    })

    $(".save-change-cabin").on('click', function(){
        let id = $(this).attr('id'), srcs = [];

        $(".image-cabin").each(function(key, item) {
            srcs.push($(this).attr('src'));
        });
        
        let data = {
            '_token': $("meta[name='csrf-token']").attr("content"),
            'title': $('.cabin_title').val(),
            'description': $('.cabin_description').val(),
            'vendor_code': $('.cabin_vendor_code').val(),
            'type': $('.cabin_type').val(),
            'photos':  JSON.stringify(srcs)
        };

        $.ajax({
            url: '/editCabin/'+id,
            method: 'patch',
            dataType: 'json',
            data: data,
            success: function(response){
                $(".title-cabin-r").text(response['title']);
                $(".description-cabin-r").html(response['description']);
                $(".vendor_code-cabin-r").text(response['vendor_code']);
                $(".type-cabin-r").text(response['type']);
            }
        });
    });

    $('.button-save-image').on('click', function(){
        let arr = [], arr_id = [], ship_id = $('.sortable').attr('ship-id');

        $(".my_delete_icon_ship").each(function(key, item) {
            arr.push({
                "real_id": key, 
                "id":$(this).attr('id'),
                "key_id":$(this).attr('key_id'),
                "ordering":$(this).attr('ordering'),
            });

            arr_id.push($(this).attr('id'));
        });

        let data = {
            '_token': $("meta[name='csrf-token']").attr("content"),
            'data':  arr,
            'ids':  arr_id,
        };

        $.ajax({
            url: '/saveEditImage/' + ship_id,
            method: 'post',
            dataType: 'json',
            data: data,
            success: function(response){
                console.log('Successfuly');
                data={}; arr = []; arr_id=[];
            }
        });
    })


    $("#sortable").sortable();
    

    $('.addFile').on('change', function(){
        // console.log('dd');
        // $('.sortable').append('dd');
    })
}