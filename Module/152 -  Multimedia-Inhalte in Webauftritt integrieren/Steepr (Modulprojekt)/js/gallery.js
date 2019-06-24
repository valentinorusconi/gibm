var searchQuest = '';
var currentSector = 1;

$(document).ready(function(){

    $('#currentSector').html(currentSector);

    //Previous Page Button
    $('#previousPage').click(function(event){
        event.preventDefault();
        currentSector = currentSector -1;
        if(currentSector < 1){currentSector = 1;};
        $('#currentSector').html(currentSector);
        search();
    });

    //Next Page Button
    $('#nextPage').click(function(event){
        event.preventDefault();
        currentSector = currentSector + 1;
        $('#currentSector').html(currentSector);
        search();
    });

    //Rate Image Button
    $('#m_ratePic').click(function(){
        $(this).removeClass('btn-warning');
        $('#mv_detailed').slideUp('fast');
        $('#mv_rate').slideDown('fast');
        $('#m_sendRating').attr('pictureID', $(this).attr('pictureID'));
        $('.rateStar').each(function(){
            $(this).removeClass('text-success').removeClass('fas').addClass('far');
        });
    });

    //Rating Animations
    var stars;
    $('.rateStar').each(function(){
        $(this).hover(function(){
            if(!$(this).hasClass('text-success')){
                $(this).removeClass('far').addClass('fas');
                $(this).prevAll().removeClass('far').addClass('fas');
                $(this).nextAll().removeClass('fas').addClass('far');
            }
        });
        $(this).mouseleave(function(){
            if(!$(this).hasClass('text-success')){
                $(this).removeClass('fas').addClass('far');
            }
        });
        $(this).click(function(){
            $(this).addClass('text-success');
            stars = ($(this).prevAll().length + 1);
            $(this).prevAll().addClass('text-success');
            $(this).nextAll().removeClass('text-success').addClass('far');
        });
    });

    //Submit Rating
    $('#m_sendRating').click(function(){

        var pictureID = $(this).attr('pictureID');

        $.ajax({
            method: "POST",
            url: "./call/rate.php",
            data: {pictureID:pictureID, stars:stars},
            success: function(data){
                if(data){
                    alert('Error while saving rating: ' + data);
                } else {
                    $('#m_ratePic').removeClass('btn-warning');
                    $('#mv_rate').slideUp('fast');
                    $('#mv_detailed').slideDown('fast');
                    buildModal(pictureID);
                }
            }
        });

    });

});

//Click on Picture
function buildModal(pictureID){

    get(pictureID, function(array){

        var imgDetails = (JSON.parse(array))[0];
        var imgTags = (JSON.parse(array))[1];

        $('#m_ratePic').attr('pictureID', pictureID);
        $('#m_titleHead').html(imgDetails['img_title']);
        $('#m_title').html(imgDetails['img_title']);
        $('#m_image').attr('src', 'include/img/useruploads/'+imgDetails['img_path_preview']);
        $('#m_description').html(imgDetails['img_description']);
        $('#m_views').html(imgDetails['views']);
        $('#m_rating_full').html(imgDetails['rating']);
        $('#m_date').html(imgDetails['created']);
        $('#m_downloadOriginal').attr('href', 'include/img/useruploads/'+imgDetails['img_path_full'])

        for (var i = 1; i <= 5 ; i++) {
            if(i <= Math.round(imgDetails['rating'])){
                if(Math.round(imgDetails['rating']) - imgDetails['rating'] <= 0.5 && i > imgDetails['rating']){
                    $('#faStar'+i).removeClass('far').addClass('fas').addClass('fa-star-half');
                } else {
                    $('#faStar'+i).removeClass('far').addClass('fas').addClass('fa-star');
                }
            } else {
                $('#faStar'+i).removeClass('fas').removeClass('fa-star-half').addClass('far').addClass('fa-star');
            }
        }

        var imageTagNames = '';
        for (var i = 0; i < imgTags.length ; i++) {
            if(imgTags[i]){
                imageTagNames = imageTagNames + imgTags[i]+' ';
            }
        }

        $('#m_tags').html(imageTagNames);
        $('#pictureModal').modal('show');

    });

}

//Get a pack of pictures, sector describes the current location (for pagination)
//One sector should equal 12 images
function search(){

    clearInterval(searchQuest);

    searchQuest = setInterval(function(){

        $('#galleryContainer').html("");
        console.log("Query: Find '"+key+"' ordered by '"+sorting+"'");

        //RETURN: 12 Picture (Thumbnail) Paths and their IDs (sorted)
        $.ajax({
            method: "POST",
            url: "./call/galery.php",
            data: {key:key, sorting:sorting, currentSector:currentSector},
            success: function(data){
                if(data.indexOf('!dbinit!') >= 0){
                    $('#successText').html('Database has been created. You should reload this page now.');
                    $('#successAlert').slideDown('slow');
                }
                buildGalery(JSON.parse(data));
            }
        });

        clearInterval(searchQuest);

    }, 500);

}

//Build Gallery IMG-Tags and add them to the content
function buildGalery(filesArray){

    var galleryContent = "";
    if(filesArray.length){

        galleryContent = "";
        var singleImg = "";

        $.get("./include/galeryEntry.html", function(data){

            for (var i = 0; i < filesArray.length; i++) {

                singleImg = data;
                singleImg = singleImg.replace('##IMAGEID##',filesArray[i][0]);
                singleImg = singleImg.replace('##SMALLIMAGE##',filesArray[i][1]);
                singleImg = singleImg.replace('##BIGIMAGE##',filesArray[i][2]);
                galleryContent += singleImg;

            }

            $('#galleryContainer').html(galleryContent);

        });

    } else {
        $('#galleryContainer').html('<div class="col-12 text-center"><p>No Pictures found.</p></div>');
    }

}

//Get a single picture by its ID
function get(pictureID, callback){

    //RETURN: 1 Picture (Preview) Path, title, tags and description.
    //Plus: Average Rating and Full Img Path for download.
    $.ajax({
        method: "POST",
        url: "./call/image.php",
        data: {pictureID:pictureID},
        success: function(data){
            if(data){
                if(data != -1){
                    callback(data);
                } else {

                }
            } else {

            }
        }
    });

}
