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

function startGame() {
    shuffleImages();
    addDisplayCardListener();
    displayAllCards();
    resetMoves();
    resetTimer();
}

function shuffleImages() {
    let shuffledImages = shuffle(imgElementsArray);

    for (let i = 0; i < shuffledImages.length; i++) {
        cardElements[i].innerHTML = "";

        cardElements[i].appendChild(shuffledImages[i]);
        cardElements[i].type = `${shuffledImages[i].alt}`;

        cardElements[i].classList.remove("show", "open", "match", "disabled");
        cardElements[i].children[0].classList.remove("show-img");
    }
}

function addDisplayCardListener() {
    for (let i = 0; i < cardElementsArray.length; i++) {
        cardElementsArray[i].addEventListener("click", displayCard)
    }
}

function displayAllCards() {
    for (let i = 0; i < cardElements.length; i++) {
        cardElements[i].children[0].classList.add("show-img")
    }

    setTimeout(function () {
        for (let i = 0; i < cardElements.length; i++) {
            cardElements[i].children[0].classList.remove("show-img")
        }
    }, 1000)
}

function resetMoves() {
    moves = 0;
    movesCounter.innerText = moves;
}

function resetTimer() {
    timeCounter.innerHTML = '0 мин. 0 сек.';
    clearInterval(interval);
}

function displayCard() {
    this.children[0].classList.toggle('show-img');
    this.classList.toggle("open");
    this.classList.toggle("show");
    this.classList.toggle("disabled");

    openCard(this);
}

function openCard(card) {
    openedCards.push(card);

    let len = openedCards.length;
    if (len === 2) {
        countMoves();

        if (openedCards[0].type === openedCards[1].type) {
            matched();
        } else {
            unmatched();
        }
    }
}

function countMoves() {
    moves++;
    movesCounter.innerHTML = moves;

    if (moves === 1) {
        second = 0;
        minute = 0;

        startTimer();
    }
}
