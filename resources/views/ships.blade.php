<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Ships') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 table-pos bg-body rounded table-responsive">              
                    
                    <table class="table table-ships table-striped">
                        <thead class="table-light align-middle">
                            <tr>
                                <th scope="col">Ид</th>
                                <th scope="col">Имя</th>
                                <th scope="col">Описание</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>