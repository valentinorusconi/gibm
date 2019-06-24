/** global: key */
/** global: sorting */
var key = "";
var sorting = "";

$(document).ready(function(){

    //Check if success-Message should be displayed and do so
    if(getUrlParams(window.location.search)['success'] == 1){
        $('#successText').html('You file has been successfully uploaded!');
        $('#successAlert').slideDown('slow');
        $('.close').each(function(){
            $(this).click(function(event){
                event.preventDefault();
                $(this).parent().slideUp('fast');
            });
        })
    }

    //Load Most recent Uploads on Startup
    search("", "recent");

    //Appread Big Search Field
    $('#bigSearch').fadeIn('slow');

    //Make Search smaller when typing into the big search box
    $('#bigSearchInput').on("keyup", function(){

        $('#bigSearch').slideUp('fast');
        $('#smallSearch').slideDown('fast');

        $('#smallSearchInput').val($('#bigSearchInput').val()).focus();
        $('#searchQuery').html($('#smallSearchSorting option:selected').text() + ' "' + $('#bigSearchInput').val() + '":');
        $('#titleSection').slideUp('fast');

        key = $('#smallSearchInput').val();
        sorting = $('#smallSearchSorting').val();
        search();

    });

    //When something is entered in the small Search input
    $('#smallSearchInput').on("keyup", function(){

        $('#searchQuery').html($('#smallSearchSorting option:selected').text() + ' "' + $('#smallSearchInput').val() + '":');
        if($('#smallSearchInput').val() == ""){
            $('#searchQuery').html($('#smallSearchSorting option:selected').text() + ':');
        }

        key = $('#smallSearchInput').val();
        sorting = $('#smallSearchSorting').val();
        search();

    });

    //When the Sorting selection is changed
    $('#smallSearchSorting').on('change', function(){

        $('#searchQuery').html($('#smallSearchSorting option:selected').text() + ' "' + $('#smallSearchInput').val() + '":');
        if($('#smallSearchInput').val() == ""){
            $('#searchQuery').html($('#smallSearchSorting option:selected').text() + ':');
        }

        key = $('#smallSearchInput').val();
        sorting = $('#smallSearchSorting').val();
        search();

    });

    //When a search button in pressed
    $('.searchButtons').each(function(){
        $(this).click(function(event){

            event.preventDefault();

            key = $('#smallSearchInput').val();
            sorting = $('#smallSearchSorting').val();
            search();

        });
    });

});
