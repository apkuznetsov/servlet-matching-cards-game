let cardElements = document.getElementsByClassName('game-card');
let cardElementsArray = [...cardElements];

let imgElements = document.getElementsByClassName('game-card-img');
let imgElementsArray = [...imgElements];

let movesCounter = document.getElementById('movesCounter');
let timeCounter = document.getElementById('timeCounter');

let openedCards = [];
let matchedCards = [];

let moves;
let second = 0;
let minute = 0;
let interval;

function shuffle(array) {
    let currIndex = array.length;

    let randomIndex;
    let tempVal;
    while (currIndex !== 0) {
        randomIndex = Math.floor(Math.random() * currIndex);
        currIndex -= 1;

        tempVal = array[currIndex];
        array[currIndex] = array[randomIndex];
        array[randomIndex] = tempVal;
    }

    return array;
}
