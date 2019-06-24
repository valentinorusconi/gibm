$(document).ready(function(){

    //Change Upload Field Label to tmp Filename
    $('#f_upload').on('change',function(){
        $('#file-upload-label').html('<i class="fas fa-upload"></i> '+$(this).val());
    });

    //Check if error-Message should be displayed
    var getError = getUrlParams(window.location.search);

    //Show error if exists
    if(getError['error'] == 1){
        $('#errorText').html('Your File was larger than '+getError['max_file']+'Bytes or not in the PNG/JPG format.');
        $('#errorAlert').slideDown('slow');
    } else if(getError['error'] > 1 && getError['error'] <=4){
        $('#errorText').html('An error occured. Please contact your Administrator. Error Id: ' + getError);
        $('#errorAlert').slideDown('slow');
    }

    $('.close').each(function(){
        $(this).click(function(event){
            event.preventDefault();
            $(this).parent().slideUp('fast');
        });
    })

});
