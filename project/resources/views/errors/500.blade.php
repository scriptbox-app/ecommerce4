@php
    $actual_path = str_replace('project', '', base_path());
@endphp

@if (is_dir($actual_path . '/install'))
    <meta http-equiv="refresh" content="0;url={{ url('/install') }}" />
@else
    @php
        header('HTTP/1.1 500 Internal Server Error');
        if (config('app.debug')) {
            $ex = $exception ?? null;
            if ($ex instanceof \Throwable) {
                throw $ex;
            }
            echo '<h1>Application Error</h1><pre>' . e($message ?? 'Unknown error') . '</pre>';
            exit;
        }
    @endphp
    <h2>500 Internal server error!</h2>
    <p>Check <code>project/storage/logs/laravel.log</code> or set <code>APP_DEBUG=true</code> in <code>project/.env</code>.</p>
@endif
