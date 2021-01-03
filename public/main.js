var popup = document.getElementById("popup");
var successPopup = document.getElementById("popup-success");
var errorPopup = document.getElementById("popup-error");
var overlay = document.getElementById("body-overlay");
var close = document.getElementsByClassName("close-icon")[0];
var submit = document.getElementsByClassName("reg-btn")[0];
var reg_form = document.getElementById("reg-form");


document.getElementById("formBtn").addEventListener('click', showPopup);

close.addEventListener('click', hidePopup);
overlay.addEventListener('click', hidePopup);

function showPopup() {
    popup.classList.add("is--visible");
    overlay.classList.add('is-blacked-out');
}

function showSuccessPopup() {
    successPopup.classList.add("is--visible");
    overlay.classList.add('is-blacked-out');
}

function showErrorPopup() {
    errorPopup.classList.add("is--visible");
    overlay.classList.add('is-blacked-out');
}

function hidePopup() {
    popup.classList.remove("is--visible");
    overlay.classList.remove('is-blacked-out');
    successPopup.classList.remove("is--visible");
    errorPopup.classList.remove("is--visible");
}

reg_form.addEventListener('submit', function (e) {
    e.preventDefault();
    //convert form inputs to object
    var data = Object.fromEntries(new FormData(e.target).entries());

    fetch('/register', {
        method: 'POST', // or 'PUT'
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            console.log('Success:', data);
            showSuccessPopup();
        })
        .catch(function (error) {
            console.error('Error:', error);
            showErrorPopup();
        });
});

