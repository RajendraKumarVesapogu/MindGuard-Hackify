document.addEventListener('DOMContentLoaded', function() {
  const loginForm = document.getElementById('loginForm');

  if (loginForm) {
    loginForm.addEventListener('submit', async (event) => {
      event.preventDefault();

      // Get form input values
      const phoneNumber = document.getElementById('phonenum').value;
      const password = document.getElementById('password').value;

      // Create an object with form data
      const formData = {
        phone_number: phoneNumber,
        password: password
      };
      
      console.log(formData)
      try {
        // Send the form data to the server using fetch
        const response = await fetch('http://127.0.0.1:5000/user/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        });

        // Handle the response
        if (response.ok) {
          const data = await response.json();
          console.log('Response:', data);
          // send data to chrome storage (then to use in background.js)
          chrome.storage.local.set({ loginData: data });
          window.location.href = 'main.html';
        } else {
          console.error('Error submitting the form:', response.status);
          alert("Invalid Login Credentials")
        }
      } catch (error) {
        console.error('Error:', error);
        alert("Invalid Login Credentials")
      }
    });
  } else {
    alert("Invalid Login Credentials")
    console.error('Form element not found');
  }
});


