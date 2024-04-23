function getParam2 ( sname )
{
  var params = location.search.substr(location.search.indexOf("?")+1);
  var sval = "";
  params = params.split("&");
    // split param and value into individual pieces
    for (var i=0; i<params.length; i++)
       {
         temp = params[i].split("=");
         if ( [temp[0]] == sname ) { sval = temp[1]; }
       }
  return sval;
}

function getParamAsObject(){
  var params = location.search.substr(location.search.indexOf("?")+1);
  if (params == ""){
    return undefined;
  }
  return JSON.parse('{"' + decodeURI(params).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g,'":"') + '"}')
}
var traceon = true;

function getParam ( key )
{
  var obj = getParamAsObject();
  if (obj === undefined){
    return "";
  }
  return eval('obj.'+key);
}

function trace ( str ){
  if (traceon){
    console.log( str );
  }
}

function displayDiv( t ) {
  trace("displayDiv("+ t +")");
  var index;
  var alldivs = document.getElementsByClassName("toggle");
  for (index = 0; index < alldivs.length; ++index) {
    trace(t);
    if (t == "" || t == undefined || alldivs[index].id == t){
      alldivs[index].style.display = "block";
      alldivs[index].style.visibility = "visible";
    } else {
      alldivs[index].style.display = "none";
    };
  }
}
