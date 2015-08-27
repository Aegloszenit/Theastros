function getData() {
    var xmlhttp = new XMLHttpRequest();
    var url = "https://api.nasa.gov/planetary/apod?api_key=grby9Q3yUSBHLrcDHxmpvYjadTyJ9FFAQpxBbBHR&format=JSON";

    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            myFunction(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function myFunction(response) {
    var arr = JSON.parse(response);

    apodimage.source = arr.url
    theapodtext.text = arr.explanation

}
