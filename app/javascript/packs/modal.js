document.addEventListener('turbolinks:load', function() {

  const selectModal = document.querySelector('.select-modal-body');
  const listName = document.querySelector('.list-name')
  const movieButton = document.querySelector('.btn-select-movie');
  movieButton.addEventListener('click', (e) => {
    const title = e.target.dataset.movieTitle;
    selectModal.innerText = `Add ${title} to ${listName.innerText}?`;
  })
});
