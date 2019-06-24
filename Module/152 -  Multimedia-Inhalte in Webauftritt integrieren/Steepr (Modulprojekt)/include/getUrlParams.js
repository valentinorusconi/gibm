//Get Parameters from URL
function getUrlParams(paramString) {
    if(paramString.charAt(0) == '?'){
        paramString = paramString.substr(1);
    }
    var paramList = paramString.split("&");
    var paramArray = new Array();
    for (var i = 0; i < paramList.length; i++) {
        var key = (paramList[i].split("="))[0];
        var value = (paramList[i].split("="))[1];
        paramArray[key] = value;
    }
    return paramArray;
}
