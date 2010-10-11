

$(document).ready(function() {
    var $students_list=$('.students-list');
    var class_id=$('#config p[title="object_id"]').text();
    var email_subject=$('#config p[title="email_subject"]').text();
    $students_list.classint({
        isTeacher:true,
        classId:class_id,
        emailSubject:email_subject
    });

});