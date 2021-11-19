@extends('backend.layouts.app')

@section('domain_name', app_name() . ' | ' . __('labels.backend.access.domains.management'))

@section('breadcrumb-links')
@include('backend.domains.includes.breadcrumb-links')
@endsection

@section('content')
<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-5">
                <h4 class="card-title mb-0">
                    {{ __('labels.backend.access.domains.management') }} <small class="text-muted">{{ __('labels.backend.access.domains.active') }}</small>
                </h4>
            </div>
            <!--col-->
        </div>
        <!--row-->

        <div class="row mt-4">
            <div class="col">
                <div class="table-responsive">
                    <table id="domains-table" class="table" data-ajax_url="{{route("admin.domains.get") }}">
                        <thead>
                            <tr>
                                <th>Domain Name</th>
                                <th>Domain Url</th>
                                <th data-orderable="false">Status</th>
                                <th>{{ trans('labels.backend.access.domains.table.createdat') }}</th>
                                <th>{{ trans('labels.general.actions') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--col-->
        </div>
        <!--row-->

    </div>
    <!--card-body-->
</div>
<!--card-->
@endsection

@section('pagescript')
<script>
    FTX.Utils.documentReady(function() {
        FTX.Domains.list.init();
    });
</script>
@endsection