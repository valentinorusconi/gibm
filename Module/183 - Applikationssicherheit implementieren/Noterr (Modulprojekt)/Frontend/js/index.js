var userGroup = undefined;
var userName = undefined;
var navbar = $('#appNavbar');
var content = $('#appContent');
var resetRequest = false;
var url_string = window.location.href ;

if(/*@cc_on!@*/false || !!document.documentMode){
    alert('Ihr Browser ist veraltet. Nutzen Sie Chrome oder Firefox.');
    throw new Error("Ihr Browser ist veraltet. Nutzen Sie Chrome oder Firefox.");
    exit();
}

if(url_string.indexOf('/resetPassword?') !== -1){
    resetRequest = true;
}

function formatDate(date, type){
    var date = new Date(date);
    var tag = date.getDate();
    var monat = date.getMonth()+1;
    var jahr = date.getFullYear();
    var stunde = date.getHours();
    var minute = date.getMinutes();
    var sekunde = date.getSeconds();
    if(type === 1){
        if(tag < 10){
            tag = '0'+tag.toString();
        } else if(monat < 10){
            monat = '0'+monat.toString();
        } else if(minute < 10){
            minute = '0'+minute.toString();
        } else if(stunde < 10){
            stunde = '0'+stunde.toString();
        } else if(sekunde < 10){
            sekunde = '0'+sekunde.toString();
        }
        return(jahr+'-'+monat+'-'+tag+'T'+stunde+':'+minute+':'+sekunde);
    } else if (type === 2){
        return(tag+'.'+monat+'.'+jahr+' um '+stunde+':'+minute+' Uhr.');
    }
}

function parseSpecial(data){
    if(data){

        var parser = new DOMParser;
        var dom = parser.parseFromString('<!doctype html><body>' + data,'text/html');
        return (dom.body.textContent);

    } else {
        return null;
    }
}

function alert(message, type){
    if(type == 'danger'){
        $('#danger_text').html(message);
        $('#danger_alert').slideDown('slow').delay('2500').slideUp('slow');
    } else {
        $('#success_text').html(message);
        $('#success_alert').slideDown('slow').delay('1500').slideUp('slow');
    }
}

function remove_alert(type){
    if(type == 'danger'){
        $('#danger_alert').slideUp('slow');
    } else {
        $('#success_alert').slideUp('slow');
    }
}

function get_call(url,params,callback){
    $.ajax({
        type: 'POST',
        data: params,
        url: '../Backend/get/'+url+'.php',
        success: function(resp) {
            callback(JSON.parse(resp));
        },
        error: function() {

        }
    });
}

function set_call(url,params,callback){
    $.ajax({
        type: 'POST',
        data: params,
        url: '../Backend/set/'+url+'.php',
        success: function(resp) {
            callback(JSON.parse(resp));
        },
        error: function() {

        }
    });
}

function startup(){
    if(userGroup == 1){
        content.html('');
        navbar.load('components/navbar.html');
        $.getScript('components/notes.js');
    } else if(userGroup == 2){
        content.html('');
        navbar.load('components/admin/navbar.html');
        $.getScript('components/notes.js');
    } else {
        content.load('components/login.html');
    }
}

function logout(){
    set_call('user/logout',{},function(){
        userGroup = userName = undefined;
        content.html('');
        navbar.html('');
        content.load('components/login.html');
    });
}

$(document).ready(function(){
    get_call('userGroup',{},function(data){
        if(data !== false){
            userName = data['username'];
            userGroup = data['usergroup'];
            startup();
        } else {
            logout();
        }
    });
});
