<?php
 
    // Collect the data from the form.
    $full_name = htmlspecialchars($_POST["full-name"]);
    $email = htmlspecialchars($_POST["email"]);
    $website = htmlspecialchars($_POST["website"]);
    $company = htmlspecialchars($_POST["company"]);
    $country = htmlspecialchars($_POST["country"]);
    $message = htmlspecialchars($_POST["message"]);

    // Paste your mail here.
    $myemail = "mail@example.com";
 
    // Setting a content type.
    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html; charset=utf-8";
   
    // The message title which will be displayed in your mail box.
    $subject = "New message from VSDocs!";

    // Get the HTML template
    $html_template = file_get_contents('../mail-template-contacts.html');


    // Injecting variables in the HTML template
    $html_template = str_replace('<% fullName %>', $full_name, $html_template);
    $html_template = str_replace('<% email %>', $email, $html_template);
    $html_template = str_replace('<% website %>', $website, $html_template);
    $html_template = str_replace('<% company %>', $company, $html_template);
    $html_template = str_replace('<% country %>', $country, $html_template);
    $html_template = str_replace('<% message %>', $message, $html_template);
   
    // Send the mail.
    mail($myemail, $subject, $html_template, $headers);

?>