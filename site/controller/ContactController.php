<?php 
class ContactController {
    function form() {
        require "view/contact/form.php";
    }

    function send() {
        // send email to shop owner
        $mailService = new MailService();
        $to = SHOP_OWNER;
        $subject = "Shop_LV: Khách hàng liên hệ";
        $site = get_domain();
        $name = $_POST["name"];
        $email = $_POST["email"];
        $mobile = $_POST["mobile"];
        $message = $_POST["message"];
        $content = "
        Hi shop owner, <br>
        Customer contact info: <br>
        Name: $name <br>
        Email: $email <br>
        Mobile: $mobile <br>
        Message: $message <br>
        ========xxx======== <br>
        Sent from: $site
        ";
        $mailService->send($to, $subject, $content);
    }
}
?>