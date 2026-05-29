<?php

if (! function_exists('captcha_image_path')) {
    function captcha_image_path()
    {
        $legacyDir = dirname(base_path()).'/assets/images';
        if (is_writable($legacyDir)) {
            return $legacyDir.'/capcha_code.png';
        }

        $storageDir = storage_path('app');
        if (! is_dir($storageDir)) {
            mkdir($storageDir, 0775, true);
        }

        return $storageDir.'/capcha_code.png';
    }
}
