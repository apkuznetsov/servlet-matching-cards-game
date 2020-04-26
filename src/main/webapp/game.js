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