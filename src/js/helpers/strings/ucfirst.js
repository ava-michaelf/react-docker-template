//uc first method
//ucfirst('hi');  #'Hi'
export default function (str) {
    str += '';
    var f = str.charAt(0)
    .toUpperCase();
    return f + str.substr(1);
};