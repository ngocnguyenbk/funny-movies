import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  like(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.id
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/api/movies/${id}/like`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({
        authenticity_token: csrfToken,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        location.reload()
      })
      .catch((error) => {
        console.log(error)
      })
  }

  dislike(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.id
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/api/movies/${id}/dislike`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({
        authenticity_token: csrfToken,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        location.reload()
      })
      .catch((error) => {
        console.log(error)
      })
  }
}
