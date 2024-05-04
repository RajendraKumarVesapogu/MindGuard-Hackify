// let score = 0; // Initial score value
let username = "";
let score = 100
let url = "";

// LINK BETWEEN background.js AND index.js

// score transmission:
chrome.runtime.sendMessage({ action: 'getDetails' }, function(response) {
  if (response && response.score !== undefined) {
    handleScore(response.score)
    handleUsername(response.username)
    updateCircle()
    console.log("Details received to home screen from background.js")
  }
});

chrome.runtime.sendMessage({ action: 'geturl' }, function(response) {
  if (response && response.url !== undefined) {
    handleUrl(response.url)
    console.log("url received to home screen from background.js")
  }
});

// update 'score' in global scope
function handleScore(receivedScore){
  score = receivedScore
}

// update 'username' in global scope
function handleUsername(receivedUsername){
  username = receivedUsername
  // change welcome message based on user name
  const welcome = document.getElementById("welcome");
  welcome.innerText = `Welcome ${username} !`
}

function handleUrl(receivedUrl){
  url = receivedUrl
}


const client_side_data = {
  url : url,
  // time : tabActiveDuration,
  // textContent :textContent,
  // userid : userid
};
console.log(client_side_data)

function updateCircle() {
  const fillCircle = document.getElementById("fill-circle");
  const scoreSpan = document.getElementById("score");
  const heightValue = score; // Use score directly for height

  fillCircle.style.height = `${heightValue}%`;
  fillCircle.style.backgroundColor = `rgb(${255 - (2.55 * score)}, ${2.55 * score}, 0)`;

  scoreSpan.textContent = `${score}`;

  const button = document.getElementById("consult");
  const message = document.getElementById("message");
  if (0 <= score & score <= 30){
    button.style.display = "inline-block";
    message.innerText = "Your mental health is worse. Seek professional support.";
    message.style.color = `red`;

  }
  else if (31 <= score & score < 70){
    button.style.display = "none";
    message.innerText = "Your mental health is average. Pay attention.";
    message.style.color = `rebeccapurple`;
  }
  else{
    button.style.display = "none";
    message.innerText = "Your mental health is good. Keep it up!";
    message.style.color = `green`;
  }

}

function increasescore() {
  if (score > 2) {
    score -= 2; // Increase score by 5
    updateCircle();
  }
}



// increment button function
const increaseButton = document.getElementById('increasescore');
increaseButton.addEventListener('click', increasescore);

updateCircle(); // Initial circle update




// first the initialization happens, then function call, then remaining ( send message )