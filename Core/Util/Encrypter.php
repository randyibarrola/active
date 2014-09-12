<?php
class Encrypter {
 
 
    public static function encrypt ($input, $Key) {
        $output = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($Key), $input, MCRYPT_MODE_CBC, md5(md5($Key))));
        return $output;
    }
 
    public static function decrypt ($input, $Key) {
        $output = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($Key), base64_decode($input), MCRYPT_MODE_CBC, md5(md5($Key))), "\0");
        return $output;
    }
 
}
?>