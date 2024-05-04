// Background.js  -- file that continoulsy runs in the backgroun
// use it to continously monitor for score value; send and receive data from server


// --------------------------------------------------------------
// GET loginData from chrome storage (received through login.js)

let url;
let time;
let userid;

chrome.storage.local.get(['loginData'], function(result) {
  console.log('Data retrieved from storage:', result.loginData);
  username = result.loginData.user_name
  userid = result.loginData.userid
});


// --------------------------------------------------------------------

// WEB SCRAP 

// function scrap() {
//   chrome.tabs.query({currentWindow: true, 'lastFocusedWindow': true, 'currentWindow': true}, function(tabs) {
//     tabs.forEach(function(tab) {
//       chrome.scripting.executeScript({
//         target: { tabId: tab.id },
//         func: getTextContent // Pass the function reference directly
//       });
//     });
//   });
// };

function scrap() {
  chrome.tabs.query({ active: true, currentWindow: true }, function(tabs) {
    // Ensure there's an active tab
    if (tabs.length > 0) {
      const activeTab = tabs[0];
      chrome.scripting.executeScript({
        target: { tabId: activeTab.id },
        func: getTextContent // Pass the function reference directly
      });
    } else {
      console.error("No active tab found.");
    }
  });
};

var textContent;
// Define the function to be executed in the content script
function getTextContent() {

  textContent = document.body.innerText;

  // Send the text content back to the background script
  chrome.runtime.sendMessage(textContent);
}

// Listen for messages from content scripts
chrome.runtime.onMessage.addListener(function(message, sender) {
  // Log the text content from each tab
  console.log(`Text content from tab ${sender.tab.id}: ${message}`);
});

chrome.tabs.onActivated.addListener((activeInfo) => {
  scrap()
})

chrome.tabs.onUpdated.addListener((tabId) => {
  scrap()
})
// scrap()




// ------------------------------------------
// Fetch active tab url

chrome.tabs.onActivated.addListener((activeInfo) => {
  chrome.tabs.query({'active': true, 'lastFocusedWindow': true, 'currentWindow': true}, function (tabs) {
      url = tabs[0].url;
      console.log(url);
      chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
        if (request.action === 'geturl') {
          sendResponse({ url:url});
          console.log("url sent to main page")
        }
      });
  });
});

chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {
  if (changeInfo.url) {
      console.log(changeInfo.url);
  }
});
console.log("url from outside ", url)
// --------------------------------------------------------------
// OPEN TIME OF TABS:
let tabOpenTime = {};

// Listen for tab activation
chrome.tabs.onActivated.addListener((activeInfo) => {
    const tabId = activeInfo.tabId;
    const currentTime = new Date().getTime();

    // Update start time if it's a new tab activation
    tabOpenTime[tabId] = currentTime;
});

// Listen for tab deactivation
chrome.tabs.onRemoved.addListener((tabId, removeInfo) => {
    // Check if tab exists in tabOpenTime
    if (tabOpenTime.hasOwnProperty(tabId)) {
        const startTime = tabOpenTime[tabId];
        const currentTime = new Date().getTime();
        const tabActiveDuration = (currentTime - startTime) / 1000; // Convert milliseconds to seconds
        console.log("Tab", tabId, "was active for", tabActiveDuration, "seconds.");
        // Remove tab from tabOpenTime to save memory
        delete tabOpenTime[tabId];
        

        //  ------SENDING DATA TO BACKEND --------------------------

      server_send_data(tabActiveDuration)
      
      // console.log(client_side_data)

        // ----------------------------------------------------------
        
    }
});

chrome.tabs.onActivated.addListener((activeInfo) => {
    const tabId = activeInfo.tabId;
    const currentTime = new Date().getTime();

    // Update start time if it's a new tab activation
    tabOpenTime[tabId] = currentTime;
});

function server_send_data(tabActiveDuration){
    const client_side_data = {
    url : url,
    time : tabActiveDuration,
    textContent :document.body.innerText,
    userid : userid
  };
  console.log(client_side_data)

}

// ------------------
let score = 78;
let username = ""


// ------------------------------------------------------------

// link background.js and index.js for data transmission

// let score = 28;
// let username = "Dileep"

chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.action === 'getDetails') {
    sendResponse({ score: score , username: username});
    console.log("Details sent to main page")
  }
});

// function dummy(){
//   if (score < 100){
//   score = score + 5}
// }

// setInterval(dummy, 2000)

// ------------------------------------------------------------------

//  SAMPLE CODE TO SHOW ALERT POPUP AND OPEN EXTENSION:

function check(){
  if (score <= 30){
    chrome.notifications.create({
      type: 'basic',
      iconUrl: './images/logo.png',
      title: "Mental Health Alert",
      message : "CLOSE THE SITE! This site has more negative impact on your health.",
    });

    // chrome.action.openPopup()
    // chrome.runtime.openOptionsPage()

    // chrome.windows.create({
    //   url: chrome.runtime.getURL('./index.html'),
    //   type : 'popup',
    //   height : 576,
    //   width : 290
    // })
    
    // OPEN NEW WEBPAGE
    // chrome.tabs.create({ url: chrome.runtime.getURL('index.html') });

}
};

check()
// setInterval(check, 1500)

console.log(url)