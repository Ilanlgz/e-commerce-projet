document.addEventListener('DOMContentLoaded', function() {
    attachAjaxHandlers();
});

function attachAjaxHandlers() {
    document.querySelectorAll('a[data-ajax]').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            loadPage(link.getAttribute('href'));
        });
    });

    document.querySelectorAll('form[data-ajax]').forEach(function(form) {
        form.addEventListener('submit', function(event) {
            event.preventDefault();
            submitForm(form);
        });
    });
}

function loadPage(url) {
    fetch(url, {
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(response => response.text())
    .then(html => {
        document.getElementById('content').innerHTML = html;
        attachAjaxHandlers();
    })
    .catch(error => console.error('Error loading page:', error));
}

function submitForm(form) {
    const formData = new FormData(form);
    fetch(form.action, {
        method: form.method,
        body: formData,
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(response => response.text())
    .then(html => {
        if (form.action.includes('login')) {
            // Rediriger vers la page d'accueil après une connexion réussie
            loadPage('index.php?action=accueil');
        } else {
            document.getElementById('content').innerHTML = html;
            attachAjaxHandlers();
        }
    })
    .catch(error => console.error('Error submitting form:', error));
}