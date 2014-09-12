<?php

include_once dirname(__FILE__) . '/../Lib/phpmailer/class.phpmailer.php';

class Core_Mailer {

    protected $_template = false;
    protected $_mailer = false;

    function __construct(Core_template $template = null) {
        $this->_template = $template;
    }

    public function send_email($to, $subject, $message = false, $attachment = false, $configs = array()) {
        if ($to && filter_var($to, FILTER_VALIDATE_EMAIL)) {
            $mail = $this->mailer();
            error_log(print_r($to,true));
            $mail->AddAddress($to);
            $mail->Subject = $subject;
            if ($message) {
                $mail->MsgHTML($message);
                
            } else if ($this->_template) {
                $mail->IsHTML(true);
                $mail->MsgHTML($this->_template->getContent());
                
            }
            if($attachment) {
                $filename = explode('/', $attachment);
                $filename = $filename[count($filename) - 1];
                $mail->AddAttachment($attachment, $filename);
            }
            if(count($configs)) {
                if($configs['reply-to']) {
                    //$mail->ClearReplyTos();
                    if(is_array($configs['reply-to']) && count($configs['reply-to']) > 1) {
                        $replyTo = $configs['reply-to'][0];
                        $name = $configs['reply-to'][1];
                        $mail->AddReplyTo($replyTo, $name);
                    } else {
                        $mail->AddReplyTo($configs['reply-to']);
                    }                    
                }
            }
            if($mail->Send()) {
                $mail->ClearAddresses();
                return true;
            } else {
                $mail->ClearAddresses();
                error_log($mail->ErrorInfo);
                return false;
            }
        } else {
            return false;
        }
    }

    protected function mailer() {
        if (!$this->_mailer) {
            $mail = new PHPMailer();
            $mail->CharSet = "UTF-8";
            $mail->Mailer = "smtp";
            $mail->SMTPAuth = true;
            $mail->SMTPSecure = "ssl";
            $this->config_mailer($mail);

            $this->_mailer = $mail;
        }
        return $this->_mailer;
    }

    protected function config_mailer($mailer) {
        $mailer->Host = trim('smtp.gmail.com');
        $mailer->Port = 465;
        $mailer->Username = trim('reyniergt@gmail.com');
        $mailer->Password = trim('t1t0yt1t4');

        $mailer->setFrom('reyniergt@gmail.com', 'VikaHotel');
        $mailer->FromName = trim('VikaHotel');
    }


}

?>