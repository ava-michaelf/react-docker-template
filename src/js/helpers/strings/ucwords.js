//uc first method
//ucfirst('hi');  #'Hi'
import ucfirst from './ucfirst';
export default function (str) {
    var words = str.split(' '), i;
    for (i = 0; i < words.length; i++) {
        words[i] = ucfirst(words[i]);
    }
    return words.join(' ');
};