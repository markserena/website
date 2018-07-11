+++
date = "2016-11-06T13:00:25+05:30"
title = "Get in touch"
+++

<form id="contactform" action="//formspree.io/mark@markserena.com.au" method="POST">
    Name (Required)   
    <input type="text" name="name" placeholder="Your name">   
    Email (Required)    
    <input type="email" name="_replyto" placeholder="Your email">   
    Message (Required)   
    <textarea name="message" placeholder="Your message"></textarea>   
    <input type="submit" value="Send">
    <input type="hidden" name="_next" value="thanks" />
</form>
<script>
    var contactform =  document.getElementById('contactform');
    contactform.setAttribute('action', '//formspree.io/' + 'mark' + '@' + 'markserena' + '.' + 'com' + '.' + 'au');
</script>