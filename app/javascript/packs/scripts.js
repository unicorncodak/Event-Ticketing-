window.addEventListener('turbolinks:load', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple);
    }

    //check if event is paid
    const event_price = document.body.querySelector('#eventprice');
    const hidden = document.getElementById('hidden');
    const first = document.getElementById('flexRadioDefault1')
    const second = document.getElementById('flexRadioDefault2')
    first.addEventListener('click', event => {
        hidden.value = 1
        event_price.style.display = "block"
    });
    second.addEventListener('click', event => {
        hidden.value = 0
        event_price.style.display = "none"
    });
});


