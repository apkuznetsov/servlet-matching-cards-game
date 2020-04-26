<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC
"-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd" >

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"
          content="text/html"
          http-equiv="Content-Type">
    <style type="">
        <%@include file="/style.css" %>
    </style>
    <title>Игра</title>
</head>
<body>

<div class="game-status">
    <span class="moves-counter">Ходы: </span>
    <span class="moves-counter" id="movesCounter"></span>
    <span class="time-counter">Время: </span>
    <span class="time-counter" id="timeCounter">0 мин. 0 сек.</span>
</div>

<table class="game-board">
    <tbody class="game-grid">
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake1" class="game-card-img" src="images/1.jpg">
        </td>
        <td class="game-card">
            <img alt="cake2" class="game-card-img" src="images/2.jpg">
        </td>
        <td class="game-card">
            <img alt="cake3" class="game-card-img" src="images/3.jpg">
        </td>
        <td class="game-card">
            <img alt="cake4" class="game-card-img" src="images/4.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake5" class="game-card-img" src="images/5.jpg">
        </td>
        <td class="game-card">
            <img alt="cake6" class="game-card-img" src="images/6.jpg">
        </td>
        <td class="game-card">
            <img alt="cake7" class="game-card-img" src="images/7.jpg">
        </td>
        <td class="game-card">
            <img alt="cake8" class="game-card-img" src="images/8.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake1" class="game-card-img" src="images/1.jpg">
        </td>
        <td class="game-card">
            <img alt="cake2" class="game-card-img" src="images/2.jpg">
        </td>
        <td class="game-card">
            <img alt="cake3" class="game-card-img" src="images/3.jpg">
        </td>
        <td class="game-card">
            <img alt="cake4" class="game-card-img" src="images/4.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake5" class="game-card-img" src="images/5.jpg">
        </td>
        <td class="game-card">
            <img alt="cake6" class="game-card-img" src="images/6.jpg">
        </td>
        <td class="game-card">
            <img alt="cake7" class="game-card-img" src="images/7.jpg">
        </td>
        <td class="game-card">
            <img alt="cake8" class="game-card-img" src="images/8.jpg">
        </td>
    </tr>
    </tbody>
</table>

<script type="">
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

    function startTimer() {
        interval = setInterval(function () {
            timeCounter.innerHTML = `${minute} мин. ${second} сек.`;

            second++;
            if (second === 60) {
                minute++;
                second = 0;
            }
        }, 1000)
    }

    function matched() {
        openedCards[0].classList.add("match");
        openedCards[1].classList.add("match");

        openedCards[0].classList.remove("show", "open");
        openedCards[1].classList.remove("show", "open");

        matchedCards.push(openedCards[0]);
        matchedCards.push(openedCards[1]);

        openedCards = [];

        if (matchedCards.length === 16) {
            endGame();
        }
    }

    function unmatched() {
        openedCards[0].classList.add("unmatched");
        openedCards[1].classList.add("unmatched");
        disable();

        setTimeout(function () {
            openedCards[0].classList.remove("show", "open", "unmatched");
            openedCards[1].classList.remove("show", "open", "unmatched");

            openedCards[0].children[0].classList.remove('show-img');
            openedCards[1].children[0].classList.remove('show-img');
            enable();

            openedCards = [];
        }, 1100)
    }

    function enable() {
        cardElementsArray.filter((card) => {
            card.classList.remove('disabled');

            for (let i = 0; i < matchedCards.length; i++) {
                matchedCards[i].classList.add('disabled');
            }
        })
    }

    function disable() {
        cardElementsArray.filter((card) => {
            card.classList.add('disabled');
        })
    }

    function endGame() {
        clearInterval(interval);
        matchedCards = [];
    }

    window.onload = function () {
        setTimeout(function () {
            startGame()
        }, 1200);
    };
</script>

</body>
</html>